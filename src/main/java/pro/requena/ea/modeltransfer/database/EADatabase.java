package pro.requena.ea.modeltransfer.database;

import java.sql.Connection;
import java.sql.DriverManager;

import pro.requena.ea.modeltransfer.exceptions.EAModelTransferException;

/**
 * Entry-point class that handles model transfer requests.
 * 
 * @author krequena
 * @since 0.1
 */
public class EADatabase {
    
    private static final String PREFIX_JDBC = "jdbc:";

    /**
     * Create a new database connection to a given EAP/DSN.
     * @param endpoint Endpoint. Can be an EAP file or a DSN specification.
     * @return Opened {@link java.sql.Connection} to the given database.
     * @throws EAModelTransferException Generic handled exception.
     */
    public static final Connection connect(final String eapFilePath) throws EAModelTransferException {
        if(eapFilePath.toLowerCase().startsWith(PREFIX_JDBC)) {
            return connectDsn(eapFilePath);
        } else {
            return connectEap(eapFilePath);
        }
    }

    /**
     * Creates a connection to an EAP file.
     * @param eapFilePath EAP file path.
     * @return Connection.
     * @throws EAModelTransferException Generic handled exception.
     */
    private static final Connection connectEap(final String eapFilePath) throws EAModelTransferException {
        try {
            return DriverManager.getConnection("jdbc:ucanaccess://" + eapFilePath + ";memory=false");
        } catch (Exception e) {
            throw new EAModelTransferException(e);
        }
    }

    /**
     * Creates a connection to a DSN.
     * @param dsn DSN.
     * @return Connection.
     * @throws EAModelTransferException Generic handled exception.
     */
    private static final Connection connectDsn(final String dsn) throws EAModelTransferException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(dsn);
        } catch (Exception e) {
            throw new EAModelTransferException(e);
        }
    }

    /**
     * Closes a database connection.
     * @param connection Existing JDBC connection.
     * @throws EAModelTransferException Generic handled exception.
     */
    public static final void close(final Connection connection) throws EAModelTransferException {
        try {
            connection.close();
        } catch (Exception e) {
            throw new EAModelTransferException(e);
        }
    }
}
