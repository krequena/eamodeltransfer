CREATE TABLE `t_attribute`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Name` VARCHAR(255) NOT NULL,
	`Scope` VARCHAR(50) 	,
	`Stereotype` VARCHAR(50) 	,
	`Containment` VARCHAR(50) 	,
	`IsStatic` INT 	 DEFAULT 0,
	`IsCollection` INT 	 DEFAULT 0,
	`IsOrdered` INT 	 DEFAULT 0,
	`AllowDuplicates` INT 	 DEFAULT 0,
	`LowerBound` VARCHAR(50) 	,
	`UpperBound` VARCHAR(50) 	,
	`Container` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	`Derived` CHAR(1) 	,
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Pos` INT 	,
	`GenOption` MEDIUMTEXT 	,
	`Length` INT 	,
	`Precision` INT 	,
	`Scale` INT 	,
	`Const` INT 	,
	`Style` VARCHAR(255) 	,
	`Classifier` VARCHAR(50) 	,
	`Default` MEDIUMTEXT 	,
	`Type` VARCHAR(255) 	,
	`ea_guid` VARCHAR(50) NOT NULL,
	`StyleEx` MEDIUMTEXT 	,
	CONSTRAINT `pk_attribute` PRIMARY KEY (`ID` ASC),
	CONSTRAINT `uq_attribute_eaguid` UNIQUE (`ea_guid` ASC)
);

CREATE TABLE `t_attributeconstraints`
(
	`Object_ID` INT 	 DEFAULT 0,
	`Constraint` VARCHAR(255) NOT NULL,
	`AttName` VARCHAR(255) 	,
	`Type` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	`ID` INT NOT NULL DEFAULT 0,
	CONSTRAINT `pk_attributeconstraints` PRIMARY KEY (`ID` ASC, `Constraint` ASC)
);

CREATE TABLE `t_attributetag`
(
	`PropertyID` INT NOT NULL AUTO_INCREMENT,
	`ElementID` INT NOT NULL DEFAULT 0,
	`Property` VARCHAR(255) 	,
	`VALUE` VARCHAR(255) 	,
	`NOTES` MEDIUMTEXT 	,
	`ea_guid` VARCHAR(40) 	,
	CONSTRAINT `pk_attributetag` PRIMARY KEY (`PropertyID` ASC)
);

CREATE TABLE `t_authors`
(
	`AuthorName` VARCHAR(255) NOT NULL,
	`Roles` VARCHAR(255) 	,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_authors` PRIMARY KEY (`AuthorName` ASC)
);

CREATE TABLE `t_cardinality`
(
	`Cardinality` VARCHAR(50) NOT NULL,
	CONSTRAINT `pk_cardinality` PRIMARY KEY (`Cardinality` ASC)
);

CREATE TABLE `t_category`
(
	`CategoryID` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(255) 	,
	`Type` VARCHAR(255) 	,
	`NOTES` MEDIUMTEXT 	,
	CONSTRAINT `pk_category` PRIMARY KEY (`CategoryID` ASC)
);

CREATE TABLE `t_clients`
(
	`Name` VARCHAR(255) NOT NULL,
	`Organisation` VARCHAR(255) 	,
	`Phone1` VARCHAR(50) 	,
	`Phone2` VARCHAR(50) 	,
	`Mobile` VARCHAR(50) 	,
	`Fax` VARCHAR(50) 	,
	`Email` VARCHAR(50) 	,
	`Roles` VARCHAR(255) 	,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_clients` PRIMARY KEY (`Name` ASC)
);

CREATE TABLE `t_complexitytypes`
(
	`Complexity` VARCHAR(50) NOT NULL,
	`NumericWeight` INT NOT NULL DEFAULT 0,
	CONSTRAINT `pk_complexitytypes` PRIMARY KEY (`Complexity` ASC)
);

CREATE TABLE `t_connector`
(
	`Connector_ID` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(255) 	,
	`Direction` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	`Connector_Type` VARCHAR(50) NOT NULL,
	`SubType` VARCHAR(50) 	,
	`SourceCard` VARCHAR(50) 	,
	`SourceAccess` VARCHAR(50) 	,
	`SourceElement` VARCHAR(50) 	,
	`DestCard` VARCHAR(50) 	,
	`DestAccess` VARCHAR(50) 	,
	`DestElement` VARCHAR(50) 	,
	`SourceRole` VARCHAR(255) 	,
	`SourceRoleType` VARCHAR(50) 	,
	`SourceRoleNote` MEDIUMTEXT 	,
	`SourceContainment` VARCHAR(50) 	,
	`SourceIsAggregate` INT 	 DEFAULT 0,
	`SourceIsOrdered` INT 	 DEFAULT 0,
	`SourceQualifier` VARCHAR(50) 	,
	`DestRole` VARCHAR(255) 	,
	`DestRoleType` VARCHAR(50) 	,
	`DestRoleNote` MEDIUMTEXT 	,
	`DestContainment` VARCHAR(50) 	,
	`DestIsAggregate` INT 	 DEFAULT 0,
	`DestIsOrdered` INT 	 DEFAULT 0,
	`DestQualifier` VARCHAR(50) 	,
	`Start_Object_ID` INT NOT NULL DEFAULT 0,
	`End_Object_ID` INT NOT NULL DEFAULT 0,
	`Top_Start_Label` VARCHAR(50) 	,
	`Top_Mid_Label` VARCHAR(50) 	,
	`Top_End_Label` VARCHAR(50) 	,
	`Btm_Start_Label` VARCHAR(50) 	,
	`Btm_Mid_Label` VARCHAR(50) 	,
	`Btm_End_Label` VARCHAR(50) 	,
	`Start_Edge` INT 	 DEFAULT 0,
	`End_Edge` INT 	 DEFAULT 0,
	`PtStartX` INT 	 DEFAULT 0,
	`PtStartY` INT 	 DEFAULT 0,
	`PtEndX` INT 	 DEFAULT 0,
	`PtEndY` INT 	 DEFAULT 0,
	`SeqNo` INT 	 DEFAULT 0,
	`HeadStyle` INT 	 DEFAULT 0,
	`LineStyle` INT 	 DEFAULT 0,
	`RouteStyle` INT 	 DEFAULT 0,
	`IsBold` INT 	 DEFAULT 0,
	`LineColor` INT 	 DEFAULT 0,
	`Stereotype` VARCHAR(50) 	,
	`VirtualInheritance` CHAR(1) 	,
	`LinkAccess` VARCHAR(50) 	,
	`PDATA1` VARCHAR(255) 	,
	`PDATA2` MEDIUMTEXT 	,
	`PDATA3` VARCHAR(255) 	,
	`PDATA4` VARCHAR(255) 	,
	`PDATA5` MEDIUMTEXT 	,
	`DiagramID` INT DEFAULT 0,
	`ea_guid` VARCHAR(40) NOT NULL,
	`SourceConstraint` VARCHAR(255) 	,
	`DestConstraint` VARCHAR(255) 	,
	`SourceIsNavigable` INT 	,
	`DestIsNavigable` INT 	,
	`IsRoot` INT 	,
	`IsLeaf` INT 	,
	`IsSpec` INT 	,
	`SourceChangeable` VARCHAR(12) 	,
	`DestChangeable` VARCHAR(12) 	,
	`SourceTS` VARCHAR(12) 	,
	`DestTS` VARCHAR(12) 	,
	`StateFlags` MEDIUMTEXT 	,
	`ActionFlags` VARCHAR(255) 	,
	`IsSignal` INT 	,
	`IsStimulus` INT 	,
	`DispatchAction` VARCHAR(255) 	,
	`Target2` INT 	,
	`StyleEx` MEDIUMTEXT 	,
	`SourceStereotype` VARCHAR(255) 	,
	`DestStereotype` VARCHAR(255) 	,
	`SourceStyle` MEDIUMTEXT 	,
	`DestStyle` MEDIUMTEXT 	,
	`EventFlags` VARCHAR(255) 	,
	CONSTRAINT `pk_connector` PRIMARY KEY (`Connector_ID` ASC),
	CONSTRAINT `uq_connector_eaguid` UNIQUE (`ea_guid` ASC)
);

