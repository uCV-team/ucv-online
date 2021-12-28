document.addEventListener('turbolinks:load', function () {
  sidebarToggler();
});

window.sidebarToggler = function () {
  document.getElementById('sidebar-toggle').addEventListener('click', function (e) {
    var main_body = document.getElementById('admin-body')
    if (main_body.classList.contains('is-collapsed')) {
      main_body.classList.remove('is-collapsed')
    }
    else {
      main_body.classList.add('is-collapsed')
    }
    e.preventDefault();
  });
}