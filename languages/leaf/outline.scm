; =============================================================================
; Leaf Template Symbol Outline for Zed
; Populates the Cmd+Shift+O menu
; =============================================================================
; 1. Show Leaf Exports in the outline (e.g., #export("content"))
(export_directive
  (export_header
    (string_literal) @name)) @item

(export_directive
  (export_header_block
    (string_literal) @name)) @item

; 2. Show Leaf Extends in the outline (e.g., #extend("base"))
(extend_directive
  (extend_header_with_colon
    (string_literal) @name)) @item

; 3. Show major HTML structural tags that have an ID (e.g., <main id="photo-grid">)
(html_element
  (start_tag
    (tag_name) @context
    (attribute
      (attribute_name) @_id
      (#eq? @_id "id")
      (quoted_attribute_value) @name))) @item
