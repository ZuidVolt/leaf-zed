; =============================================================================
; Leaf Template Syntax Highlighting for Zed
; Matches the tree-sitter-leaf grammar (https://github.com/visualbam/tree-sitter-leaf)
; =============================================================================
; --- Leaf Directives ---------------------------------------------------------
; #if, #else, #elseif, #for, #while, #extend, #export, #import, #unless
(directive
  name: (directive_name) @keyword)

(directive_name) @keyword

; Control flow keywords as standalone tokens
((directive_name) @keyword
  (#match? @keyword
    "^(if|else|elseif|unless|for|while|extend|export|import|endif|endfor|endwhile|endunless)$"))

; --- Leaf Tag Expressions ----------------------------------------------------
; #(variable), #(user.name), #(count + 1)
(tag_expression
  "#(" @punctuation.special
  ")" @punctuation.special)

(variable_expression
  "#(" @punctuation.special
  ")" @punctuation.special)

; --- Identifiers / Variables -------------------------------------------------
(identifier) @variable

; Dotted access: user.name → highlight each part
(member_expression
  object: (identifier) @variable
  "." @punctuation.delimiter
  property: (identifier) @property)

; --- Operators ---------------------------------------------------------------
(binary_expression
  operator: _ @operator)

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
] @operator

; --- Literals ----------------------------------------------------------------
(string_literal) @string

(string) @string

(number_literal) @number

(number) @number

(boolean_literal) @boolean

(boolean) @boolean

; --- Comments ----------------------------------------------------------------
; Leaf doc comment: ///
(doc_comment) @comment.doc

; Regular single-line comment: //
(comment) @comment

(line_comment) @comment

; HTML comment: <!-- -->
(html_comment) @comment

; --- HTML Tags ---------------------------------------------------------------
(tag_name) @tag

(start_tag
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

(end_tag
  "</" @punctuation.bracket
  ">" @punctuation.bracket)

(self_closing_tag
  "<" @punctuation.bracket
  "/>" @punctuation.bracket)

; Doctype
(doctype) @tag.doctype

; --- HTML Attributes ---------------------------------------------------------
(attribute
  name: (attribute_name) @attribute)

(attribute_value) @string

(quoted_attribute_value) @string

; --- Punctuation / Delimiters ------------------------------------------------
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
  ";"
] @punctuation.delimiter

"#" @punctuation.special
