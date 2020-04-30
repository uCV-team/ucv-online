let selectTag;

function handleSelect(){
  selectTag = document.getElementsByClassName("language-switcher")[0];
  if (selectTag.length > 0) {
    if (window.currentLocale == 'en') selectTag.getElementsByTagName('option')[0].selected = 'selected';
    else selectTag.getElementsByTagName('option')[1].selected = 'selected';

    selectTag.addEventListener('change', function(){
      let arr = window.location.host.split('.');
      arr[arr.length-1] = this.value;
      window.location = "http://"+arr.join('.')
    })
  }
}

$(document).on('turbolinks:load', () => {
  handleSelect();
});
