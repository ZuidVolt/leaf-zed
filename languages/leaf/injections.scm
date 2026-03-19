; Inject CSS into <style> blocks
(html_element
  (start_tag
    (tag_name) @_tag
    (#eq? @_tag "style"))
  (html_content
    (text) @injection.content)
  (#set! injection.language "css")
  (#set! injection.combined))

; Inject JavaScript into <script> blocks
(html_element
  (start_tag
    (tag_name) @_tag
    (#eq? @_tag "script"))
  (html_content
    (text) @injection.content)
  (#set! injection.language "javascript")
  (#set! injection.combined))
