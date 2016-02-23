package com.arch.service;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.arch.model.um.user.User;
import com.arch.server.datatables.DataTablesRequest;
import com.arch.server.datatables.DataTablesResult;


public interface UserService {

    User findByUserName(String userName);
    DataTablesResult<User> findDatatables(DataTablesRequest request) throws IllegalAccessException;
    
    Page<User> findForSelect(String term, Pageable pageable);
    
    User saveOrUpdate(User user) ;
    
    void remove(User user);
    
    User findById(Integer id);
    
    void changePassword(User user);
    
    void activateUser(User user);
    
    void deactivateUser(User user);

}
