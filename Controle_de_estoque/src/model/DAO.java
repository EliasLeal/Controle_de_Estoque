package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	// par?metros de conex?o
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://10.26.45.105:3306/dbconest";
	private String user = "dba";
	private String password = "Senac@123";

	/**
	 * Conex?o com o banco de dados
	 * 
	 * @return con
	 */
	public Connection conectar() {
		// con -> objeto
		Connection con = null;
		// tratamento de exce??es
		try {
			// uso do driver
			Class.forName(driver);
			// estabelecendo a conex?o
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

}
