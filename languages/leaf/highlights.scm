; =============================================================================
; Leaf Template Syntax Highlighting for Zed
; =============================================================================
; --- Leaf Directives & Keywords ---
[
  "#if"
  "#else"
  "#else:"
  "#elseif"
  "#for"
  "#while"
  "#extend"
  "#export"
  "#import"
  "#unless"
  "#evaluate"
  "#capitalized"
  "#contains"
  "#count"
  "#date"
  "#lowercased"
  "#unsafeHTML"
  "#uppercased"
] @keyword

(end_if_directive) @keyword

(end_for_directive) @keyword

(end_export_directive) @keyword

(end_extend_directive) @keyword

(end_unless_directive) @keyword

(end_while_directive) @keyword

(else_directive) @keyword

(elseif_header) @keyword

[
  "in"
  "and"
  "or"
  "not"
] @keyword.operator

; --- HTML Tags & Attributes ---
(tag_name) @tag

(void_tag_name) @tag

(doctype) @tag.doctype

(attribute_name) @attribute

(attribute_value) @string

(quoted_attribute_value) @string

(unquoted_attribute_value) @string

; Precise capture for tag boundaries (Fixes mathematical operators and unhighlighted brackets)
(start_tag
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

(end_tag
  "</" @punctuation.bracket
  ">" @punctuation.bracket)

(html_self_closing_tag
  "<" @punctuation.bracket
  "/>" @punctuation.bracket)

; --- Variables & Functions ---
(identifier) @type

; Priority 200: Forces Method Calls & Standalone Functions (like count!) to highlight
((call_expression
  (postfix_expression
    (member_expression
      (identifier) @function.method)))
  (#set! priority 200))

((call_expression
  (postfix_expression
    (primary_expression
      (identifier) @function)))
  (#set! priority 200))

; Priority 190: Object Properties (like .name)
((member_expression
  (identifier) @property)
  (#set! priority 190))

(for_header
  (identifier) @type)

(dictionary_pair
  (identifier) @property)

; --- Literals & JS/CSS Fallback ---
(string_literal) @string

(number_literal) @number

(boolean_literal) @boolean

(null_literal) @constant.builtin

; Force <style> and <script> blocks to highlight entirely as a string literal
((html_element
  (start_tag
    (tag_name) @_tag)
  (html_content) @string)
  (#any-of? @_tag "script" "style")
  (#set! priority 150))

(text) @text.literal

; --- Operators ---
; We specifically scope the < and > math operators to binary expressions
; This prevents them from fighting with your HTML brackets!
(binary_expression
  "<" @operator)

(binary_expression
  ">" @operator)

; Safe global operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "=="
  "!="
  "<="
  ">="
  "&&"
  "||"
  "!"
  "?"
  "??"
  "="
] @operator

; --- Punctuation & Delimiters ---
"#(" @punctuation.special

; Because math < and > are scoped above, we can safely make HTML brackets global!
; This guarantees your <img /> brackets will ALWAYS be the correct punctuation color.
[
  "<"
  ">"
  "</"
  "/>"
] @punctuation.bracket

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  ","
  "."
  ":"
] @punctuation.delimiter

; --- Comments ---
(html_comment) @comment

((text) @comment
  (#match? @comment "^\\s*///?"))

; --- Built-in Leaf Tags ---
(count_tag) @function.builtin

(lowercased_tag) @function.builtin

(uppercased_tag) @function.builtin

(capitalized_tag) @function.builtin

(contains_tag) @function.builtin

(date_tag) @function.builtin

(unsafe_html_tag) @function.builtin

(dump_context_tag) @function.builtin
