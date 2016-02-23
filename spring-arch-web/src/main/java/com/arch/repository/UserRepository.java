package com.arch.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.arch.model.um.user.User;


@Repository
public interface UserRepository extends PagingAndSortingRepository<User, Integer>, QueryDslPredicateExecutor<User>{
	
	User findByUsername(String username);
	Page<User> findByActiveAndNameLikeAllIgnoreCase(boolean active,String name, Pageable pageable);
	
	User findById(Integer id);
	
}
