package com.arch.service;


import com.arch.model.um.user.User;
import com.arch.server.datatables.DataTablesRequest;
import com.arch.server.datatables.DataTablesResult;


public interface UserService {

    User findByUserName(String userName);
    DataTablesResult<User> findDatatables(DataTablesRequest request) throws IllegalAccessException;

}
