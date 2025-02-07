package com.sarinkejohn.MyTodos.login;

import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
	public boolean authenticate(String username,String password) {
		boolean isValidUsername = username.equals("john");
		boolean isValidPassword = password.equals("password");
		return isValidUsername && isValidPassword;
	}

}
