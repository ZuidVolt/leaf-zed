; =============================================================================
; Leaf Template Syntax Highlighting for Zed
; =============================================================================
; --- Leaf Directives & Keywords ---
; Mapped to standard keywords
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

; Precise captures for loop syntax (photo, photos, in)
(for_header
  (identifier) @variable.special
  "in" @keyword.operator
  (expression
    (identifier) @variable))

; --- HTML Tags & Attributes ---
(tag_name) @tag

(void_tag_name) @tag

(doctype) @tag.doctype

(attribute_name) @attribute

(attribute_value) @string

(quoted_attribute_value) @string

(unquoted_attribute_value) @string

; Precise HTML bracket matches (Fixes <img /> and complex tag highlighting)
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
; The base fallback for all standard variables
(identifier) @variable

; Precision Function: Highlights method call name (e.g., 'name' in user.name)
((call_expression
  (postfix_expression
    (member_expression
      (identifier) @function.method)))
  (#set! priority 150))

; Precision Function: Highlights the standalone function name (e.g., 'count' in count())
((call_expression
  (postfix_expression
    (primary_expression
      (identifier) @function)))
  (#set! priority 150))

; Precision Property: user.isPro (.isPro is function color)
((member_expression
  (identifier) @property)
  (#set! priority 150))

; Precison Variable: Loop context variables
(dictionary_pair
  (identifier) @property)

; --- Literals ---
(string_literal) @string

(number_literal) @number

(boolean_literal) @boolean

(null_literal) @constant.builtin

; Catches generic text (like 'Shots from Perth') - Mapped to a neutral text token
(text) @text.literal

; --- Operators ---
; High-priority captures for mathematical and logical operators
(binary_expression
  ">" @operator)

(binary_expression
  [
    "and"
    "or"
  ] @operator)

(unary_expression
  "not" @operator)

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

; Precise capture for control tag and function parentheses (fixes unhighlighted brackets)
(parenthesized_expression
  "(" @punctuation.bracket
  ")" @punctuation.bracket)

(argument_list
  "(" @punctuation.bracket
  ")" @punctuation.bracket)

(dictionary_literal
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(array_literal
  "[" @punctuation.bracket
  "]" @punctuation.bracket)

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

; --- Built-in Leaf Tag Functions ---
; Mapped specifically to Builtin colors so they look like functions (Date, Count)
(count_tag) @function.builtin

(lowercased_tag) @function.builtin

(uppercased_tag) @function.builtin

(capitalized_tag) @function.builtin

(contains_tag) @function.builtin

(date_tag) @function.builtin

(unsafe_html_tag) @function.builtin

(dump_context_tag) @function.builtin

(leaf_directive_in_attribute
  (leaf_directive) @function.builtin)
