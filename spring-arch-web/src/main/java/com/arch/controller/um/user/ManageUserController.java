package com.arch.controller.um.user;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.arch.model.um.user.User;
import com.arch.server.datatables.DataTable;
import com.arch.server.datatables.DataTablesRequest;
import com.arch.server.datatables.DataTablesResult;
import com.arch.server.exception.BadRequestException;
import com.arch.server.exception.NoPermissionException;
import com.arch.server.exception.NotExistsException;
import com.arch.server.validator.um.ManageUserValidator;
import com.arch.service.UserService;

import org.springframework.http.HttpStatus;

import static com.arch.server.utils.AppConstants.*;


@Controller
@RequestMapping(CLIENT_MANAGE_USER)
public class ManageUserController {

    public static final String SHOW = "show";
    public static final String DATATABLE = "datatable";
    public static final String SELECT = "select";
    public static final String SAVE_OR_UPDATE = "save_or_update";
    public static final String DELETE = "delete";
    public static final String CHANGE_PASSWORD = "change_password";
    public static final String DEACTIVATE = "deactivate";
    public static final String REACTIVATE = "reactivate";
    private static final Logger logger = LoggerFactory
            .getLogger(ManageUserController.class);
    @Autowired
    private UserService userService;
    
    @Autowired
    private ManageUserValidator manageUserValidator;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String entry() {
        return "users";
    }


    @RequestMapping(value = DATATABLE, method = RequestMethod.GET)
    @ResponseBody
    public DataTablesResult<User> users(@DataTable DataTablesRequest pageable)
            throws IllegalAccessException {
    	logger.info("Entering findUsers...");
        return userService.findDatatables(pageable);
    }
    
    @RequestMapping(value = SHOW, method = RequestMethod.GET)
    public String show(@RequestParam("id") Integer userId, ModelMap model)
            throws IllegalAccessException, NotExistsException, NoPermissionException {

        User user = userService.findById(userId);
        manageUserValidator.validateShow(user);

        model.addAttribute("user", user);
        return  "user";
    }

    @RequestMapping(value = SAVE_OR_UPDATE, method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public void saveOrUpdate(User user) throws BadRequestException
      {
        logger.debug( "Entering save user( name=" + user.getName()
                + " , userName =" + user.getUsername() + ")");

        manageUserValidator.validateSaveOrUpdate(user);
        userService.saveOrUpdate(user);

    }

    @RequestMapping(value = DELETE, method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void remove(@RequestParam("user") User user)
            throws NotExistsException, NoPermissionException {
        logger.debug( "Entering remove user( id=" + user.getId() + ")");

        manageUserValidator.validateRemove(user);
        userService.remove(user);

        logger.debug("Leaving remove user");
    }
    
    @RequestMapping(value = DEACTIVATE, method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void deactivate(@RequestParam("user") User user)
            throws NotExistsException, NoPermissionException {
        manageUserValidator.validateActivation(user);

        userService.deactivateUser(user);
    }

    @RequestMapping(value = REACTIVATE, method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void reactivate(@RequestParam("user") User user)
            throws NotExistsException, NoPermissionException{
        manageUserValidator.validateActivation(user);

        userService.activateUser(user);
    }
    
    @RequestMapping(value = CHANGE_PASSWORD, method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void changePassword(User user) throws NotExistsException,
            BadRequestException {
        manageUserValidator.validateChangePassword(user);
        userService.changePassword(user);
    }

    
    @ExceptionHandler(BadRequestException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public String handleBadRequestException(BadRequestException ex) {
        return ex.getMessage();
    }

    @ExceptionHandler(NoPermissionException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public String handleNoPermissionException(NoPermissionException ex) {
        return ex.getMessage();
    }
}
