; Inject CSS into <style> blocks
((html_element
  (start_tag
    (tag_name) @_tag)
  (html_content
    (text) @injection.content))
  (#eq? @_tag "style")
  (#set! injection.language "css"))

; Inject JavaScript into <script> blocks
((html_element
  (start_tag
    (tag_name) @_tag)
  (html_content
    (text) @injection.content))
  (#eq? @_tag "script")
  (#set! injection.language "javascript"))
