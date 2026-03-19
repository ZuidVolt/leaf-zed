; Indent after opening Leaf block directives
(directive
  (directive_name) @_name
  (#match? @_name "^(if|unless|for|while)$")) @indent

; Indent inside HTML elements
(element
  (end_tag) @end) @indent
