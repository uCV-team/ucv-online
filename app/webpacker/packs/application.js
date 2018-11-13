import 'bootstrap/dist/js/bootstrap';
import jQuery from 'jquery';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';

window.$ = jQuery;
Rails.start();
Turbolinks.start();

$(function () {
    console.log('Hello World from Webpacker');
});
