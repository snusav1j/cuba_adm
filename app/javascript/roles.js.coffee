$(document).on 'click', '.new-role', () ->
  $.ajax
    url: "/roles/new"
    dataType: "script"
    type: "GET"