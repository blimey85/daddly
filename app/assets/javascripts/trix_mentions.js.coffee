window.Utility ||= {}

class Utility.TrixMentions
  MENTIONS_PATH = "/user/mentions?r"
  MENTIONS_DIV_ID = "#trix-mentions-"
  MENTIONS_INPUT_ID = MENTIONS_DIV_ID + "input-"

  @prepare: ($trix) ->
    mentionsDivForTrix = ($trix) ->
      $(MENTIONS_DIV_ID + $trix.attr('trix-id'))

    mentionsInputForTrix = ($trix) ->
      $(MENTIONS_INPUT_ID + $trix.attr('trix-id'))

    mentionsSelectizeForTrix = ($trix) ->
      mentionsInputForTrix($trix).next('.selectize-control')

    mentionsSelectizeDropdownForTrix = ($trix) ->
      mentionsInputForTrix($trix).next('.selectize-dropdown')

    createMentionsDivForTrix = ($trix) ->
      $trix.after("<trix-mentions id='trix-mentions-"+  $trix.attr('trix-id') + "'><input id='trix-mentions-input-" + $trix.attr('trix-id') + "'></input></trix-mentions>")

    initializeMentionsSelectize = ($trix) ->
      $.getJSON $trix.data(MENTIONS_PATH), (result) ->
        mentionsInputForTrix($trix).selectize
          create: false
          valueField: 'id'
          labelField: 'name'
          searchField: 'name'
          sortField: 'name'
          options: result.data
          selectOnTab: true
          onInitialize: ->
            @.disable()
            mentionsSelectizeForTrix($trix).css('left', -1000)
          onItemAdd: (value, $item) ->
            embed = "<span class='trix-mention'>@" + $item.text() + "</span>"
            attachment = new Trix.Attachment
              content: embed
              'attachment-type': 'trix-mention'
              'user-id': $item.data('value')
            $trix[0].editor.setSelectedRange([$trix.data('last-position') - 1, $trix.data('last-position')])
            $trix[0].editor.deleteInDirection('forward')
            $trix[0].editor.insertAttachment attachment
            mentionsDivForTrix($trix).hide()
          onBlur: ->
            mentionsDivForTrix($trix).hide()
            @.disable()
            mentionsSelectizeForTrix($trix).css('left', -1000)
            $trix.focus()
            if @.items.length == 0
              $trix[0].editor.setSelectedRange([$trix.data('last-position') - 1, $trix.data('last-position')])
              $trix[0].editor.deleteInDirection('forward')
          onDropdownClose: ->
            mentionsDivForTrix($trix).hide()
          onDropdownOpen: ($dropdown) ->
            rect = $trix[0].editor.getClientRectAtPosition($trix[0].editor.getPosition())
            if rect != undefined
              $dropdown.css('top', 34)
              if rect.left + 200 > $trix.offset().left + $trix.width()
                $dropdown.css('left', $trix.offset().left + $trix.width() - (rect.left + 210))
          onType: (str) ->
            rect = $trix[0].editor.getClientRectAtPosition($trix[0].editor.getPosition())
            if rect.left + 200 > $trix.offset().left + $trix.width()
              mentionsSelectizeDropdownForTrix($trix).css('left', $trix.offset().left + $trix.width() - (rect.left + 210))

    openMentionsSelectize = ($trix, editor) ->
      $trix.data 'last-position', editor.getPosition()

      mentionsInput = mentionsInputForTrix($trix)
      mentionsSelectize = mentionsSelectizeForTrix($trix)
      rect = editor.getClientRectAtPosition(editor.getPosition())

      mentionsSelectize.css('left', rect.left - 10)
      mentionsSelectize.css('top', rect.top - 4)
      mentionsInput[0].selectize.clear()
      mentionsInput[0].selectize.enable()
      mentionsDivForTrix($trix).show()
      mentionsInput[0].selectize.focus()

    if $trix.data(MENTIONS_PATH).length > 0
      createMentionsDivForTrix($trix)
      initializeMentionsSelectize($trix)
      $trix.on 'trix-change', ->
        editor = @.editor
        char = editor.getDocument().toString().charAt(editor.getPosition() - 1)
        openMentionsSelectize($(@), editor) if char == '@'