CREATE TABLE `t_connectorconstraint`
(
	`ConnectorID` INT NOT NULL DEFAULT 0,
	`Constraint` VARCHAR(255) NOT NULL,
	`ConstraintType` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_connectorconstraint` PRIMARY KEY (`ConnectorID` ASC, `Constraint` ASC)
);

CREATE TABLE `t_connectortag`
(
	`PropertyID` INT NOT NULL AUTO_INCREMENT,
	`ElementID` INT NOT NULL DEFAULT 0,
	`Property` VARCHAR(255) 	,
	`VALUE` VARCHAR(255) 	,
	`NOTES` MEDIUMTEXT 	,
	`ea_guid` VARCHAR(40) 	,
	CONSTRAINT `pk_connectortag` PRIMARY KEY (`PropertyID` ASC)
);

CREATE TABLE `t_connectortypes`
(
	`Connector_Type` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(50) 	,
	CONSTRAINT `pk_connectortypes` PRIMARY KEY (`Connector_Type` ASC)
);

CREATE TABLE `t_constants`
(
	`ConstantName` VARCHAR(50) NOT NULL,
	`ConstantValue` VARCHAR(255) 	,
	CONSTRAINT `pk_constants` PRIMARY KEY (`ConstantName` ASC)
);

CREATE TABLE `t_constrainttypes`
(
	`Constraint` VARCHAR(16) NOT NULL,
	`Description` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_constrainttypes` PRIMARY KEY (`Constraint` ASC)
);

CREATE TABLE `t_datatypes`
(
	`Type` VARCHAR(50) NOT NULL,
	`ProductName` VARCHAR(50) NOT NULL,
	`DataType` VARCHAR(50) NOT NULL,
	`Size` INT 	,
	`MaxLen` INT 	,
	`MaxPrec` INT 	,
	`MaxScale` INT 	 DEFAULT 0,
	`DefaultLen` INT 	,
	`DefaultPrec` INT 	,
	`DefaultScale` INT 	,
	`User` INT 	,
	`PDATA1` VARCHAR(255) 	,
	`PDATA2` VARCHAR(255) 	,
	`PDATA3` VARCHAR(255) 	,
	`PDATA4` VARCHAR(255) 	,
	`HasLength` VARCHAR(50) 	,
	`GenericType` VARCHAR(255) 	,
	`DatatypeID` INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT `pk_datatypes` PRIMARY KEY (`DatatypeID` ASC)
);

CREATE TABLE `t_diagram`
(
	`Diagram_ID` INT NOT NULL AUTO_INCREMENT,
	`Package_ID` INT NOT NULL DEFAULT 1,
	`ParentID` INT NOT NULL DEFAULT 0,
	`Diagram_Type` VARCHAR(50) NOT NULL,
	`Name` VARCHAR(255) 	,
	`Version` VARCHAR(50) 	 DEFAULT '1.0',
	`Author` VARCHAR(255) 	,
	`ShowDetails` INT 	 DEFAULT 0,
	`Notes` MEDIUMTEXT 	,
	`Stereotype` VARCHAR(50) 	,
	`AttPub` INT 	,
	`AttPri` INT 	,
	`AttPro` INT 	,
	`Orientation` CHAR(1) 	 DEFAULT 'P',
	`cx` INT 	 DEFAULT 0,
	`cy` INT 	 DEFAULT 0,
	`Scale` INT 	 DEFAULT 100,
	`CreatedDate` DATETIME 	 DEFAULT '0000-00-00 00:00:00',
	`ModifiedDate` DATETIME 	 DEFAULT '0000-00-00 00:00:00',
	`HTMLPath` VARCHAR(255) 	,
	`ShowForeign` INT 	,
	`ShowBorder` INT 	,
	`ShowPackageContents` INT 	,
	`PDATA` VARCHAR(255) 	,
	`Locked` INT 	,
	`ea_guid` VARCHAR(40) NOT NULL,
	`TPos` INT 	,
	`Swimlanes` VARCHAR(255) 	,
	`StyleEx` MEDIUMTEXT 	,
	CONSTRAINT `pk_diagram` PRIMARY KEY (`Diagram_ID` ASC),
	CONSTRAINT `uq_diagram_eaguid` UNIQUE (`ea_guid` ASC)
);

