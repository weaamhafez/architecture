$(function() {

	var $userForm;
	var $changePasswordForm;
	var userValidator;
	var changePwdValidator;
	var userFormBackup ;
	
	$(document).ready(function() {

		$userForm = $("#user-form");
		$changePasswordForm = $("#change-password-form");
		userValidator = $userForm.validate();
		changePwdValidator = $changePasswordForm.validate();
		userFormBackup = JSON.stringify($userForm.serializeArray());
		
		$('.editUserCntrls').on('keyup change',function(){
			$(".editUserCntrls").each(function() {
				$( this ).val($( this ).val().replace(/\s/g, ''));
			});
		});
        $('#userModal').on('hidden.bs.modal', function () {
        	$("#resetBtn").triggerHandler("click");
        });
        $('#resetBtn').click(function(){
        	userValidator.resetForm();
        	var userFormBackupObj = JSON.parse(userFormBackup);
        	$.each(userFormBackupObj, function(index) {
        		console.log(userFormBackupObj[index]);
        		$( '#user-' + userFormBackupObj[index].name ).val( userFormBackupObj[index].value ); 
        		});
        });
        
		$('#saveUpdateBtn').click(function(){
			if (!$userForm.valid()) {
				return;
			}

			var url = "save_or_update";
            var request = $.post(url, $userForm.serialize() );
            var $btn = $(this).button('loading');

			request.success(function(){
				location.reload(false);
			});
			request.always(function(){
                $btn.button('reset');
            });

		});

		$('#deleteUser').click(function(){

			var url = "delete";
            var request = $.post(url, $userForm.serialize() );
            var $btn = $(this).button('loading');
			request.success(function(){
				window.location = '../user/';
			});
			request.error(function(data){
				alert(data.responseText);
			});
			request.always(function(){
                $btn.button('reset');
            });
		});
		$('#deactivateUser').click(function(){

			var url = "deactivate";
            var request = $.post(url, $userForm.serialize() );
            var $btn = $(this).button('loading');
			request.success(function(){
				window.location = '../user/';
			});
			request.error(function(data){
				alert(data.responseText);
			});
			request.always(function(){
                $btn.button('reset');
            });
		});
		$('#reactivateUser').click(function(){

			var url = "reactivate";
            var request = $.post(url, $userForm.serialize() );
            var $btn = $(this).button('loading');
			request.success(function(){
				window.location = '../user/';
			});
			request.error(function(data){
				alert(data.responseText);
			});
			request.always(function(){
                $btn.button('reset');
            });
		});

		$('#changePasswordBtn').on('click', function(){
			if (!$changePasswordForm.valid()) {
				return;
			}
			var url = "change_password";
            var request = $.post(url, $changePasswordForm.serialize() );
            var $btn = $(this).button('loading');
			request.success(function(){
				$('#changePasswordModal').modal('hide');
			});
			request.always(function(){
                $btn.button('reset');
            });

		});

		$('#changePasswordModal').on('hidden.bs.modal', function(){
		    $(this).find('form')[0].reset();
		});
	} );

});
