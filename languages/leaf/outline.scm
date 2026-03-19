; =============================================================================
; Leaf Template Symbol Outline for Zed
; Populates the Cmd+Shift+O menu
; =============================================================================
; 1. Show Leaf Exports in the outline
(export_directive
  (export_header) @name) @item

(export_directive
  (export_header_block) @name) @item

; 2. Show Leaf Extends in the outline
(extend_directive
  (extend_header) @name) @item

(extend_directive
  (extend_header_with_colon) @name) @item

; 3. Show major HTML structural tags that have an ID
(html_element
  (start_tag
    (tag_name) @name
    (attribute
      (attribute_name) @_id
      (#eq? @_id "id")))) @item
