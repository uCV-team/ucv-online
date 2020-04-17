import 'babel-polyfill';
import '../src/javascripts/bootstrap';
import '../src/javascripts/address_autocomplete';
import '../src/javascripts/google_maps';
import jQuery from 'jquery';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
require.context('../images', true)

window.$ = jQuery;
Rails.start();
Turbolinks.start();

$(function () {
    console.log('Hello World from Webpacker');
});
