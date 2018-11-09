package pro.requena.ea.modeltransfer.database;

import java.io.ByteArrayInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import pro.requena.ea.modeltransfer.exceptions.EAModelTransferException;

/**
 * Model transfer process.
 * @author krequena
 *
 */
public class TransferProcess {

    private static final String[] tableList = {"t_attributeconstraints", "t_attributetag", "t_connectorconstraint", "t_connectortag", "t_document", "t_files", "t_html", "t_image", "t_paletteitem",
            "t_phase", "t_operationtag", "t_rtf", "t_rules", "t_script", "t_secgrouppermission", "t_seclocks", "t_secusergroup", "t_secuserpermission", "t_snapshot", "t_taggedvalue", "t_tasks",
            "t_template", "t_testplans", "t_umlpattern", "t_version", "t_xref", "t_xrefsystem", "t_xrefuser", "usys_system", "t_operationparams", "t_operationposts", "t_operationpres", "t_issues",
            "t_attribute", "t_connector", "t_diagramlinks", "t_diagramobjects", "t_method", "t_diagram", "t_objectconstraint", "t_objecteffort", "t_objectfiles", "t_objectmetrics",
            "t_objectproblems", "t_objectproperties", "t_objectrequires", "t_objectresource", "t_objectrisks", "t_objectscenarios", "t_objecttests", "t_objecttrx", "t_operation", "t_palette",
            "t_secuser", "t_secpermission", "t_secgroup", "t_object", "t_glossary", "t_implement", "t_diagramtypes", "t_genopt", "t_ecf", "t_efforttypes", "t_connectortypes", "t_constants",
            "t_constrainttypes", "t_datatypes", "t_authors", "t_cardinality", "t_category", "t_clients", "t_complexitytypes", "t_metrictypes", "t_lists", "t_mainttypes", "t_objecttypes", "t_ocf",
            "t_rtfreport", "t_package", "t_problemtypes", "t_projectroles", "t_propertytypes", "t_requiretypes", "t_resources", "t_risktypes", "t_scenariotypes", "t_secpolicies", "t_tcf",
            "t_statustypes", "t_stereotypes", "t_testtypes", "t_trxtypes", "t_testclass", "t_roleconstraint", "usystables"};

    private static final String SETTING_ON = "ON";
    private static final String SETTING_OFF = "OFF";

    private static final Logger LOG = LogManager.getLogger();

    /**
     * Performs the database transfer from the source to the destination connections.
     * @param sourceConnection JDBC connection to the source database.
     * @param targetConnection JDBC connection to the destination database.
     * @throws EAModelTransferException Generic handled exception.
     */
    public static void modelTransfer(final Connection sourceConnection, final Connection targetConnection, final boolean batchInsert) throws EAModelTransferException {
        LOG.info("Start: modelTransfer. BatchInsert: {}.", batchInsert);
        try {
            // Enable auto-commit on the destination connection.
            targetConnection.setAutoCommit(true);

            // Delete destination tables content.
            deleteTables(targetConnection);

            // Copy rows from the source database to the destination database.
            for(String table : tableList) {
                LOG.info("Inserting rows to table: {}.", table);

                // Gather data.
                Statement statement = sourceConnection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM " + table);
                ResultSetMetaData metadata = resultSet.getMetaData();

                // Enable inserting rows with identity fields fulfilled.
                changeIdentityInserts(targetConnection, table, true);

                // Prepare insertion statement.
                String colNames = "";
                String colParams = "";
                for(int col=1;col<=metadata.getColumnCount();col++) {
                    colNames += "[" + metadata.getColumnName(col) + "], ";
                    colParams += "?, ";
                }
                colNames = colNames.substring(0, colNames.length() - 2);
                colParams = colParams.substring(0, colParams.length() - 2);
                PreparedStatement insertStatement = targetConnection.prepareStatement("INSERT INTO [" + table + "] (" + colNames + ") VALUES (" + colParams + ");");

                // Insert data.
                while(resultSet.next()) {
                    for(int column=1;column<=metadata.getColumnCount();column++) {
                        if(metadata.getColumnType(column) == Types.CHAR ||
                           metadata.getColumnType(column) == Types.VARCHAR) {
                            insertStatement.setString(column, resultSet.getString(column));
                        } else if(metadata.getColumnType(column) == Types.NUMERIC ||
                                  metadata.getColumnType(column) == Types.INTEGER ||
                                  metadata.getColumnType(column) == Types.SMALLINT) {
                            insertStatement.setInt(column, resultSet.getInt(column));
                        } else if(metadata.getColumnType(column) == Types.DATE) {
                            insertStatement.setDate(column, resultSet.getDate(column));
                        } else if(metadata.getColumnType(column) == Types.TIMESTAMP) {
                            insertStatement.setTimestamp(column, resultSet.getTimestamp(column));
                        } else if(metadata.getColumnType(column) == Types.BOOLEAN) {
                            insertStatement.setBoolean(column, resultSet.getBoolean(column));
                        } else if(metadata.getColumnType(column) == Types.DOUBLE) {
                            insertStatement.setDouble(column, resultSet.getDouble(column));
                        } else if(metadata.getColumnType(column) == Types.VARBINARY) {
                            if(resultSet.getBinaryStream(column) != null) {
                                insertStatement.setBinaryStream(column, resultSet.getBinaryStream(column));
                            } else {
                                insertStatement.setBinaryStream(column, new ByteArrayInputStream(new byte[0]));
                            }
                        } else {
                            final String errorDescription = "Datatype not handled: " + metadata.getColumnType(column) + "(" +
                                                            metadata.getColumnTypeName(column) + ") on table " + table + ", column " +
                                                            metadata.getColumnName(column);
                            LOG.error(errorDescription);
                            throw new EAModelTransferException(errorDescription);
                        }
                    }

                    // Handle insertion mode.
                    if(batchInsert) {
                        insertStatement.addBatch();
                    } else {
                        insertStatement.execute();
                    }
                }
                if(batchInsert) {
                    insertStatement.executeBatch();
                }

                // Disable inserting rows with identity fields fulfilled.
                changeIdentityInserts(targetConnection, table, false);
            }
            LOG.info("Finished: modelTransfer.");
        } catch(SQLException exception) {
            throw new EAModelTransferException(exception);
        }
    }

    /**
     * Deletes all the rows of all the EA tables from the destination connection.
     * @param destinationConnection Database connection.
     * @throws SQLException Exception while handling the deletions.
     */
    public static void deleteTables(final Connection destinationConnection) throws SQLException {
        for(String table : tableList) {
            LOG.info("Deleting rows from table: {}.", table);
            Statement statement = destinationConnection.createStatement();
            statement.execute("DELETE FROM " + table);
        }
    }

    /**
     * Modifies the status of the Insert Identity DB setting.
     * @param destinationConnection {@link java.sql.Connection} to the database.
     * @param value If true, enables the setting. Otherwise, disables it.
     */
    private static void changeIdentityInserts(final Connection destinationConnection, final String tableName, final boolean value) {
        try {
            Statement identityStmt = destinationConnection.createStatement();
            identityStmt.execute("SET IDENTITY_INSERT " + tableName + " " + (value ? SETTING_ON : SETTING_OFF));
            identityStmt.close();
        } catch (Exception e) {
            // Left empty intendedly.
        }
    }
}
