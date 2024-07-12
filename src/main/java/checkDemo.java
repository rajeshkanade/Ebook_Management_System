import java.sql.DriverManager;
import java.sql.Connection;
public class checkDemo {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:oracle","EBOOK_APP","ebook");
			if(conn != null)
				System.out.println("Connected Successfully...");
			else
				System.out.println("Not Connected....");
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}

}
