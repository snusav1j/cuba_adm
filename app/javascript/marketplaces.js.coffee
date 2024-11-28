$(document).on 'click', '.new-marketplace', (e) ->
  $.ajax
    url: "/market_places/new"
    dataType: "script"
    type: "GET"
