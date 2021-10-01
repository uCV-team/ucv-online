// import jQuery from 'jquery';
// import Rails from 'rails-ujs';
// import Turbolinks from 'turbolinks';

// window.$ = jQuery;
// Rails.start();
// Turbolinks.start();

// import 'jquery-ui-dist/jquery-ui';

// import DataTable from 'datatables/media/js/jquery.dataTables';
// window.DataTable = DataTable;
// import '../src/admin/scripts/datatable/index';

import 'babel-polyfill';
import '../src/javascripts/address_autocomplete';
import '../src/javascripts/homepage_map';
import '../src/javascripts/search_map'
import '../src/javascripts/custom';
import '../src/javascripts/custom_navbar';
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

import DataTable from 'datatables/media/js/jquery.dataTables';
window.DataTable = DataTable;
// import '../src/admin/scripts/datatable/index';

$(function () {
  console.log('Hello World from Webpacker');
});
