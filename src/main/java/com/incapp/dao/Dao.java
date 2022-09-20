package com.incapp.dao;

import java.io.InputStream;
import java.sql.*;
import java.util.*;
public class Dao {

private Connection c;
	
	public Dao() throws ClassNotFoundException,SQLException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		c=DriverManager.getConnection("jdbc:mysql://localhost:3306/bluepilotdb","root","ab12");
	}
	
	
	
	public void disconnect()throws SQLException {
		c.close();
}
	
	
	
	public void addEnquiry(String name,String phone) throws SQLException{
		PreparedStatement p=c.prepareStatement("insert into enquiries (name,phone,status)values (?,?,'pending')");
		p.setString(1, name);
		p.setString(2, phone);
		p.executeUpdate();

	}
	public void updateEnquiryStatus(int id) throws SQLException {
		PreparedStatement p=c.prepareStatement("update enquiries set status='Done' where id=?");
		p.setInt(1, id);
		p.executeUpdate();
	}
	public void updatePilotStatus(String email,String status) throws SQLException {
		PreparedStatement p=c.prepareStatement("update pilots set status=? where email=?");
		p.setString(1, status);
		p.setString(2, email);
		p.executeUpdate();
	}
	
	public String addCourse(String name,int fee,String duration,String content,InputStream image) throws SQLException {
		PreparedStatement p=c.prepareStatement("insert into courses (name,fee,duration,content,image) values(?,?,?,?,?)");
		p.setString(1, name);
		p.setInt(2, fee);
		p.setString(3, duration);
		p.setString(4, content);
		p.setBinaryStream(5, image);
		try {
			p.executeUpdate();
			return "success";
		}catch (SQLIntegrityConstraintViolationException e) {
			return "already";
		}
	}
	
	public void reply(int id,String answer) throws SQLException {
		PreparedStatement p=c.prepareStatement("update conversation set answer=? where id=?");
		p.setString(1, answer);
		p.setInt(2, id);
		p.executeUpdate();
	}
	
	public void addQuestion(String user_email,String pilot_email,String question) throws SQLException {
		PreparedStatement p=c.prepareStatement("insert into conversation (user_email,pilot_email,question,question_date) values(?,?,?,CURRENT_DATE)");
		p.setString(1, user_email);
		p.setString(2, pilot_email);
		p.setString(3, question);
		p.executeUpdate();
	}
	
	public String assignPilotCourse(String pilot_email,String course_name) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from pilotcourses where pilot_email=? and course_name=?");
		p.setString(1, pilot_email);
		p.setString(2, course_name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return "failed";
		}else {
			p=c.prepareStatement("insert into pilotcourses (course_name,pilot_email) values(?,?)");
			p.setString(1, course_name);
			p.setString(2, pilot_email);
			p.executeUpdate();
			return "success";
		}
	}
	public String userEnroll(String user_email,String course_name) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from userenroll where user_email=? and course_name=?");
		p.setString(1, user_email);
		p.setString(2, course_name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return "failed";
		}else {
			p=c.prepareStatement("insert into userenroll (course_name,user_email) values(?,?)");
			p.setString(1, course_name);
			p.setString(2, user_email);
			p.executeUpdate();
			return "success";
		}
	}
	
	public String updateCourse(String name,int fee,String duration,String content,InputStream image,String oldName) throws SQLException {
		PreparedStatement p;
		if(image==null) {
			p=c.prepareStatement("update courses set name=?,fee=?,duration=?,content=? where name=?");

			p.setString(1, name);
			p.setInt(2, fee);
			p.setString(3, duration);
			p.setString(4, content);
			p.setString(5, oldName);
		}else {
			p=c.prepareStatement("update courses set name=?,fee=?,duration=?,content=?,image=? where name=?");

			p.setString(1, name);
			p.setInt(2, fee);
			p.setString(3, duration);
			p.setString(4, content);
			p.setBinaryStream(5, image);
			p.setString(6, oldName);
		}
		try {
			p.executeUpdate();
			return "success";
		}catch (SQLIntegrityConstraintViolationException e) {
			return "already";
		}
	}
	
	
	public String adminLogin(String id,String password) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from admin where id=? and password =?");
		p.setString(1, id);
		p.setString(2, password);
		ResultSet rs= p.executeQuery();
		if(rs.next())
			return rs.getString("name");
		else
			return null;
	}
	
	
	
	public ArrayList<HashMap> getAllEnquiries() throws SQLException {
		PreparedStatement p =c.prepareStatement("select * from enquiries");
		ResultSet rs= p.executeQuery();
		ArrayList<HashMap> enquiries=new ArrayList<>();
		while(rs.next()) {
			HashMap enquiry =new HashMap();
			enquiry.put("id", rs.getInt("id"));
			enquiry.put("name", rs.getString("name"));
			enquiry.put("phone", rs.getString("phone"));
			enquiry.put("status", rs.getString("status"));
			enquiries.add(enquiry);
		}return enquiries;
				
	}
	public ArrayList<HashMap> getAllCourses() throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from courses");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> courses=new ArrayList<>();
		while(rs.next()) {
			HashMap course=new HashMap();
			course.put("fee", rs.getInt("fee"));
			course.put("name", rs.getString("name"));
			course.put("duration", rs.getString("duration"));
			course.put("content", rs.getString("content"));
			courses.add(course);
		}
		return courses;
	}
	public HashMap getCoursesByName(String name) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from courses where name=?");
		p.setString(1, name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			HashMap course=new HashMap();
			course.put("fee", rs.getInt("fee"));
			course.put("name", rs.getString("name"));
			course.put("duration", rs.getString("duration"));
			course.put("content", rs.getString("content"));
			return course;
		}else {
			return null;
		}
		
	}
	
	public byte[] getCourseImage(String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select image from courses where name=?");
		p.setString(1, name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			byte image[]=rs.getBytes("image");
			return image;
		}else {
			return null;
		}
		
	}
	public byte[] getPhoto(String email,String userType) throws SQLException{
		PreparedStatement p;
		if(userType.equalsIgnoreCase("user")) {
			p=c.prepareStatement("select photo from users where email=?");
		}else {
			p=c.prepareStatement("select photo from pilots where email=?");
		}
		
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			byte image[]=rs.getBytes("photo");
			return image;
		}else {
			return null;
		}
		
	}
	
	public String userLogin(String email,String password) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from users where email=? and password=?");
		p.setString(1, email);
		p.setString(2, password);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getString("name");
		}else {
			return null;
		}
	}
	public String addUser(HashMap user) throws SQLException {
		PreparedStatement p=c.prepareStatement("insert into users (email,password,name,phone,gender,age,address,photo) values(?,?,?,?,?,?,?,?)");
		p.setString(1, (String)user.get("email"));
		p.setString(2, (String)user.get("password"));
		p.setString(3, (String)user.get("name"));
		p.setString(4, (String)user.get("phone"));
		p.setString(5, (String)user.get("gender"));
		p.setInt(6, (int)user.get("age"));
		p.setString(7, (String)user.get("address"));
		p.setBinaryStream(8, (InputStream)user.get("photo"));
		try {
			p.executeUpdate();
			return "success";
		}catch (SQLIntegrityConstraintViolationException e) {
			return "already";
		}
	}
	
	public String pilotLogin(String email,String password) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from pilots where email=? and password=?");
		p.setString(1, email);
		p.setString(2, password);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getString("name");
		}else {
			return null;
		}
	}
	public String addPilot(HashMap user) throws SQLException {
		PreparedStatement p=c.prepareStatement("insert into pilots (email,password,name,phone,gender,experience,address,photo,status) values(?,?,?,?,?,?,?,?,'pending')");
		p.setString(1, (String)user.get("email"));
		p.setString(2, (String)user.get("password"));
		p.setString(3, (String)user.get("name"));
		p.setString(4, (String)user.get("phone"));
		p.setString(5, (String)user.get("gender"));
		p.setInt(6, (int)user.get("experience"));
		p.setString(7, (String)user.get("address"));
		p.setBinaryStream(8, (InputStream)user.get("photo"));
		try {
			p.executeUpdate();
			return "success";
		}catch (SQLIntegrityConstraintViolationException e) {
			return "already";
		}
	}
	public HashMap getPilotByEmail(String email) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from pilots where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			HashMap pilot=new HashMap();
			pilot.put("name", rs.getString("name"));
			pilot.put("experience", rs.getInt("experience"));
			pilot.put("phone", rs.getString("phone"));
			pilot.put("gender", rs.getString("gender"));
			pilot.put("address", rs.getString("address"));
			return pilot;
		}else {
			return null;
		}
		
	}
	public HashMap getUserByEmail(String email) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from users where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			HashMap user=new HashMap();
			user.put("name", rs.getString("name"));
			user.put("age", rs.getInt("age"));
			user.put("phone", rs.getString("phone"));
			user.put("gender", rs.getString("gender"));
			user.put("address", rs.getString("address"));
			return user;
		}else {
			return null;
		}
		
	}
	public ArrayList<HashMap> getAllPilots() throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from pilots");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> pilots=new ArrayList<>();
		while(rs.next()) {
			HashMap pilot=new HashMap();
			pilot.put("email", rs.getString("email"));
			pilot.put("name", rs.getString("name"));
			pilot.put("phone", rs.getString("phone"));
			pilot.put("gender", rs.getString("gender"));
			pilot.put("address", rs.getString("address"));
			pilot.put("experience", rs.getString("experience"));
			pilot.put("status", rs.getString("status"));
			pilots.add(pilot);
		}
		return pilots;
	}
	public ArrayList<HashMap> getConversation(String user_email,String pilot_email) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from conversation where user_email=? and pilot_email=? order by question_date DESC");
		p.setString(1, user_email);
		p.setString(2, pilot_email);
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> conversations=new ArrayList<>();
		while(rs.next()) {
			HashMap conversation=new HashMap();
			conversation.put("question", rs.getString("question"));
			conversation.put("id", rs.getInt("id"));
			conversation.put("answer", rs.getString("answer"));
			conversation.put("question_date", rs.getString("question_date"));
			conversations.add(conversation);
		}
		return conversations;
	}

	public TreeSet<String> getAllCoursesByUser(String User_email) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from userenroll where user_email=?");
		p.setString(1, User_email);
		ResultSet rs=p.executeQuery();
		TreeSet<String> courseNames=new TreeSet<>();
		while(rs.next()) {
			courseNames.add(rs.getString("course_name"));
		}
		return courseNames;
	}
	public TreeSet<String> getAllCoursesByPilot(String pilot_email) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from pilotcourses where pilot_email=?");
		p.setString(1, pilot_email);
		ResultSet rs=p.executeQuery();
		TreeSet<String> courseNames=new TreeSet<>();
		while(rs.next()) {
			courseNames.add(rs.getString("course_name"));
		}
		return courseNames;
	}
	public TreeSet<String> getAllUsersByCourse(String course_name) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from userenroll where course_name=?");
		p.setString(1, course_name);
		ResultSet rs=p.executeQuery();
		TreeSet<String> users=new TreeSet<>();
		while(rs.next()) {
			users.add(rs.getString("user_email"));
		}
		return users;
	}
	public boolean checkCoursesByUser(String User_email,String course_name) throws SQLException {
		PreparedStatement p=c.prepareStatement("select * from userenroll where user_email=? and course_name=?");
		p.setString(1, User_email);
		p.setString(2, course_name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return true;
		}else {
			return false;
		}
	}
	
	
	public TreeSet<String> getAllPilotsEmail() throws SQLException {
		PreparedStatement p=c.prepareStatement("select email from pilots where status='accepted'");
		ResultSet rs=p.executeQuery();
		TreeSet<String> emails=new TreeSet<>();
		while(rs.next()) {
			emails.add(rs.getString("email"));
		}
		return emails;
	}
	public TreeSet<String> getAllPilotsEmailByCourse(String course_name) throws SQLException {
		PreparedStatement p=c.prepareStatement("select pilot_email from pilotcourses where course_name=?");
		p.setString(1, course_name);
		ResultSet rs=p.executeQuery();
		TreeSet<String> emails=new TreeSet<>();
		while(rs.next()) {
			emails.add(rs.getString("pilot_email"));
		}
		return emails;
	}
	
	
	public String getPilotStatus(String email) throws SQLException {
		PreparedStatement p=c.prepareStatement("select status from pilots where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getString("status");
		}else {
			return null;
		}
	}
}