CREATE TABLE `t_diagramlinks`
(
	`DiagramID` INT NOT NULL DEFAULT 0,
	`ConnectorID` INT NOT NULL DEFAULT 0,
	`Geometry` MEDIUMTEXT 	,
	`Style` VARCHAR(255) 	,
	`Hidden` INT 	,
	`Path` VARCHAR(255) 	,
	`Instance_ID` INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT `pk_diagramlinks` PRIMARY KEY (`Instance_ID` ASC)
);

CREATE TABLE `t_diagramobjects`
(
	`Diagram_ID` INT NOT NULL DEFAULT 0,
	`Object_ID` INT NOT NULL DEFAULT 0,
	`RectTop` INT 	 DEFAULT 0,
	`RectLeft` INT 	 DEFAULT 0,
	`RectRight` INT 	 DEFAULT 0,
	`RectBottom` INT 	 DEFAULT 0,
	`Sequence` INT 	 DEFAULT 0,
	`ObjectStyle` VARCHAR(255) 	,
	`Instance_ID` INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT `pk_diagramobjects` PRIMARY KEY (`Instance_ID` ASC)
);

CREATE TABLE `t_diagramtypes`
(
	`Diagram_Type` VARCHAR(50) NOT NULL,
	`Name` VARCHAR(255) 	,
	`Package_ID` INT NOT NULL DEFAULT 0,
	CONSTRAINT `pk_diagramtypes` PRIMARY KEY (`Diagram_Type` ASC)
);

CREATE TABLE `t_document`
(
	`DocID` VARCHAR(40) NOT NULL,
	`DocName` VARCHAR(100) 	,
	`Notes` VARCHAR(255) 	,
	`Style` VARCHAR(255) 	,
	`ElementID` VARCHAR(40) NOT NULL,
	`ElementType` VARCHAR(50) NOT NULL,
	`StrContent` MEDIUMTEXT 	,
	`BinContent` LONGBLOB 	,
	`DocType` VARCHAR(100) 	,
	`Author` VARCHAR(255) 	,
	`Version` VARCHAR(50) 	,
	`IsActive` INT 	 DEFAULT 1,
	`Sequence` INT 	 DEFAULT 0,
	`DocDate` DATETIME 	,
	CONSTRAINT `pk_document` PRIMARY KEY (`DocID` ASC)
);

CREATE TABLE `t_ecf`
(
	`ECFID` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`Weight` DOUBLE NOT NULL DEFAULT 1,
	`Value` DOUBLE 	,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_ecf` PRIMARY KEY (`ECFID` ASC)
);

CREATE TABLE `t_efforttypes`
(
	`EffortType` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(255) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 0,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_efforttypes` PRIMARY KEY (`EffortType` ASC)
);

CREATE TABLE `t_files`
(
	`FileID` VARCHAR(50) NOT NULL,
	`AppliesTo` VARCHAR(50) NOT NULL,
	`Category` VARCHAR(100) NOT NULL,
	`Name` VARCHAR(150) NOT NULL,
	`File` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	`FileDate` DATETIME 	,
	`FileSize` INT 	,
	CONSTRAINT `pk_files` PRIMARY KEY (`FileID` ASC)
);

CREATE TABLE `t_genopt`
(
	`AppliesTo` VARCHAR(12) 	,
	`Option` MEDIUMTEXT 	
);

CREATE TABLE `t_glossary`
(
	`Term` VARCHAR(255) NOT NULL,
	`Type` VARCHAR(255) 	,
	`Meaning` MEDIUMTEXT 	,
	`GlossaryID` INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT `pk_glossary` PRIMARY KEY (`GlossaryID` ASC)
);

CREATE TABLE `t_html`
(
	`Type` VARCHAR(50) 	,
	`Template` MEDIUMTEXT 	
);

CREATE TABLE `t_image`
(
	`ImageID` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(255) 	,
	`Type` VARCHAR(255) 	,
	`Image` LONGBLOB 	,
	CONSTRAINT `pk_image` PRIMARY KEY (`ImageID` ASC)
);

CREATE TABLE `t_implement`
(
	`Type` VARCHAR(50) 	
);

CREATE TABLE `t_issues`
(
	`Issue` VARCHAR(255) 	,
	`IssueDate` DATETIME 	 DEFAULT '0000-00-00 00:00:00',
	`Owner` VARCHAR(255) 	,
	`Status` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	`Resolver` VARCHAR(255) 	,
	`DateResolved` DATETIME 	,
	`Resolution` MEDIUMTEXT 	,
	`IssueID` INT NOT NULL AUTO_INCREMENT,
	`Category` VARCHAR(255) 	,
	`Priority` VARCHAR(50) 	,
	`Severity` VARCHAR(50) 	,
	`IssueType` VARCHAR(100) 	,
	CONSTRAINT `pk_issues` PRIMARY KEY (`IssueID` ASC)
);

CREATE TABLE `t_lists`
(
	`ListID` VARCHAR(50) NOT NULL,
	`Category` VARCHAR(100) NOT NULL,
	`Name` VARCHAR(150) NOT NULL,
	`NVal` INT 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_lists` PRIMARY KEY (`ListID` ASC)
);

CREATE TABLE `t_mainttypes`
(
	`MaintType` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 1,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_mainttypes` PRIMARY KEY (`MaintType` ASC)
);

CREATE TABLE `t_method`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Name` VARCHAR(255) NOT NULL,
	`Scope` VARCHAR(50) 	,
	`Type` VARCHAR(50) 	,
	CONSTRAINT `pk_method` PRIMARY KEY (`Object_ID` ASC, `Name` ASC)
);

CREATE TABLE `t_metrictypes`
(
	`Metric` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 1,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_metrictypes` PRIMARY KEY (`Metric` ASC)
);

