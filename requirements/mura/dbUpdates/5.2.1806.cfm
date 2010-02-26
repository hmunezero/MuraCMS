<!--- make sure tcontentfeeds.remoteID exists --->

<cfset doUpdate=false>

<cftry>
<cfquery name="rsCheck" datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
select remoteID from tcontentfeeds  where 0=1
</cfquery>
<cfcatch>
<cfset doUpdate=true>
</cfcatch>
</cftry>

<cfif doUpdate>
<cfswitch expression="#getDbType()#">
<cfcase value="mssql">
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentfeeds ADD remoteID [nvarchar](255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentfeeds ADD remoteSourceURL [nvarchar](255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	CREATE  INDEX [IX_feed_remoteID] ON [dbo].[tcontentfeeds]([remoteID]) ON [PRIMARY]
	</cfquery>
</cfcase>
<cfcase value="mysql">
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentfeeds ADD remoteID varchar(255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentfeeds ADD remoteSourceURL varchar(255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	CREATE INDEX IX_feed_remoteID ON tcontentfeeds (remoteID)
	</cfquery>
</cfcase>
<cfcase value="oracle">
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE "TCONTENTFEEDS" ADD "REMOTEID" varchar2(255)
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE "TCONTENTFEEDS" ADD "REMOTESOURCEURL" varchar2(255)
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	CREATE INDEX "IDX_FEED_REMOTEID" ON "TCONTENTFEEDS" ("REMOTEID") 
	</cfquery>
</cfcase>
</cfswitch>
</cfif>

<cfset doUpdate=false>
<cftry>
<cfquery name="rsCheck" datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
select remoteID from tcontentcategories  where 0=1
</cfquery>
<cfcatch>
<cfset doUpdate=true>
</cfcatch>
</cftry>

<cfif doUpdate>
<cfswitch expression="#getDbType()#">
<cfcase value="mssql">
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentcategories ADD remoteID [nvarchar](255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentcategories ADD remoteSourceURL [nvarchar](255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	CREATE  INDEX [IX_category_remoteID] ON [dbo].[tcontentcategories]([remoteID]) ON [PRIMARY]
	</cfquery>
</cfcase>
<cfcase value="mysql">
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentcategories ADD remoteID varchar(255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE tcontentcategories ADD remoteSourceURL varchar(255) default NULL
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	CREATE INDEX IX_category_remoteID ON tcontentcategories (remoteID)
	</cfquery>
</cfcase>
<cfcase value="oracle">
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE "TCONTENTCATEGORIES" ADD "REMOTEID" varchar2(255)
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	ALTER TABLE "TCONTENTCATEGORIES" ADD "REMOTESOURCEURL" varchar2(255)
	</cfquery>
	<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
	CREATE INDEX "IDX_CATEGORY_REMOTEID" ON "TCONTENTCATEGORIES" ("REMOTEID") 
	</cfquery>
</cfcase>
</cfswitch>
</cfif>
