import java.sql.*;

public class jdbc {
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jbdc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jk", "newuser", "password");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT * FROM student");
			while(rs.next()) {
				int Roll=rs.getInt("rollno");
				String Name=rs.getString("name");
				System.out.print(Roll+" "+Name);
			}	
		}catch(Exception e) {}
	}

}