CREATE TABLE `t_object`
(
	`Object_ID` INT NOT NULL AUTO_INCREMENT,
	`Object_Type` VARCHAR(255) 	,
	`Diagram_ID` INT 	 DEFAULT 0,
	`Name` VARCHAR(255) 	,
	`Alias` VARCHAR(255) 	,
	`Author` VARCHAR(255) 	,
	`Version` VARCHAR(50) 	 DEFAULT '1.0',
	`Note` MEDIUMTEXT 	,
	`Package_ID` INT NOT NULL DEFAULT 0,
	`Stereotype` VARCHAR(255) 	,
	`NType` INT 	 DEFAULT 0,
	`Complexity` VARCHAR(50) 	 DEFAULT '2',
	`Effort` INT 	 DEFAULT 0,
	`Style` VARCHAR(255) 	,
	`Backcolor` INT 	 DEFAULT 0,
	`BorderStyle` INT 	 DEFAULT 0,
	`BorderWidth` INT 	 DEFAULT 0,
	`Fontcolor` INT 	 DEFAULT 0,
	`Bordercolor` INT 	 DEFAULT 0,
	`CreatedDate` DATETIME 	,
	`ModifiedDate` DATETIME 	,
	`Status` VARCHAR(50) 	,
	`Abstract` CHAR(1) 	,
	`Tagged` INT 	 DEFAULT 0,
	`PDATA1` VARCHAR(255) 	,
	`PDATA2` MEDIUMTEXT 	,
	`PDATA3` MEDIUMTEXT 	,
	`PDATA4` MEDIUMTEXT 	,
	`PDATA5` VARCHAR(255) 	,
	`Concurrency` VARCHAR(50) 	,
	`Visibility` VARCHAR(50) 	,
	`Persistence` VARCHAR(50) 	,
	`Cardinality` VARCHAR(50) 	,
	`GenType` VARCHAR(50) 	,
	`GenFile` VARCHAR(255) 	,
	`Header1` MEDIUMTEXT 	,
	`Header2` MEDIUMTEXT 	,
	`Phase` VARCHAR(50) 	,
	`Scope` VARCHAR(25) 	,
	`GenOption` MEDIUMTEXT 	,
	`GenLinks` MEDIUMTEXT 	,
	`Classifier` INT 	,
	`ea_guid` VARCHAR(40) NOT NULL,
	`ParentID` INT 	,
	`RunState` MEDIUMTEXT 	,
	`Classifier_guid` VARCHAR(40) 	,
	`TPos` INT 	,
	`IsRoot` INT 	,
	`IsLeaf` INT 	,
	`IsSpec` INT 	,
	`IsActive` INT 	,
	`StateFlags` VARCHAR(255) 	,
	`PackageFlags` VARCHAR(255) 	,
	`Multiplicity` VARCHAR(50) 	,
	`StyleEx` MEDIUMTEXT 	,
	`ActionFlags` VARCHAR(255) 	,
	`EventFlags` VARCHAR(255) 	,
	CONSTRAINT `pk_object` PRIMARY KEY (`Object_ID` ASC),
	CONSTRAINT `uq_object_eaguid` UNIQUE (`ea_guid` ASC)
);

CREATE TABLE `t_objectconstraint`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Constraint` VARCHAR(255) NOT NULL,
	`ConstraintType` VARCHAR(30) NOT NULL,
	`Weight` DOUBLE 	,
	`Notes` MEDIUMTEXT 	,
	`Status` VARCHAR(50) 	,
	CONSTRAINT `pk_objectconstraint` PRIMARY KEY (`Object_ID` ASC, `ConstraintType` ASC, `Constraint` ASC)
);

CREATE TABLE `t_objecteffort`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Effort` VARCHAR(255) NOT NULL,
	`EffortType` VARCHAR(12) 	,
	`EValue` DOUBLE 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_objecteffort` PRIMARY KEY (`Object_ID` ASC, `Effort` ASC)
);

CREATE TABLE `t_objectfiles`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`FileName` VARCHAR(255) NOT NULL,
	`Type` VARCHAR(50) 	,
	`Note` MEDIUMTEXT 	,
	`FileSize` VARCHAR(255) 	,
	`FileDate` VARCHAR(255) 	,
	CONSTRAINT `pk_objectfiles` PRIMARY KEY (`Object_ID` ASC, `FileName` ASC)
);

CREATE TABLE `t_objectmetrics`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Metric` VARCHAR(255) NOT NULL,
	`MetricType` VARCHAR(12) NOT NULL,
	`EValue` DOUBLE 	 DEFAULT 1,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_objectmetrics` PRIMARY KEY (`Object_ID` ASC, `Metric` ASC)
);

CREATE TABLE `t_objectproblems`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Problem` VARCHAR(255) NOT NULL,
	`ProblemType` VARCHAR(255) NOT NULL,
	`DateReported` DATE 	,
	`Status` VARCHAR(50) 	,
	`ProblemNotes` MEDIUMTEXT 	,
	`ReportedBy` VARCHAR(255) 	,
	`ResolvedBy` VARCHAR(255) 	,
	`DateResolved` DATE 	,
	`Version` VARCHAR(50) 	,
	`ResolverNotes` MEDIUMTEXT 	,
	`Priority` VARCHAR(50) 	,
	`Severity` VARCHAR(50) 	,
	CONSTRAINT `pk_objectproblems` PRIMARY KEY (`Object_ID` ASC, `ProblemType` ASC, `Problem` ASC)
);

CREATE TABLE `t_objectproperties`
(
	`PropertyID` INT NOT NULL AUTO_INCREMENT,
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Property` VARCHAR(255) 	,
	`Value` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	`ea_guid` VARCHAR(40) 	,
	CONSTRAINT `pk_objectproperties` PRIMARY KEY (`PropertyID` ASC)
);

CREATE TABLE `t_objectrequires`
(
	`ReqID` INT NOT NULL AUTO_INCREMENT,
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Requirement` VARCHAR(255) 	,
	`ReqType` VARCHAR(255) 	,
	`Status` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	`Stability` VARCHAR(50) 	,
	`Difficulty` VARCHAR(50) 	,
	`Priority` VARCHAR(50) 	,
	`LastUpdate` VARCHAR(19) 	,
	CONSTRAINT `pk_objectrequires` PRIMARY KEY (`ReqID` ASC)
);

