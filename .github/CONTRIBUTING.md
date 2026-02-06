# Contributing

Thanks for your interest in contributing to Saber.
I maintain this project in limited spare time, so the contribution rules below are strict by necessity.

## Requirements

### 1. Tiny PRs

I am currently only accepting tiny focused pull requests, for example:
- A specific bug fix
- Completing one of the ["help wanted" issues](https://github.com/saber-notes/saber/issues?q=state%3Aopen%20label%3A%22help%20wanted%22)
- Translations

    Note: Translations are exempt from the majority of these guidelines.
    See [Translating](https://github.com/saber-notes/saber/wiki/Translating) on the wiki for more information.

If your pull request makes multiple changes, try to split it into multiple separate pull requests. I'd much prefer ten 10-line PRs over one 100-line PR.

I appreciate that some may wish to contribute non-tiny PRs and new features, but reviewing pull requests is tiring work. There isn't a team behind Saber, just one hobbyist with limited energy.

As a rule of thumb, if you would feel disappointed that all your work went to waste if the PR is rejected, it's too big of a PR.

### 2. Link to an issue

Your pull request must be [linked to an issue](https://docs.github.com/articles/closing-issues-using-keywords).

If there is no existing issue for your proposed change, please open one first and then link your PR to that issue.

This helps provide context for your change and it means the issue can be re-opened later if the PR gets reverted.

### 3. Test everything

Your pull request must be covered by tests.
All new and existing tests must pass.

If you cannot add tests for your change, please explain why in the PR description.

Try to follow existing test patterns and conventions.

### 4. Document public members

Add useful dartdoc comments for most new widgets, classes, and methods.

Avoid obvious comments that add no value, and avoid comments within the body of methods where possible.

Try to follow existing documentation patterns and conventions.

### 5. AI

Don't generate code for this project using AI chatbots or agents.

Reviewing and maintaining AI-generated code is a drain on contributor time, which could be better spent elsewhere.

Autocomplete tools may be used at your discretion, but all submitted code must be fully designed, written, and understood by you.

## Review time

Pull requests may be accepted or rejected at my discretion.

I may request changes to your pull request before it is accepted. Please address these within the same pull request, rather than opening a new one.

In some cases, I may need to tweak your branch before merging (e.g. for style issues, minor bug fixes, or merge conflicts). In other cases, I may need to close your PR and reimplement your changes due to unresolvable issues. You will be credited as the author or co-author in the final commit if so.

By submitting a pull request, you agree to license your contribution under the same license as the project: see [LICENSE](../LICENSE).

Thank you for your understanding and cooperation!
