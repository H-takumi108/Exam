package bean;

public class Teacher implements java.io.Serializable {
	
	private String id;
	private String password;
	private String name;
	private String school;
	
	public String getId() {
		return id;
	}
 
	public String getPassword() {
		return password;
	}
	
	public String getName() {
		return name;
	}
	
	public String getSchool() {
		return school;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setSchool(String school) {
		this.school = school;
	}
}    