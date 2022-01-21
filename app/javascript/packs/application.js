/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// console.log('Hello World from Webpacker')
// import 'babel-polyfill';

// require("jquery");

// import Rails from 'rails-ujs';
// import Turbolinks from 'turbolinks';
// Rails.start();
// Turbolinks.start();

// require.context('../src/javascripts', true);
// require.context('../images', true);
// require.context('../icons', true);
// import 'jquery-ui-dist/jquery-ui';

// window.Rails = Rails


import 'babel-polyfill';
import '../src/javascripts/address_autocomplete';
import '../src/javascripts/homepage_map';
import '../src/javascripts/search_map'
import '../src/javascripts/custom';
import '../src/javascripts/custom_navbar';
import '../src/javascripts/homepage_scroller';
import jQuery from 'jquery';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
require.context('../images', true)
require.context('../icons', true)

import Sortable from 'sortablejs/Sortable.js';
window.Sortable = Sortable;
window.$ = jQuery;
Rails.start();
Turbolinks.start();

import 'jquery-ui-dist/jquery-ui';
import 'bootstrap/dist/js/bootstrap';
import 'trix/dist/trix';
