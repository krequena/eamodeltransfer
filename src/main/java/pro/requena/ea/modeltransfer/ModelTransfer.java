package pro.requena.ea.modeltransfer;

import java.sql.Connection;

import pro.requena.ea.modeltransfer.database.EADatabase;
import pro.requena.ea.modeltransfer.database.TransferProcess;
import pro.requena.ea.modeltransfer.exceptions.EAModelTransferException;

/**
 * Entry-point class that handles model transfer requests.
 * 
 * @author krequena
 * @since 0.1
 */
public final class ModelTransfer {

    /**
     * This method performs the Model Transfer operation from a source model to a given destination.
     * @param source
     * @param destination
     * @throws EAModelTransferException 
     */
    public final void transfer(final String source, final String destination) throws EAModelTransferException {
        // Connect to the source and destination databases.
        Connection sourceConnection = EADatabase.connect(source);
        Connection destinationConnection = EADatabase.connect(destination);

        // Transfer process.
        TransferProcess.modelTransfer(sourceConnection, destinationConnection);

        // Close the opened database connections.
        EADatabase.close(sourceConnection);
        EADatabase.close(destinationConnection);
    }

}
