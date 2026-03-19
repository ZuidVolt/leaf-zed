; === Surgical Injection Overwrites ===
; Set priority high so these win over the generic Leaf text highlighter!
; Inject CSS into <style> blocks
((html_element
  (start_tag
    (tag_name) @_tag
    (#eq? @_tag "style"))
  (html_content
    (text) @injection.content))
  (#set! injection.language "css")
  (#set! priority 160))

; Inject JavaScript into <script> blocks
((html_element
  (start_tag
    (tag_name) @_tag
    (#eq? @_tag "script"))
  (html_content
    (text) @injection.content))
  (#set! injection.language "javascript")
  (#set! priority 160))
