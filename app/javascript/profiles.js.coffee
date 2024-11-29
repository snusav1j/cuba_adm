$(document).on 'change', '#formFileLg ', (e) ->
  file_obj = $('input#formFileLg')[0].files[0]
  if file_obj != undefined && file_obj != ''
    profile_photo = new FormData()
    profile_photo.append('profile_photo', file_obj)
    user_id = $('#user_id').text()
    $.ajax
      url: "/user_profiles/change_profile_photo?id=#{user_id}"
      type: 'post'
      dataType: 'script'
      processData: false
      contentType: false
      data: profile_photo
      
  else
    toastr.error('Выберите файл для загрузки.')

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

