package pro.requena.ea.modeltransfer.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

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

    /**
     * Performs the database transfer from the source to the destination connections.
     * @param sourceConnection JDBC connection to the source database.
     * @param destinationConnection JDBC connection to the destination database.
     * @throws EAModelTransferException Generic handled exception.
     */
    public static void modelTransfer(final Connection sourceConnection, final Connection destinationConnection) throws EAModelTransferException {
        try {
            // Delete destination tables content.
            for(String table : tableList) {
                Statement statement = destinationConnection.createStatement();
                statement.execute("DELETE FROM " + table);
            }
            // Commit the deletions.
            destinationConnection.commit();

            // Copy rows from the source database to the destination database.
            for(String table : tableList) {
                // Gather data.
                Statement statement = sourceConnection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM " + table);
                ResultSetMetaData metadata = resultSet.getMetaData();

                // Enable inserting rows with identity fields fulfilled.
                changeIdentityInserts(destinationConnection, table, true);
                
                // Prepare insertion statement.
                String colNames = "";
                String colParams = "";
                for(int col=1;col<=metadata.getColumnCount();col++) {
                    colNames += metadata.getColumnName(col) + ", ";
                    colParams += "?, ";
                }
                colNames = colNames.substring(0, colNames.length() - 2);
                colParams = colParams.substring(0, colParams.length() - 2);
                PreparedStatement insertStatement = destinationConnection.prepareStatement("INSERT INTO " + table + "(" + colNames + ") VALUES (" + colParams + ");");

                // Insert data.
                while(resultSet.next()) {
                    for(int column=1;column<=metadata.getColumnCount();column++) {
                        if(metadata.getColumnType(column) == Types.CHAR ||
                           metadata.getColumnType(column) == Types.VARCHAR) {
                            insertStatement.setString(column, resultSet.getString(column));
                        } else if(metadata.getColumnType(column) == Types.NUMERIC ||
                                  metadata.getColumnType(column) == Types.INTEGER) {
                            insertStatement.setInt(column, resultSet.getInt(column));
                        } else if(metadata.getColumnType(column) == Types.DATE) {
                          insertStatement.setDate(column, resultSet.getDate(column));
                        }
                    }
                    insertStatement.execute();
                }

                // Disable inserting rows with identity fields fulfilled.
                changeIdentityInserts(destinationConnection, table, false);
            }

            // Commit the insertions.
            destinationConnection.commit();
        } catch(SQLException exception) {
            throw new EAModelTransferException(exception);
        }

    }

    /**
     * Modifies the status of the Insert Identity DB setting.
     * @param destinationConnection {@link java.sql.Connection} to the database.
     * @param value If true, enables the setting. Otherwise, disables it.
     * @throws SQLException
     */
    private static void changeIdentityInserts(final Connection destinationConnection, final String tableName, final boolean value) throws SQLException {
        try {
            Statement identityStmt = destinationConnection.createStatement();
            identityStmt.executeQuery("SET IDENTITY_INSERT " + tableName + " " + (value ? SETTING_ON : SETTING_OFF));
            identityStmt.close();
        } catch (Exception e) {
            System.out.println("Table " + tableName + " does not have identity fields.");
        }
    }
}
