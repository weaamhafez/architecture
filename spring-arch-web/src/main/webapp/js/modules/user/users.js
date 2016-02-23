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
					"data": "name",
					"render": function ( data, type, full, meta ) {
						return '<a href="show?id='+full.id+'" style="color:red;">' + (data || 'No name') + '</a>';
					}

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
        $('.createUserCntrls').on('keyup change',function(){
			$(".createUserCntrls").each(function() {
				$( this ).val($( this ).val().replace(/\s/g, ''));
			});
		});
        $('#userModal').on('hidden.bs.modal', function () {
        	validator.resetForm();
			$('#user-form').find("input[type=text],input[type=mobileNumber],input[type=emailFull],input[type=password], textarea").val("");
        });

		$('#saveUpdateBtn').click(function(){
			
			
			if (!$userForm.valid()) {
				return;
			}
			var data = {};
			$userForm.serializeArray().map(function(x){data[x.name] = x.value;});
			var url = "save_or_update";
            var request = $.post(url, data );
            var $btn = $(this).button('loading');
			request.success(function(){
				usersTable.ajax.reload();
				validator.resetForm();
				$('#user-form').find("input[type=text],input[type=mobileNumber],input[type=emailFull],input[type=password], textarea").val("");
				$('#userModal').modal('hide');
			});

			request.error(function(data){
				alert(data.responseText);
			});
			request.always(function(){
                $btn.button('reset');
            });
		});

		
	})

});