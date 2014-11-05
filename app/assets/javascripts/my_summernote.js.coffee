$ ->
  summer_note = $('.summernote')
  summer_note.summernote
    # to set options
    height:400
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

  summer_note1 = $('.summernote1')
  summer_note1.summernote
    # to set options
    height:100
    # lang: 'ko-KR'
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"

  # to set code for summernote
  summer_note1.code summer_note1.val()

  # to get code for summernote
  summer_note1.closest('form').submit ->
    # alert $('#page_body').code()
    summer_note1.val summer_note1.code()
    true



  summer_note2 = $('.summernote2')
  summer_note2.summernote
    # to set options
    height:100
    # lang: 'ko-KR'
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"

  # to set code for summernote
  summer_note2.code summer_note2.val()

  # to get code for summernote
  summer_note2.closest('form').submit ->
    # alert $('#page_body').code()
    summer_note2.val summer_note2.code()
    true

