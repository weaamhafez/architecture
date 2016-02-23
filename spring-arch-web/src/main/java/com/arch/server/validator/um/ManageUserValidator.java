package com.arch.server.validator.um;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.arch.model.um.user.User;
import com.arch.server.exception.BadRequestException;
import com.arch.server.exception.NoPermissionException;
import com.arch.server.exception.NotExistsException;
import com.arch.server.utils.PrincipalUtils;

@Component
public class ManageUserValidator{


    public void validateRemove(User user) throws NotExistsException, NoPermissionException {
        userNotNull(user);
        if (user.getId().equals(PrincipalUtils.principal().getId())) {
            throw new NoPermissionException("You can't delete yourself");
        }
    }
    
    public void validateSaveOrUpdate(User user) throws BadRequestException {
        if (StringUtils.isEmpty(user.getName())) {
            throw new BadRequestException("Name is required");
        }
        if (StringUtils.isEmpty(user.getEmail())) {
            throw new BadRequestException("Email is required");
        }
        if (StringUtils.isEmpty(user.getUsername())) {
            throw new BadRequestException("Username is required");
        }
        if (user.getId() == null && StringUtils.isEmpty(user.getPassword())) {
            throw new BadRequestException("Password is required");
        }

    }
    
    public void validateShow(User user) throws NotExistsException, NoPermissionException {
        userNotNull(user);
    }
    
    public void validateActivation(User user) throws NotExistsException, NoPermissionException {
        userNotNull(user);
        if (user.getId().equals(PrincipalUtils.principal().getId())) {
            throw new NoPermissionException("You can't deactivate/activate yourself");
        }
    }
    
    public void validateChangePassword(User user) throws NotExistsException, BadRequestException {
        userNotNull(user);
        notEmptyPassword(user);
    }
    
    private void notEmptyPassword(User user) throws BadRequestException {
        if (StringUtils.isEmpty(user.getPassword())) {
            throw new BadRequestException("Password must not be empty");
        }
    }
    
    public void userNotNull(User user) throws NotExistsException {
		if (user == null) {
			throw new NotExistsException("User is not exist");
		}
	}
}
