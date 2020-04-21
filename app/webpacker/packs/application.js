import 'babel-polyfill';
import 'bootstrap/dist/js/bootstrap';
import '../src/javascripts/address_autocomplete';
import '../src/javascripts/locationiq_maps';
import jQuery from 'jquery';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
require.context('../images', true)
require.context('../icons', true)

window.$ = jQuery;
Rails.start();
Turbolinks.start();

$(function () {
    console.log('Hello World from Webpacker');
});
