package com.vti.finalexam.backend.presentationlayer;

import java.sql.SQLException;

import com.vti.finalexam.backend.bussinesslayer.UserService;
import com.vti.finalexam.entity.Project;

public class UserController {
	private UserService userService;

	public UserController() {
		userService = new UserService();
	}

	public void nhapTenProject(int projectID, int teamSize, int idManager, int idEmployees, int expInYear)
			throws SQLException {
		userService.nhapTenProject( projectID,  teamSize,  idManager,  idEmployees, expInYear);
	}

	public boolean isUserExists(String email, String pass) throws SQLException {
		return false;
	}

	public void inRaEmployee(int id, String fullName, String email, String password, Project projectId,
			String proSkill) {
		userService.inRaEmployee(id, fullName, email, password, projectId, proSkill);
	}

	public void inRaManager(int id, String fullName, String email, String password, int exInYear) {
		userService.inRaManager( id,  fullName,  email,  password, exInYear);
	}
}
