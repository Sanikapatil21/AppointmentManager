package com.r3sys.db;

public class Employee {
	static String email,password;
	static int empID;
	
	public static void setEmpID(int empID) {
		Employee.empID = empID;
	}
	
	public static int getEmpID() {
		return empID;
	}

	public static String getEmail() {
		return email;
	}

	public static void setEmail(String email) {
		Employee.email = email;
	}

	public static String getPassword() {
		return password;
	}

	public static void setPassword(String password) {
		Employee.password = password;
	}

}
