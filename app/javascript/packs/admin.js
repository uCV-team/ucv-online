import jQuery from 'jquery';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';

window.$ = jQuery;
Rails.start();
Turbolinks.start();

import 'jquery-ui-dist/jquery-ui';
import 'bootstrap/dist/js/bootstrap';

import DataTable from 'datatables/media/js/jquery.dataTables';
window.DataTable = DataTable;

// import '../src/admin/scripts/datatable/index';
