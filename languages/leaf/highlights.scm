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

; --- Variables & Functions ---
; 1. Base variables (like 'user' in 'user.name')
(identifier) @type

; 2. Method Calls (e.g., the 'format' in 'user.format()')
(call_expression
  (postfix_expression
    (member_expression
      (identifier) @function.method)))

; 3. Standalone Function Calls (e.g., 'count(photos)')
(call_expression
  (postfix_expression
    (primary_expression
      (identifier) @function)))

; 4. Object Properties (e.g., the 'name' in 'user.name')
(member_expression
  (identifier) @property)

; 5. Specific highlighting for loop variables (e.g., 'photo' in '#for(photo in photos)')
(for_header
  (identifier) @variable.special)

; 6. Dictionary/JSON keys
(dictionary_pair
  (identifier) @property)

; --- Literals ---
(string_literal) @string

(number_literal) @number

(boolean_literal) @boolean

(null_literal) @constant.builtin

(text) @text.literal

; --- Operators ---
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

; --- Punctuation & Delimiters ---
"#(" @punctuation.special

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  "<"
  "</"
  ">"
  "/>"
] @punctuation.bracket

[
  ","
  "."
  ":"
] @punctuation.delimiter

; --- Comments ---
(html_comment) @comment

; Regex fallback to catch Leaf's /// and // comments inside raw text
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
