$ ->
  summer_note = $('#page_body')
  summer_note.summernote
    # to set options
    height:500
    # lang: 'ko-KR'
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $('#page_body').code()
    summer_note.val summer_note.code()
    true