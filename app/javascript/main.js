const side_menu = document.getElementById('sidebar')
const menu_btn = document.getElementById('menu-btn')
const close_btn = document.getElementById('close-btn')
const theme_toggler = document.getElementById('theme-toggler')
const light_mod_btn = document.querySelector('.light-mode')
const dark_mod_btn = document.querySelector('.dark-mode')

const getCookie = (name) => {
  return document.cookie.split('; ').reduce((r, v) => {
    const parts = v.split('=')
    return parts[0] === name ? decodeURIComponent(parts[1]) : r
  }, '')
}

let light_mode = getCookie('light_mode')
let dark_mode = getCookie('dark_mode')

if (dark_mode == "1"){
  document.body.classList.add('dark-theme-variables')
  dark_mod_btn.classList.add('active')
  light_mod_btn.classList.remove('active')
}else{
  document.body.classList.remove('dark-theme-variables')
  dark_mod_btn.classList.remove('active')
  light_mod_btn.classList.add('active')
}
if (light_mode == "1"){
  document.body.classList.remove('dark-theme-variables')
  dark_mod_btn.classList.remove('active')
  light_mod_btn.classList.add('active')
}else{
  document.body.classList.add('dark-theme-variables')
  dark_mod_btn.classList.add('active')
  light_mod_btn.classList.remove('active')
}
menu_btn.addEventListener('click', () => {
  side_menu.style.display = "block"
})
close_btn.addEventListener('click', () => {
  side_menu.style.display = "none"
})

theme_toggler.addEventListener('click', () => {
  if (light_mod_btn.classList.contains('active')){
    document.body.classList.add('dark-theme-variables')
    light_mod_btn.classList.remove('active')
    dark_mod_btn.classList.add('active')
    document.cookie = "light_mode=0"
    document.cookie = "dark_mode=1"
  }else if (dark_mod_btn.classList.contains('active')){
    document.body.classList.remove('dark-theme-variables')
    light_mod_btn.classList.add('active')
    dark_mod_btn.classList.remove('active')
    document.cookie = "light_mode=1"
    document.cookie = "dark_mode=0"
  }
})

$(document).ready(function() {
	$('[data-confirm]').click(function(ev) {
		var href = $(this).attr('href');
    console.log(1)
		$('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
		$('#dataConfirmModal').modal('show')
		var confirmBtn = $('#dataConfirmModal').find('.confirm-btn')
    confirmBtn.addClass($(this).attr('data-confirm-action'))
    confirmBtn.removeClass('confirm-btn')
		return false;
	});
});

// $('.profile-photo-uploader').change(function(event) {
//   var output = document.querySelector('#photo-previev')
//   if (event.target.files.length >= 1){
//     $("#photo-previev").html('')
//   }
//   output.src = URL.createObjectURL(event.target.files[0]);
//   output.onload = function() {
//     URL.revokeObjectURL(output.src)
//   }
// })

