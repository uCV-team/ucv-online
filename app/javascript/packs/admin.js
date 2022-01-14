import '../src/admin/scripts/base';
import '../src/admin/scripts/trix_attachment';
import jQuery from 'jquery';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';

window.$ = jQuery;
Rails.start();
Turbolinks.start();

import 'jquery-ui-dist/jquery-ui';
import 'bootstrap/dist/js/bootstrap';
import 'trix/dist/trix';

import DataTable from 'datatables/media/js/jquery.dataTables';
window.DataTable = DataTable;
