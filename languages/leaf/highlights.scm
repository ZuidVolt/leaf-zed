; =============================================================================
; Leaf Template Syntax Highlighting for Zed
; =============================================================================
; --- Leaf Directives & Tags --------------------------------------------------
; The parser registers these exact strings as tokens
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

; Closing directives are parsed as distinct structural nodes
(end_if_directive) @keyword

(end_for_directive) @keyword

(end_export_directive) @keyword

(end_extend_directive) @keyword

(end_unless_directive) @keyword

(end_while_directive) @keyword

; Middle structural nodes
(else_directive) @keyword

; Built-in Leaf operators
[
  "in"
  "and"
  "or"
  "not"
] @keyword.operator

; --- Variables & Identifiers -------------------------------------------------
(identifier) @variable

(attribute_name) @attribute

; --- Literals ----------------------------------------------------------------
(string_literal) @string

(number_literal) @number

(boolean_literal) @boolean

(null_literal) @constant.builtin

(text) @text.literal

; --- HTML / DOM --------------------------------------------------------------
(tag_name) @tag

(void_tag_name) @tag

(doctype) @tag.doctype

(html_comment) @comment

(quoted_attribute_value) @string

(unquoted_attribute_value) @string

; --- Operators ---------------------------------------------------------------
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

; --- Punctuation & Delimiters ------------------------------------------------
; Leaf's specific interpolation boundary
"#(" @punctuation.special

; General formatting
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

[
  "<"
  "</"
  ">"
  "/>"
] @punctuation.bracket
