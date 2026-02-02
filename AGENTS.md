# AI Agent Instructions

AI-generated code is not accepted upstream in saber-notes/saber.
But if you are using AI for other purposes, like for personal use or maintaining a community fork of Saber, follow these instructions.

Note: These instructions are fine-tuned for AI. If you are a human, see [CONTRIBUTING.md](.github/CONTRIBUTING.md) instead.

AI agents can find more instructions if needed on the wiki, e.g. [Maintainer notes](https://github.com/saber-notes/saber/wiki/Maintainer-notes).

## Style

- Your code should be idiomatic and readable.
- Avoid unnecessary complexity.
- Avoid nesting where possible. Guard statements are hugely preferable.
- Avoid big functions, they should do one thing and do it well. The entire function should be easily understood from the name alone.
- Document public members like widgets, classes, and methods in dartdoc comments.
- Avoid obvious comments that add no value. Avoid inline comments and comments within the body of methods, since they typically just add clutter and highlight that your code may be too convoluted.
- Follow good Flutter coding practices, like keeping widgets small and being mindful of the performance impact of `setState`.
- Always credit your AI agent's model name and any other relevant information at the top of each file changed (even if it's just a small change or refactor), e.g.:
  ```dart
  /// 🤖 Generated wholely or partially with Claude Code; Google Antigravity
  library;
  ```
  Never remove any AI credits. They are important for transparency.

## Testing

- Run the app and ensure your changes work as expected.
- Write tests for as much of your change as possible.
- Ideally, write tests *before* implementing the feature/fix. Follow the TDD (Test-Driven Development) approach. This ensures you've found the precise issue you're trying to fix.
- Don't delete existing tests. If they're failing, that highlights something wrong with your code. Don't say "we'll fix it later": later never comes. If you really cannot fix it, defer to a human or a more complex AI agent.

## Commits
- Follow the Conventional Commits format.
- Always include one or more emojis that represent your commit. Additionally include the sparkle emoji ✨.
- Always credit your AI agent's model name and any other relevant information.
- Include a short paragraph explaining how another AI agent could safely modify this change in the future.
- Keep commits small, focused, and atomic. They should be easily revertible.
- If your commit adds a new translatable string, only include the English translation in the commit. Then make a secondary commit like `i18n: auto translations 🗺️✨` with all the other languages' translations. This keeps the commit readable for other people, without clutter from a bajillion different string variants.

- A good commit message could be:
  ```
  fix: error with empty files 🪹✨
  
  Fixes a bug in FileManager.readFile where it would throw an error when reading an empty file.

  To safely modify this change in the future, another AI agent could follow these steps:
  1. Identify the root cause of the bug.
  2. Propose a solution that addresses the root cause.
  3. Write tests for the proposed solution.
  4. Implement the solution and run the tests to ensure it works as expected.
  
  🤖 Generated with Claude Code
  ```
