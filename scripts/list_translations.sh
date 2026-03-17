#!/bin/bash
set -euo pipefail

declare -A USER_CACHE

# Filter commits to those since the last tag
RANGE="$(git describe --tags --abbrev=0 HEAD^)..HEAD"

git log "$RANGE" --pretty='%H|%an|%ae|%s' \
  | grep -i '^.*|.*|.*|i18n: \(Add\|Update\)' \
  | while IFS='|' read -r sha name email subject; do

    # Get GitHub username
    if [[ -n "${USER_CACHE[$email]:-}" ]]; then
      user="${USER_CACHE[$email]}"
    else
      user=$(gh api \
        -H "Accept: application/vnd.github+json" \
        "/search/users?q=${email}+in:email" \
        --jq '.items[0].login' 2>/dev/null || true)

      if [[ -z "$user" || "$user" == "null" ]]; then
        user="$name" # Fallback to author name
      else
        user="@$user"
      fi
      USER_CACHE[$email]="$user"
    fi

    echo "${subject} by ${user} in ${sha}"
done
