; Indent inside block directives
(if_directive) @indent

(for_directive) @indent

(while_directive) @indent

(unless_directive) @indent

(export_directive) @indent

(extend_directive) @indent

; Indent inside HTML elements
(html_element
  (end_tag) @end) @indent
