; Inject CSS into <style> blocks
(element
  (start_tag
    (tag_name) @_tag
    (#eq? @_tag "style"))
  (text) @injection.content
  (#set! injection.language "css"))

; Inject JavaScript into <script> blocks
(element
  (start_tag
    (tag_name) @_tag
    (#eq? @_tag "script"))
  (text) @injection.content
  (#set! injection.language "javascript"))
