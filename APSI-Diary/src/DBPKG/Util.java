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

	/* GET으로 받은 변수값이 null인지 확인하는 함수 */
	public static String getParamNN(String param) {
		if(param == null)
			return "";
		return param;
	}
	
}