CREATE TABLE `t_objectresource`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Resource` VARCHAR(255) NOT NULL,
	`Role` VARCHAR(255) NOT NULL,
	`Time` DOUBLE 	,
	`Notes` MEDIUMTEXT 	,
	`PercentComplete` SMALLINT 	 DEFAULT 0,
	`DateStart` DATE 	,
	`DateEnd` DATE 	,
	`History` MEDIUMTEXT 	,
	`ExpectedHours` INT 	 DEFAULT 0,
	`ActualHours` INT 	 DEFAULT 0,
	CONSTRAINT `pk_objectresource` PRIMARY KEY (`Object_ID` ASC, `Resource` ASC, `Role` ASC)
);

CREATE TABLE `t_objectrisks`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Risk` VARCHAR(255) NOT NULL,
	`RiskType` VARCHAR(12) 	,
	`EValue` DOUBLE 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_objectrisks` PRIMARY KEY (`Object_ID` ASC, `Risk` ASC)
);

CREATE TABLE `t_objectscenarios`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Scenario` VARCHAR(255) NOT NULL,
	`ScenarioType` VARCHAR(12) 	,
	`EValue` DOUBLE 	,
	`Notes` MEDIUMTEXT 	,
	`ea_guid` VARCHAR(40) NOT NULL,
	`XMLContent` MEDIUMTEXT 	,
	CONSTRAINT `pk_objectscenarios` PRIMARY KEY (`Object_ID` ASC, `Scenario` ASC)
);

CREATE TABLE `t_objecttests`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Test` VARCHAR(255) NOT NULL,
	`TestClass` INT NOT NULL DEFAULT 0,
	`TestType` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	`InputData` MEDIUMTEXT 	,
	`AcceptanceCriteria` MEDIUMTEXT 	,
	`Status` VARCHAR(32) 	,
	`DateRun` DATE 	,
	`Results` MEDIUMTEXT 	,
	`RunBy` VARCHAR(255) 	,
	`CheckBy` VARCHAR(255) 	,
	CONSTRAINT `pk_objecttests` PRIMARY KEY (`Object_ID` ASC, `Test` ASC, `TestClass` ASC)
);

CREATE TABLE `t_objecttrx`
(
	`Object_ID` INT NOT NULL DEFAULT 0,
	`TRX` VARCHAR(255) NOT NULL,
	`TRXType` VARCHAR(12) NOT NULL,
	`Weight` DOUBLE 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_objecttrx` PRIMARY KEY (`Object_ID` ASC, `TRXType` ASC, `TRX` ASC)
);

CREATE TABLE `t_objecttypes`
(
	`Object_Type` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(255) 	,
	`DesignObject` INT 	,
	`ImageID` SMALLINT NOT NULL DEFAULT 0,
	CONSTRAINT `pk_objecttypes` PRIMARY KEY (`Object_Type` ASC)
);

CREATE TABLE `t_ocf`
(
	`ObjectType` VARCHAR(50) 	,
	`ComplexityWeight` DOUBLE 	
);

CREATE TABLE `t_operation`
(
	`OperationID` INT NOT NULL AUTO_INCREMENT,
	`Object_ID` INT NOT NULL DEFAULT 0,
	`Name` VARCHAR(255) NOT NULL,
	`Scope` VARCHAR(50) 	,
	`Type` VARCHAR(255) 	,
	`ReturnArray` CHAR(1) 	,
	`Stereotype` VARCHAR(50) 	,
	`IsStatic` CHAR(1) 	,
	`Concurrency` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	`Behaviour` MEDIUMTEXT 	,
	`Abstract` CHAR(1) 	,
	`GenOption` MEDIUMTEXT 	,
	`Synchronized` CHAR(1) 	,
	`Pos` INT 	,
	`Const` INT 	,
	`Style` VARCHAR(255) 	,
	`Pure` INT 	,
	`Throws` VARCHAR(255) 	,
	`Classifier` VARCHAR(50) 	,
	`Code` MEDIUMTEXT 	,
	`IsRoot` INT 	,
	`IsLeaf` INT 	,
	`IsQuery` INT 	,
	`StateFlags` VARCHAR(255) 	,
	`ea_guid` VARCHAR(50) NOT NULL,
	`StyleEx` MEDIUMTEXT 	,
	CONSTRAINT `pk_operation` PRIMARY KEY (`OperationID` ASC),
	CONSTRAINT `uq_operation_eaguid` UNIQUE (`ea_guid` ASC)
);

CREATE TABLE `t_operationparams`
(
	`OperationID` INT NOT NULL DEFAULT 0,
	`Name` VARCHAR(255) NOT NULL,
	`Type` VARCHAR(255) 	,
	`Default` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	`Pos` INT NOT NULL DEFAULT 0,
	`Const` INT 	,
	`Style` VARCHAR(255) 	,
	`Kind` VARCHAR(12) 	,
	`Classifier` VARCHAR(50) 	,
	`ea_guid` VARCHAR(50) NOT NULL,
	`StyleEx` MEDIUMTEXT 	,
	CONSTRAINT `pk_operationparams` PRIMARY KEY (`OperationID` ASC, `Name` ASC),
	CONSTRAINT `uq_operationparams_eaguid` UNIQUE (`ea_guid` ASC)
);

CREATE TABLE `t_operationposts`
(
	`OperationID` INT NOT NULL DEFAULT 0,
	`PostCondition` VARCHAR(255) NOT NULL,
	`Type` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_operationposts` PRIMARY KEY (`OperationID` ASC, `PostCondition` ASC)
);

CREATE TABLE `t_operationpres`
(
	`OperationID` INT NOT NULL DEFAULT 0,
	`PreCondition` VARCHAR(255) NOT NULL,
	`Type` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_operationpres` PRIMARY KEY (`OperationID` ASC, `PreCondition` ASC)
);

CREATE TABLE `t_operationtag`
(
	`PropertyID` INT NOT NULL AUTO_INCREMENT,
	`ElementID` INT NOT NULL DEFAULT 0,
	`Property` VARCHAR(255) 	,
	`VALUE` VARCHAR(255) 	,
	`NOTES` MEDIUMTEXT 	,
	`ea_guid` VARCHAR(40) 	,
	CONSTRAINT `pk_operationtag` PRIMARY KEY (`PropertyID` ASC)
);

