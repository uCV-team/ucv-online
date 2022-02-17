document.addEventListener('turbolinks:load', () => {
  handleSelect();
  window.enableSortable();
  loadTooltips();
  hideAlerts();
});

function handleSelect() {
  document.querySelectorAll('.language-switcher').forEach(function (item) {
    if (item) {
      if (window.location.host.split('.')[0] == 'en') item.getElementsByTagName('option')[1].selected = 'selected'
      else item.getElementsByTagName('option')[0].selected = 'selected';
    }
  });

  selectTag = document.getElementById('language-selector')
  if (selectTag) {
    selectTag.addEventListener("change", function () {
      value = selectTag.getElementsByTagName('option')[selectTag.selectedIndex].value
      if (location.origin.includes('://ucv')) {
        redirect_location = location.origin.replace('://', '://' + value + '.')
      } else {
        redirect_location = location.origin.replace(location.host.split('.')[0], value)
      }
      location.href = (redirect_location + location.pathname);
    })
  };
}

window.enableSortable = function () {
  var sort_edu = document.getElementById('sortable-edu');
  if (sort_edu) {
    var sortable = new Sortable(sort_edu, {
      handle: '.sort_handler',
      animation: 150,

      onEnd: function (event) {
        sorting_section = document.querySelectorAll('.list_edu');
        var sorting_params = [];
        for (var i = 0; i < sorting_section.length; i++) {
          data = sorting_section[i].dataset['id'];
          sorting_params.push(data);
        }
        var json_arr = JSON.stringify(sorting_params);
        var xmlhttp = new XMLHttpRequest();
        var form = new FormData;
        form.append("education", json_arr);
        xmlhttp.open('POST', '/cv/educations/update_positions', true);
        xmlhttp.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content);
        xmlhttp.send(form);
      }
    });
  }
  var sort_exp = document.getElementById('sortable');
  if (sort_exp) {
    var sortable = new Sortable(sort_exp, {
      handle: '.sort_handler',
      animation: 150,

      onEnd: function (event) {
        sorting_section = document.querySelectorAll('.list_exp');
        var sorting_params = [];
        for (var i = 0; i < sorting_section.length; i++) {
          data = sorting_section[i].dataset['id'];
          sorting_params.push(data);
        }
        var json_arr = JSON.stringify(sorting_params);
        var xmlhttp = new XMLHttpRequest();
        var form = new FormData;
        form.append("experience", json_arr);
        xmlhttp.open('POST', '/cv/experiences/update_positions', true);
        xmlhttp.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content);
        xmlhttp.send(form);
      }
    });
  }
};

(function() {
  const send = XMLHttpRequest.prototype.send
    XMLHttpRequest.prototype.send = function() {
      this.addEventListener('load', function() {
      $('[data-toggle="tooltip"]').tooltip();
      })
      return send.apply(this, arguments)
    }
})()

// Used to initialize tooltip on CV show page
function loadTooltips(){
  $('[data-toggle="tooltip"]').tooltip({
    html: true
  })
};

function hideAlerts() {
  var alertBar = document.getElementById('alert-bar')
  if (alertBar) {
    setTimeout(function () {
      alertBar.style.display = 'none'
    }, 6500); return false
  }
}
