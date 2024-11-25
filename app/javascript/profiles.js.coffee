$(document).on 'dblclick', '.asd', (e) ->
  $.ajax
    url: "/profiles/test"
    dataType: "script"
    type: "GET"

$(document).on 'dblclick', '.profile-row', (e) ->
  user_id = $(this).attr("data-user-id")
  $.ajax
    url: "/users/edit_modal"
    dataType: "script"
    type: "GET"
    data:
      user_id: user_id

$(document).on 'click', '.show-profile', (e) ->
  user_id = $(this).parent('.profile-row').attr("data-user-id")
  $.ajax
    url: "/users/edit_modal"
    dataType: "script"
    type: "GET"
    data:
      user_id: user_id

$(document).on 'click', '.new-user', (e) ->
  $.ajax
    url: "/users/new"
    dataType: "script"
    type: "GET"

