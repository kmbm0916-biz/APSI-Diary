package DBPKG;
import java.sql.*;

public class Util {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe",
				"system",
				"1234");
		return conn;
	}

	/* GET���� ���� �������� null���� Ȯ���ϴ� �Լ� */
	public static String getParamNN(String param) {
		if(param == null)
			return "";
		return param;
	}
	
}