package com.arch.server.utils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.arch.model.um.user.User;


public class PrincipalUtils {

    private PrincipalUtils() {
    }

    public static User principal() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication == null ? null : (User) authentication.getPrincipal();
    }

}