CREATE TABLE `t_package`
(
	`Package_ID` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(255) 	,
	`Parent_ID` INT NOT NULL DEFAULT 0,
	`CreatedDate` DATETIME 	,
	`ModifiedDate` DATETIME 	,
	`Notes` MEDIUMTEXT 	,
	`ea_guid` VARCHAR(40) NOT NULL,
	`XMLPath` VARCHAR(255) 	,
	`IsControlled` INT 	,
	`LastLoadDate` DATETIME 	,
	`LastSaveDate` DATETIME 	,
	`Version` VARCHAR(50) 	,
	`Protected` INT 	,
	`PkgOwner` VARCHAR(255) 	,
	`UMLVersion` VARCHAR(50) 	,
	`UseDTD` INT 	,
	`LogXML` INT 	,
	`CodePath` VARCHAR(255) 	,
	`Namespace` VARCHAR(50) 	,
	`TPos` INT 	,
	`PackageFlags` VARCHAR(255) 	,
	`BatchSave` INT 	 DEFAULT 0,
	`BatchLoad` INT 	 DEFAULT 0,
	CONSTRAINT `pk_package` PRIMARY KEY (`Package_ID` ASC),
	CONSTRAINT `uq_package_eaguid` UNIQUE (`ea_guid` ASC)
);

CREATE TABLE `t_palette`
(
	`PaletteID` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(255) 	,
	`Type` VARCHAR(255) 	,
	CONSTRAINT `pk_palette` PRIMARY KEY (`PaletteID` ASC)
);

CREATE TABLE `t_paletteitem`
(
	`PaletteID` INT 	,
	`ItemID` INT 	
);

CREATE TABLE `t_phase`
(
	`PhaseID` VARCHAR(40) NOT NULL,
	`PhaseName` VARCHAR(100) NOT NULL,
	`PhaseNotes` MEDIUMTEXT 	,
	`PhaseStyle` VARCHAR(255) 	,
	`StartDate` DATETIME 	,
	`EndDate` DATETIME 	,
	`PhaseContent` MEDIUMTEXT 	,
	CONSTRAINT `pk_phase` PRIMARY KEY (`PhaseID` ASC)
);

CREATE TABLE `t_primitives`
(
	`Datatype` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(50) 	,
	CONSTRAINT `pk_primitives` PRIMARY KEY (`Datatype` ASC)
);

CREATE TABLE `t_problemtypes`
(
	`ProblemType` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(255) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 1,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_problemtypes` PRIMARY KEY (`ProblemType` ASC)
);

CREATE TABLE `t_projectroles`
(
	`Role` VARCHAR(255) NOT NULL,
	`Description` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_projectroles` PRIMARY KEY (`Role` ASC)
);

CREATE TABLE `t_propertytypes`
(
	`Property` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(50) 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_propertytypes` PRIMARY KEY (`Property` ASC)
);

CREATE TABLE `t_requiretypes`
(
	`Requirement` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 1,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_requiretypes` PRIMARY KEY (`Requirement` ASC)
);

CREATE TABLE `t_resources`
(
	`Name` VARCHAR(255) NOT NULL,
	`Organisation` VARCHAR(255) 	,
	`Phone1` VARCHAR(50) 	,
	`Phone2` VARCHAR(50) 	,
	`Mobile` VARCHAR(50) 	,
	`Fax` VARCHAR(50) 	,
	`Email` VARCHAR(255) 	,
	`Roles` VARCHAR(255) 	,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_resources` PRIMARY KEY (`Name` ASC)
);

CREATE TABLE `t_risktypes`
(
	`Risk` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 0,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_risktypes` PRIMARY KEY (`Risk` ASC)
);

CREATE TABLE `t_roleconstraint`
(
	`ConnectorID` INT NOT NULL DEFAULT 0,
	`Constraint` VARCHAR(255) NOT NULL,
	`ConnectorEnd` VARCHAR(50) NOT NULL,
	`ConstraintType` VARCHAR(12) NOT NULL,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_roleconstraint` PRIMARY KEY (`ConnectorID` ASC, `Constraint` ASC, `ConnectorEnd` ASC, `ConstraintType` ASC)
);

CREATE TABLE `t_rtf`
(
	`Type` VARCHAR(50) 	,
	`Template` MEDIUMTEXT 	
);

CREATE TABLE `t_rtfreport`
(
	`TemplateID` VARCHAR(200) NOT NULL,
	`RootPackage` INT 	 DEFAULT 0,
	`Filename` VARCHAR(255) 	,
	`Details` INT 	,
	`ProcessChildren` INT 	,
	`ShowDiagrams` INT 	,
	`Heading` VARCHAR(255) 	,
	`Requirements` INT 	,
	`Associations` INT 	,
	`Scenarios` INT 	,
	`ChildDiagrams` INT 	,
	`Attributes` INT 	,
	`Methods` INT 	,
	`ImageType` INT 	 DEFAULT 0,
	`Paging` INT 	,
	`Intro` MEDIUMTEXT 	,
	`Resources` INT 	,
	`Constraints` INT 	,
	`Tagged` INT 	,
	`ShowTag` INT 	,
	`ShowAlias` INT 	,
	`PDATA1` VARCHAR(255) 	,
	`PDATA2` VARCHAR(255) 	,
	`PDATA3` VARCHAR(255) 	,
	`PDATA4` MEDIUMTEXT 	,
	CONSTRAINT `pk_rtfreport` PRIMARY KEY (`TemplateID` ASC)
);

CREATE TABLE `t_rules`
(
	`RuleID` VARCHAR(50) NOT NULL,
	`RuleName` VARCHAR(255) NOT NULL,
	`RuleType` VARCHAR(255) NOT NULL,
	`RuleActive` INT NOT NULL DEFAULT 0,
	`ErrorMsg` VARCHAR(255) 	,
	`Flags` VARCHAR(255) 	,
	`RuleOCL` MEDIUMTEXT 	,
	`RuleXML` MEDIUMTEXT 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_rules` PRIMARY KEY (`RuleID` ASC)
);

