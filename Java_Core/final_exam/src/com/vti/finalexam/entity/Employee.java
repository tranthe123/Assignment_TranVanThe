package com.vti.finalexam.entity;

public class Employee extends User {

	private Project projectId;
	private String proSkill;

	public Employee(int id, String fullName, String email, String password, Project projectId, String proSkill) {
		super(id, fullName, email, password);
		this.projectId = projectId;
		this.proSkill = proSkill;
	}

	public Project getProjectedId() {
		return projectId;
	}

	public void setProjectedId(Project projectedId) {
		this.projectId = projectedId;
	}

	public String getProSkill() {
		return proSkill;
	}

	public void setProSkill(String proSkill) {
		this.proSkill = proSkill;
	}

}
