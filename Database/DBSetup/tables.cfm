	<cfquery datasource="capstoneDB">


		DROP TABLE Loc_Service;
		DROP TABLE Location;
		DROP TABLE Service;
		DROP TABLE Provider;

  		CREATE TABLE Service (
				ID bigint IDENTITY PRIMARY KEY,
				name varchar(255) NOT NULL UNIQUE ,
				description varchar(MAX)
			);


		CREATE TABLE Provider(
				ID bigint IDENTITY PRIMARY KEY,
				name varchar(255) NOT NULL UNIQUE ,
				description varchar(MAX),
				website varchar(MAX)

			);

		CREATE TABLE Location(
				ID bigint IDENTITY PRIMARY KEY,
				Provider_ID bigint NOT NULL FOREIGN KEY REFERENCES Provider(ID),
				address varchar(255) NOT NULL ,
				hours varchar(MAX),
				phone varchar(255),
				geo_lat float,
				geo_lng float
			);

		CREATE TABLE Loc_Service(

				Location_ID bigint NOT NULL FOREIGN KEY REFERENCES Location(ID),
				Service_ID bigint NOT NULL FOREIGN KEY REFERENCES Service(ID),
				PRIMARY KEY (Location_ID, Service_ID),

			);


	</cfquery>

Database Created
