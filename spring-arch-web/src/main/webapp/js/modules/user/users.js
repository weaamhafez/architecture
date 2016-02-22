var CLIENT_MANAGE_USER='user';
$(function(){

	$(document).ready(function() {

		var $userForm = $('#user-form');
		var validator = $userForm.validate();
		var dataTableUrl = "datatable";
        var usersTable = $('#usersTable').DataTable( {
			"processing": true,
			"serverSide": true,
			"ajax": dataTableUrl,
			"columns": [
				{
					"data": "name"

				},
				{ "data": "username" },
				{ 
					"data": "active",
					"render": function ( data, type, full, meta ) {
						return full.active?'<td align="center"><label for="fancy-checkbox-success" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span><span></span></label></td>':'<td align="center"><label for="fancy-checkbox-danger" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span><span> </span></label></td>';
					},
					
				},
				{ "data": "email" }
			]
		} );
	})

});