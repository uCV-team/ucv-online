import 'bootstrap/dist/js/bootstrap';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';

Rails.start();
Turbolinks.start();

$(function () {
    console.log('Hello World from Webpacker');
});
