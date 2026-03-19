; Indent inside block directives and un-indent on the closing tag
(if_directive
  (end_if_directive) @end) @indent

(for_directive
  (end_for_directive) @end) @indent

(while_directive
  (end_while_directive) @end) @indent

(unless_directive
  (end_unless_directive) @end) @indent

(export_directive
  (end_export_directive) @end) @indent

(extend_directive
  (end_extend_directive) @end) @indent

; Indent inside HTML elements and un-indent on the closing tag
(html_element
  (end_tag) @end) @indent
