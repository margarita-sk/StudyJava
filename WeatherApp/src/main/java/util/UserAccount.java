package util;

import lombok.Data;

/**
 * The {@code UserAccount} is an utility class for storing user information in
 * sessions
 * 
 * @author Margarita Skokova
 */
@Data
public class UserAccount {
	private String userName;
	private CredentialRole role;

	public enum CredentialRole {
		moderator, administrator
	}

	public CredentialRole checkCredentials() {
		return role;
	}

	public UserAccount() {
	}

	public UserAccount(String login, CredentialRole role) {
		this.userName = login;
		this.role = role;
	}
}
