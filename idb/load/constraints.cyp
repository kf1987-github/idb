
CREATE CONSTRAINT FOR (n:Database) REQUIRE n.db_name IS UNIQUE;
CREATE CONSTRAINT FOR (n:Host) REQUIRE n.host_name IS UNIQUE;
CREATE CONSTRAINT FOR (n:Table) REQUIRE n.pk_table IS UNIQUE;

