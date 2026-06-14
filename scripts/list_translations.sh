#!/bin/bash
# Lists translation commits since the last tag in a changelog format.
set -e

LAST_TAG=$(git describe --tags --abbrev=0 HEAD^)
LAST_TAG_DATE=$(git log -1 --format=%aI "$LAST_TAG")

gh api repos/saber-notes/saber/commits \
  --method GET \
  --field since="$LAST_TAG_DATE" \
  --jq '
    .[]
    | select(
        (.commit.message | startswith("i18n: Update")) or
        (.commit.message | startswith("i18n: Add"))
      )
    | "  - \(.commit.message | split("\n")[0]) by @\(.author.login // .commit.author.name) in \(.sha)"
  '
