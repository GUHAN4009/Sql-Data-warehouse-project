/*____________________________________________________________________________________________________________________________________________________________________________
script purpose:
  we create new database Data warehouse .
  And as we follow medallion arhitecture we create three schemas bronze , silver , gold
  */




  
use master;


--creat datawarehouse data base 
create database DataWarehouse;

--create schema bronze
create schema bronze;

--create schema silver
create schema silver;

--create schema gold
create schema gold;
