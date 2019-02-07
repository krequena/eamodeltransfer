package pro.requena.ea.modeltransfer.database;

import static org.junit.Assert.assertEquals;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import pro.requena.ea.modeltransfer.exceptions.EAModelTransferException;

/**
 * Test for EADatabase class.
 * @author crequena
 *
 */
public class EADatabaseTest {

    private static final String SOURCE_EAPX = "eapx/source.eapx";
    private static final String TARGET_EAPX = "target/target.eapx";
    
    @Test
    public void testConnectEAP() throws EAModelTransferException, SQLException {
        Connection connection = EADatabase.connect(Thread.currentThread().getContextClassLoader().getResource(SOURCE_EAPX).getPath(), false);
        assertEquals(2, connection.getMetaData().getDatabaseMajorVersion());
        assertEquals(3, connection.getMetaData().getDatabaseMinorVersion());
        assertEquals("UCanAccess driver for Microsoft Access databases using HSQLDB", connection.getMetaData().getDatabaseProductName());
        assertEquals("V2000 [VERSION_4]", connection.getMetaData().getDatabaseProductVersion());
        assertEquals("", connection.getSchema());
        assertEquals("Admin", connection.getMetaData().getUserName());
        assertEquals(4, connection.getMetaData().getJDBCMajorVersion());
        assertEquals(0, connection.getMetaData().getJDBCMinorVersion());
    }

    @Test
    public void testConnectDSN() {
        try {
            EADatabase.connect("jdbc:nodriver://", false);
        } catch(EAModelTransferException exception) {
            // Check for a specific database connection-related exception.
            assertEquals("java.sql.SQLException: No suitable driver found for jdbc:nodriver://", exception.getMessage());
        }
    }

    @Test
    public void testFailedSourceEAP() throws SQLException, IOException {
        // Precondition.
        if(Files.exists(Paths.get(TARGET_EAPX))) {
            Files.delete(Paths.get(TARGET_EAPX));
        }

        // Test.
        try {
            Connection connection = EADatabase.connect(TARGET_EAPX, false);
            connection.close();
            assertEquals("Always_Fail", connection.getCatalog());
        } catch (EAModelTransferException e) {
            // Expected exception, since the file does not exist.
        }
    }

    @Test
    public void testOverwriteEAP() throws EAModelTransferException, SQLException, IOException {
        Connection connection = EADatabase.connect(TARGET_EAPX, true);
        connection.close();
        
        // Delete the created file.
        Files.delete(Paths.get(TARGET_EAPX));
    }



}
