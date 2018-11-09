package pro.requena.ea.modeltransfer;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pro.requena.ea.modeltransfer.database.EADatabase;
import pro.requena.ea.modeltransfer.database.TransferProcess;
import pro.requena.ea.modeltransfer.exceptions.EAModelTransferException;

/**
 * Model Transfer test class.
 * 
 * @author krequena
 *
 */
public class ModelTransferTest {

	// EAPX files.
	private static final String SOURCE_EAPX = "eapx/source.eapx";
	private static final String TARGET_EAPX = "eapx/target.eapx";

	// Database SQL scripts.
	private static final String SCHEMA_SQL_SCRIPT = "scripts/EASchema_1220_H2.sql";

	private ModelTransfer modelTransfer = null;

	@Before
	public void init() {
		modelTransfer = new ModelTransfer();
	}

	@After
	public void destroy() {
		modelTransfer = null;
	}

//    @Test
	public void testLocalToLocal() throws EAModelTransferException {
		final String source = Thread.currentThread().getContextClassLoader().getResource(SOURCE_EAPX).getPath();
		final String target = Thread.currentThread().getContextClassLoader().getResource(TARGET_EAPX).getPath();
		modelTransfer.transfer(source, target, false);
	}

	@Test
	public void testLocalToDBMS() throws EAModelTransferException, SQLException {
		final String source = Thread.currentThread().getContextClassLoader().getResource(SOURCE_EAPX).getPath();
		final String target = "jdbc:h2:mem:";

		// Connect to the source and destination databases.
		Connection sourceConnection = EADatabase.connect(source);
		Connection targetConnection = EADatabase.connect(target);

		// Load the EA base DB script to the target connection.
		importSQL(targetConnection, Thread.currentThread().getContextClassLoader().getResourceAsStream(SCHEMA_SQL_SCRIPT));

		// Transfer process.
		TransferProcess.modelTransfer(sourceConnection, targetConnection, false);
	}

	/**
	 * Prerequisite: Load the SQL script to the testing database.
	 * @param connection Target connection.
	 * @param inputStream Source script stream.
	 * @throws SQLException Non-handled exception.
	 */
	private static void importSQL(Connection connection, InputStream inputStream) throws SQLException {
		Scanner s = new Scanner(inputStream);
		s.useDelimiter("(;(\r)?\n)|(--\n)");
		Statement st = null;
		try {
			st = connection.createStatement();
			while (s.hasNext()) {
				String line = s.next();
				if (line.startsWith("/*!") && line.endsWith("*/")) {
					int i = line.indexOf(' ');
					line = line.substring(i + 1, line.length() - " */".length());
				}

				if (line.trim().length() > 0) {
					st.execute(line);
				}
			}
		} finally {
			if (st != null)
				st.close();
			if (s != null)
				s.close();
		}
	}
}
