class Modal

  @load: ->
    that = this
    $(document).on 'click', '[data-toggle=modal]', ->
      targetID = $(this).attr('data-target')
      that.openModal(targetID)

  @openModal: (target) ->
    $(target).appendTo('body')
    $(target).addClass('is-active')
    @addMask()
    that = this
    $(target).find('.modal-close').click ->
      $(target).removeClass('is-active')
      that.closeModal()
      return false

  @closeModal: (targetID) ->
    $('.modal-mask').removeClass('is-active')
    @removeMask()

  @addMask: () ->
    if @isMaskExist()
      $('.modal-mask').addClass('is-active')
    else
      $('body').append('<div class="modal-mask is-active"></div>')

  @removeMask: () ->
    if @isMaskExist()
      $('.modal-mask').removeClass('is-active')
    return false

  @isMaskExist: ()->
    $('.modal-mask').length > 0

$().ready ->
  Modal.load()