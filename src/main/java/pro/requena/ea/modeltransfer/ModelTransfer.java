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
     * @param source The source file or DSN.
     * @param target The target file or DSN.
     * @param batchInsert
     * @throws EAModelTransferException 
     */
    public final void transfer(final String source, final String target, final boolean batchInsert) throws EAModelTransferException {
        // Connect to the source and destination databases.
        Connection sourceConnection = EADatabase.connect(source);
        Connection targetConnection = EADatabase.connect(target);

        // Transfer process.
        TransferProcess.modelTransfer(sourceConnection, targetConnection, batchInsert);

        // Close the opened database connections.
        EADatabase.close(sourceConnection);
        EADatabase.close(targetConnection);
    }

}
