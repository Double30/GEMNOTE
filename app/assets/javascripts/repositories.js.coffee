# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#repositories_show').ready ->
  $tabs = $('.tab-item')
  $containers = $('.noteContainer-list')

  switchContainer = ($container) ->
    $containers.removeClass('is_actived')
    $container.addClass('is_actived')
    return $container

  switchTab = ($tab) ->
    targetID = $tab.attr('for')
    $tabs.removeClass('is_actived')
    $tab.addClass('is_actived')
    switchContainer($("##{targetID}"))
    return $tab

  $tabs.each ->
    $(this).click ->
      switchTab($(this))




















