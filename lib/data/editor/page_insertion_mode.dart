enum PageInsertionMode {
  inherit,          // Inherit the exact same style as the current/preceding page
  notebookDefault,  // Use the global notebook default style
  customStyle,      // Provide a specific custom PageStyle or Template
  duplicate,        // Deep-duplicate the page content (handled via separate copy logic)
}