CREATE TABLE `t_scenariotypes`
(
	`ScenarioType` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 1,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_scenariotypes` PRIMARY KEY (`ScenarioType` ASC)
);

CREATE TABLE `t_script`
(
	`ScriptID` INT NOT NULL AUTO_INCREMENT,
	`ScriptCategory` VARCHAR(100) 	,
	`ScriptName` VARCHAR(150) 	,
	`ScriptAuthor` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	`Script` MEDIUMTEXT 	,
	CONSTRAINT `pk_script` PRIMARY KEY (`ScriptID` ASC)
);

CREATE TABLE `t_secgroup`
(
	`GroupID` VARCHAR(40) NOT NULL,
	`GroupName` VARCHAR(32) NOT NULL,
	`Description` VARCHAR(100) 	,
	CONSTRAINT `pk_secgroup` PRIMARY KEY (`GroupID` ASC)
);

CREATE TABLE `t_secgrouppermission`
(
	`GroupID` VARCHAR(40) NOT NULL,
	`PermissionID` INT NOT NULL DEFAULT 0,
	CONSTRAINT `pk_secgrouppermission` PRIMARY KEY (`GroupID` ASC, `PermissionID` ASC)
);

CREATE TABLE `t_seclocks`
(
	`UserID` VARCHAR(40) NOT NULL,
	`GroupID` VARCHAR(40) 	,
	`EntityType` VARCHAR(32) NOT NULL,
	`EntityID` VARCHAR(40) NOT NULL,
	`Timestamp` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	`LockType` VARCHAR(255) 	,
	CONSTRAINT `pk_seclocks` PRIMARY KEY (`EntityID` ASC)
);

CREATE TABLE `t_secpermission`
(
	`PermissionID` INT NOT NULL DEFAULT 0,
	`PermissionName` VARCHAR(50) NOT NULL,
	CONSTRAINT `pk_secpermission` PRIMARY KEY (`PermissionID` ASC)
);

CREATE TABLE `t_secpolicies`
(
	`Property` VARCHAR(100) NOT NULL,
	`Value` VARCHAR(255) NOT NULL,
	CONSTRAINT `pk_secpolicies` PRIMARY KEY (`Property` ASC)
);

CREATE TABLE `t_secuser`
(
	`UserID` VARCHAR(40) NOT NULL,
	`UserLogin` VARCHAR(32) NOT NULL,
	`FirstName` VARCHAR(50) NOT NULL,
	`Surname` VARCHAR(50) NOT NULL,
	`Department` VARCHAR(50) 	,
	`Password` VARCHAR(12) 	,
	CONSTRAINT `pk_secuser` PRIMARY KEY (`UserID` ASC)
);

CREATE TABLE `t_secusergroup`
(
	`UserID` VARCHAR(40) NOT NULL,
	`GroupID` VARCHAR(40) NOT NULL,
	CONSTRAINT `pk_secusergroup` PRIMARY KEY (`UserID` ASC, `GroupID` ASC)
);

CREATE TABLE `t_secuserpermission`
(
	`UserID` VARCHAR(40) NOT NULL,
	`PermissionID` INT NOT NULL DEFAULT 0,
	CONSTRAINT `pk_secuserpermission` PRIMARY KEY (`UserID` ASC, `PermissionID` ASC)
);

CREATE TABLE `t_snapshot`
(
	`SnapshotID` VARCHAR(40) NOT NULL,
	`SeriesID` VARCHAR(40) NOT NULL,
	`Position` INT NOT NULL DEFAULT 0,
	`SnapshotName` VARCHAR(100) NOT NULL,
	`Notes` MEDIUMTEXT 	,
	`Style` VARCHAR(255) NOT NULL,
	`ElementID` VARCHAR(40) 	,
	`ElementType` VARCHAR(50) NOT NULL,
	`StrContent` MEDIUMTEXT 	,
	`BinContent1` LONGBLOB 	,
	`BinContent2` LONGBLOB 	,
	CONSTRAINT `pk_snapshot` PRIMARY KEY (`SnapshotID` ASC)
);

CREATE TABLE `t_statustypes`
(
	`Status` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(50) 	,
	CONSTRAINT `pk_statustypes` PRIMARY KEY (`Status` ASC)
);

CREATE TABLE `t_stereotypes`
(
	`Stereotype` VARCHAR(255) NOT NULL,
	`AppliesTo` VARCHAR(255) NOT NULL,
	`Description` VARCHAR(255) 	,
	`MFEnabled` INT 	,
	`MFPath` VARCHAR(255) 	,
	`Metafile` LONGBLOB 	,
	`Style` MEDIUMTEXT 	,
	`ea_guid` VARCHAR(50) 	,
	`VisualType` VARCHAR(100) 	,
	CONSTRAINT `pk_stereotypes` PRIMARY KEY (`AppliesTo` ASC, `Stereotype` ASC)
);

CREATE TABLE `t_taggedvalue`
(
	`PropertyID` VARCHAR(40) NOT NULL,
	`ElementID` VARCHAR(40) NOT NULL,
	`BaseClass` VARCHAR(100) NOT NULL,
	`TagValue` MEDIUMTEXT 	,
	`Notes` MEDIUMTEXT 	,
	CONSTRAINT `pk_taggedvalue` PRIMARY KEY (`PropertyID` ASC)
);

CREATE TABLE `t_tasks`
(
	`TaskID` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(255) 	,
	`TaskType` VARCHAR(255) 	,
	`NOTES` MEDIUMTEXT 	,
	`Priority` VARCHAR(255) 	,
	`Status` VARCHAR(255) 	,
	`Owner` VARCHAR(255) 	,
	`StartDate` DATE 	,
	`EndDate` DATE 	,
	`Phase` VARCHAR(50) 	,
	`History` MEDIUMTEXT 	,
	`Percent` INT 	,
	`TotalTime` INT 	,
	`ActualTime` INT 	,
	`AssignedTo` VARCHAR(100) 	,
	CONSTRAINT `pk_tasks` PRIMARY KEY (`TaskID` ASC)
);

CREATE TABLE `t_tcf`
(
	`TCFID` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`Weight` DOUBLE NOT NULL DEFAULT 1,
	`Value` DOUBLE 	,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_tcf` PRIMARY KEY (`TCFID` ASC)
);

CREATE TABLE `t_template`
(
	`TemplateID` VARCHAR(40) NOT NULL,
	`TemplateType` VARCHAR(50) NOT NULL,
	`TemplateName` VARCHAR(100) NOT NULL,
	`Notes` VARCHAR(255) 	,
	`Style` VARCHAR(255) 	,
	`Template` MEDIUMTEXT 	,
	CONSTRAINT `pk_template` PRIMARY KEY (`TemplateID` ASC)
);

