package com.arch.service;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arch.model.um.user.QUser;
import com.arch.model.um.user.User;
import com.arch.repository.UserRepository;
import com.arch.server.datatables.DataTablesRequest;
import com.arch.server.datatables.DataTablesResult;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserRepository userRepository;
	
	@Override
	public User findByUserName(String userName) {
		return userRepository.findByUsername(userName);
	}
	
	
	@Override
	@Transactional(readOnly = true)
	public DataTablesResult<User> findDatatables(DataTablesRequest request)
			throws IllegalAccessException {
		Page<User> page = userRepository.findAll(request.searchPredicate(QUser.user),request);
		return new DataTablesResult<User>(request, page);
	}

}
