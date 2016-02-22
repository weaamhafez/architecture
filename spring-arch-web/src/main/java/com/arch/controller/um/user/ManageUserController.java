package com.arch.controller.um.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.arch.model.um.user.User;
import com.arch.server.datatables.DataTable;
import com.arch.server.datatables.DataTablesRequest;
import com.arch.server.datatables.DataTablesResult;
import com.arch.service.UserService;


import static com.arch.server.utils.AppConstants.*;


@Controller
@RequestMapping(CLIENT_MANAGE_USER)
public class ManageUserController {

    public static final String SHOW = "show";
    public static final String DATATABLE = "datatable";
    private static final Logger logger = LoggerFactory
            .getLogger(ManageUserController.class);
    @Autowired
    private UserService userService;


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
}
