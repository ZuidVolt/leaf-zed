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

; SCOPED Operators (Prevents bleeding into JS/CSS injections!)
(for_header
  "in" @keyword.operator)

(binary_expression
  [
    "and"
    "or"
  ] @keyword.operator)

(unary_expression
  "not" @keyword.operator)

; Standard symbol operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&&"
  "||"
  "!"
  "?"
  "??"
  "="
] @operator

; --- HTML Tags & Attributes ---
(tag_name) @tag

(void_tag_name) @tag

(doctype) @tag.doctype

(attribute_name) @attribute

(attribute_value) @string

(quoted_attribute_value) @string

(unquoted_attribute_value) @string

; SCOPED HTML Brackets (Fixes <img /> and complex tag highlighting)
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

; High Priority: Forces Method Calls to be highlighted (e.g., user.format())
((call_expression
  (postfix_expression
    (member_expression
      (identifier) @function.method)))
  (#set! priority 150))

; High Priority: Forces Standalone Functions to be highlighted (e.g., count())
((call_expression
  (postfix_expression
    (primary_expression
      (identifier) @function)))
  (#set! priority 150))

; High Priority: Object Properties
((member_expression
  (identifier) @property)
  (#set! priority 150))

(for_header
  (identifier) @variable.special)

(dictionary_pair
  (identifier) @property)

; --- Literals ---
(string_literal) @string

(number_literal) @number

(boolean_literal) @boolean

(null_literal) @constant.builtin

(text) @text.literal

; --- Punctuation & Delimiters ---
"#(" @punctuation.special

; Scoped brackets (Matches individually to prevent impossible pattern errors)
(parenthesized_expression
  "(" @punctuation.bracket)

(parenthesized_expression
  ")" @punctuation.bracket)

(argument_list
  "(" @punctuation.bracket)

(argument_list
  ")" @punctuation.bracket)

(dictionary_literal
  "{" @punctuation.bracket)

(dictionary_literal
  "}" @punctuation.bracket)

(array_literal
  "[" @punctuation.bracket)

(array_literal
  "]" @punctuation.bracket)

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
