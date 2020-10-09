package com.vti.finalexam.backend.bussinesslayer;

import java.sql.SQLException;

import com.vti.finalexam.entity.Project;

public interface IUserService {
	public void nhapTenProject(int projectID, int teamSize, int idManager, int idEmployees, int expInYear)
			throws SQLException;

	public boolean isUserExists(String email, String pass) throws SQLException;

	public void inRaEmployee(int id, String fullName, String email, String password, Project projectId,
			String proSkill);

	public void inRaManager(int id, String fullName, String email, String password, int exInYear);
}