CREATE TABLE `t_testclass`
(
	`TestClass` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(50) 	,
	CONSTRAINT `pk_testclass` PRIMARY KEY (`TestClass` ASC)
);

CREATE TABLE `t_testplans`
(
	`PlanID` VARCHAR(50) NOT NULL,
	`Category` VARCHAR(100) NOT NULL,
	`Name` VARCHAR(150) NOT NULL,
	`Author` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	`TestPlan` MEDIUMTEXT 	,
	CONSTRAINT `pk_testplans` PRIMARY KEY (`PlanID` ASC)
);

CREATE TABLE `t_testtypes`
(
	`TestType` VARCHAR(12) NOT NULL,
	`Description` VARCHAR(50) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 1,
	`Notes` VARCHAR(255) 	,
	CONSTRAINT `pk_testtypes` PRIMARY KEY (`TestType` ASC)
);

CREATE TABLE `t_trxtypes`
(
	`TRX` VARCHAR(255) NOT NULL,
	`Description` VARCHAR(50) 	,
	`NumericWeight` DOUBLE NOT NULL DEFAULT 1,
	`Notes` MEDIUMTEXT 	,
	`Style` MEDIUMTEXT 	,
	`TRX_ID` INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT `pk_trxtypes` PRIMARY KEY (`TRX_ID` ASC)
);

CREATE TABLE `t_umlpattern`
(
	`PatternID` INT NOT NULL AUTO_INCREMENT,
	`PatternCategory` VARCHAR(100) 	,
	`PatternName` VARCHAR(150) NOT NULL,
	`Style` VARCHAR(255) 	,
	`Notes` MEDIUMTEXT 	,
	`PatternXML` MEDIUMTEXT NOT NULL,
	`Version` VARCHAR(50) 	,
	CONSTRAINT `pk_umlpattern` PRIMARY KEY (`PatternID` ASC)
);

CREATE TABLE `t_version`
(
	`ElementID` VARCHAR(50) NOT NULL,
	`VersionID` VARCHAR(255) NOT NULL,
	`ElementType` VARCHAR(100) NOT NULL,
	`Flags` VARCHAR(255) 	,
	`ExternalFile` VARCHAR(255) 	,
	`Notes` VARCHAR(255) 	,
	`Owner` VARCHAR(255) 	,
	`VersionDate` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	`Branch` VARCHAR(255) 	,
	`ElementXML` MEDIUMTEXT 	,
	CONSTRAINT `pk_version` PRIMARY KEY (`ElementID` ASC, `VersionID` ASC)
);

CREATE TABLE `t_xref`
(
	`XrefID` VARCHAR(255) NOT NULL,
	`Name` VARCHAR(255) 	,
	`Type` VARCHAR(255) NOT NULL,
	`Visibility` VARCHAR(255) 	,
	`Namespace` VARCHAR(255) 	,
	`Requirement` VARCHAR(255) 	,
	`Constraint` VARCHAR(255) 	,
	`Behavior` VARCHAR(255) 	,
	`Partition` VARCHAR(255) 	,
	`Description` MEDIUMTEXT 	,
	`Client` VARCHAR(255) 	,
	`Supplier` VARCHAR(255) 	,
	`Link` VARCHAR(255) 	,
	CONSTRAINT `pk_xref` PRIMARY KEY (`XrefID` ASC)
);

CREATE TABLE `t_xrefsystem`
(
	`XrefID` VARCHAR(255) NOT NULL,
	`Name` VARCHAR(255) 	,
	`Type` VARCHAR(255) NOT NULL,
	`Visibility` VARCHAR(255) 	,
	`Namespace` VARCHAR(255) 	,
	`Requirement` VARCHAR(255) 	,
	`Constraint` VARCHAR(255) 	,
	`Behavior` VARCHAR(255) 	,
	`Partition` VARCHAR(255) 	,
	`Description` MEDIUMTEXT 	,
	`Client` VARCHAR(255) 	,
	`Supplier` VARCHAR(255) 	,
	`Link` VARCHAR(255) 	,
	`ToolID` VARCHAR(50) 	,
	CONSTRAINT `pk_xrefsystem` PRIMARY KEY (`XrefID` ASC)
);

CREATE TABLE `t_xrefuser`
(
	`XrefID` VARCHAR(255) NOT NULL,
	`Name` VARCHAR(255) 	,
	`Type` VARCHAR(255) NOT NULL,
	`Visibility` VARCHAR(255) 	,
	`Namespace` VARCHAR(255) 	,
	`Requirement` VARCHAR(255) 	,
	`Constraint` VARCHAR(255) 	,
	`Behavior` VARCHAR(255) 	,
	`Partition` VARCHAR(255) 	,
	`Description` MEDIUMTEXT 	,
	`Client` VARCHAR(255) 	,
	`Supplier` VARCHAR(255) 	,
	`Link` VARCHAR(255) 	,
	`ToolID` VARCHAR(50) 	,
	CONSTRAINT `pk_xrefuser` PRIMARY KEY (`XrefID` ASC)
);

CREATE TABLE `usys_system`
(
	`Property` VARCHAR(50) NOT NULL,
	`Value` VARCHAR(50) 	,
	CONSTRAINT `pk_usyssystem` PRIMARY KEY (`Property` ASC)
);

CREATE TABLE `usysoldtables`
(
	`TableName` VARCHAR(50) 	,
	`NewName` VARCHAR(50) 	,
	`RelOrder` INT 	 DEFAULT 0,
	`FixCode` INT 	
);

CREATE TABLE `usysqueries`
(
	`QueryName` VARCHAR(50) 	,
	`NewName` VARCHAR(50) 	,
	`FixCode` INT 	
);

CREATE TABLE `usystables`
(
	`TableName` VARCHAR(50) NOT NULL,
	`RelOrder` INT 	 DEFAULT 0,
	`DisplayName` VARCHAR(50) 	,
	`FromVer` VARCHAR(50) 	,
	`ToVer` VARCHAR(50) 	,
	CONSTRAINT `pk_usystables` PRIMARY KEY (`TableName` ASC)
);
