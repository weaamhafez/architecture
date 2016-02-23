package com.arch.service;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Resource
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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

	@Override
	public Page<User> findForSelect(String term, Pageable pageable) {
		term = "%" + StringUtils.defaultString(term) + "%";
		return userRepository.findByActiveAndNameLikeAllIgnoreCase(true, term, pageable);
	}
	
	@Modifying
	@Transactional(readOnly = false)
	public User saveOrUpdate(User user){
		// In case we are activate/deactivating the user
		if (user.getId() == null ) {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
		userRepository.save(user);

		return user;
	}
	
	@Override
	@Transactional
	public void remove(User user) {
		userRepository.delete(user);
	}


	@Override
	public User findById(Integer id) {
		return userRepository.findById(id);
	}
	
	@Modifying
	@Transactional(readOnly = false)
	public void activateUser(User user) {
		user.setActive(true);
		userRepository.save(user);

	}
	@Modifying
	@Transactional(readOnly = false)
	public void deactivateUser(User user) {
		user.setActive(false);
		userRepository.save(user);
	}
	
	@Override
	@Transactional
	public void changePassword(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		userRepository.save(user);
	}
}
