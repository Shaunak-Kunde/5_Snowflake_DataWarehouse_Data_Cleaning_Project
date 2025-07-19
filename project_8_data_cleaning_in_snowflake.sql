CUMMULATIVE CHALLENGE
-- ********************************** CUMULATIVE CHALLENGE **********************************
--
-- ****************** FIND THE LIST OF TOP 5 SOLD PRODUCTS PER CITY DURING JAN 2023 *********
-- 

-- Step 1: Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA; -- Use the Project Database COURSERA.
USE SCHEMA PUBLIC;


-- Step 2: Run the script below to create new table ORDERS 

CREATE OR REPLACE TABLE ORDERS (
  ORDERID varchar(50),
  CUSTOMERID INT ,
  ORDERDATE varchar(50),
  SKUNUMBER varchar(50),
  ORDERCITY varchar(50) default NULL,
  UNITPRICE varchar(10) default NULL,
  QUANTITY varchar(10) default NULL,
  PRODUCT varchar(255) default NULL
) ;


-- Step 3: run the script below to Load the ORDERS dataset into Table ORDERS
 
INSERT INTO ORDERS (ORDERID,CUSTOMERID,ORDERDATE,SKUNUMBER,ORDERCITY,UNITPRICE,QUANTITY,PRODUCT)
VALUES
  ('Trans-5100',14,'Jan 12, 2023','NIG76IBE1YZ','NEWCASTLE',108.99,3,'STRIPED KNIT SWEATER,BLUE'),
  ('Trans-5101',20,'Jan 25, 2023','TOF73QIM8YT',' LIVERPOOL',202.99,3,'JOGGER WAIST TROUSER,RED'),
  ('Trans-5102',6,'Jan 20, 2023','SGU67EVA9HM','NEWCASTLE',367.99,3,'HIGH-WAIST TROUSER,GREEN'),
  ('Trans-5103',22,'Jan 21, 2023','LRR19TIT3TT','BIRMINGHAM',160.99,4,'CROPPED HOODIE,BLACK'),
  ('Trans-5104',18,'Jan 11, 2023','SWC07OOT1YE','MANCHESTER',182.99,2,'COLOUR BLOCK LEATHER JACKET,BROWN'),
  ('Trans-5105',5,'Jan 16, 2023','VLJ45YBV3SB','LONDON',101.99,2,'SHIRT WITH CONTRAST COLLAR,WHITE'),
  ('Trans-5106',11,'Jan 8, 2023','ZTY13JXH8FW','MANCHESTER',196.99,2,'SLIM-FIT SUIT BLAZER,NAVY'),
  ('Trans-5107',14,'Jan 5, 2023','SNE31JUO7BA','LONDON',178.99,4,'SOFT BOWLING BAG,GRAY'),
  ('Trans-5108',6,'Jan 19, 2023','GVP41WIJ4OU','LONDON',264.99,1,'STUDDED DENIM SKIRT,AQUA'),
  ('Trans-5109',6,'Jan 13, 2023','DIJ63KVR6FS','LONDON',149.99,4,'STUDDED DENIM SKIRT,OLIVE'),
  ('Trans-5110',17,'Jan 27, 2023','YLH92ELD1HN','SOUTHAMPTON   ',317.99,5,'OVERSIZED HOODIE,PINK'),
  ('Trans-5111',18,'Jan 21, 2023','YGF15PCW0YG','BIRMINGHAM',222.99,2,'CROPPED HOODIE,BLUE'),
  ('Trans-5112',9,'Jan 27, 2023','IJC78XRP8IV','BIRMINGHAM',355.99,3,'CROPPED HOODIE,RED'),
  ('Trans-5113',13,'Jan 24, 2023','BFA61TEZ4QB','LONDON',170.99,2,'FAUX SUEDE BOMBER JACKET,GREEN'),
  ('Trans-5114',14,'Jan 24, 2023','TZB01UYI1IG',' LIVERPOOL',105.99,4,'KNIT POLO SHIRT,BLACK'),
  ('Trans-5115',6,'Jan 19, 2023','DTU49HSU8EL','MANCHESTER',241.99,4,'STRIPED KNIT SWEATER,BROWN'),
  ('Trans-5116',21,'Jan 24, 2023','WMU25CRY2NM',' LIVERPOOL',271.99,4,'JOGGER WAIST TROUSER,WHITE'),
  ('Trans-5117',13,'Jan 18, 2023','JXU58RCC6IX',' LONDON',171.99,2,'HIGH-WAIST TROUSER,NAVY'),
  ('Trans-5118',13,'Jan 20, 2023','JZR61EKK8JG','LIVERPOOL',157.99,2,'FAUX SUEDE BOMBER JACKET,GRAY'),
  ('Trans-5119',14,'Jan 20, 2023','RTB15MDH8YC','LONDON',382.99,2,'COLOUR BLOCK LEATHER JACKET,AQUA'),
  ('Trans-5120',6,'Jan 22, 2023','AOG31PWX3DJ','BIRMINGHAM',135.99,1,'SHIRT WITH CONTRAST COLLAR,OLIVE'),
  ('Trans-5121',19,'Dec 31, 2022','TGD17SWE2AL','BIRMINGHAM',359.99,2,'SLIM-FIT SUIT BLAZER,PINK'),
  ('Trans-5122',18,'Jan 17, 2023','SHA06ADD5RX',' LONDON',165.99,4,'SOFT BOWLING BAG,BLUE'),
  ('Trans-5123',21,'Jan 9, 2023','LOU72RGC6VH','LONDON',317.99,3,'LONG DENIM BERMUDA SHORT,RED'),
  ('Trans-5124',4,'Jan 19, 2023','PFE06YUI2CT',' LONDON',382.99,3,'STUDDED DENIM SKIRT,GREEN'),
  ('Trans-5125',19,'Jan 23, 2023','UMC96SGW2SB',' LONDON',340.99,1,'FAUX SUEDE BOMBER JACKET,BLACK'),
  ('Trans-5126',4,'Jan 15, 2023','SLY30ICE7RA','BIRMINGHAM',299.99,5,'CROPPED HOODIE,BROWN'),
  ('Trans-5127',12,'Jan 17, 2023','BGG24DKG2BN','LONDON',391.99,4,'RIPPED JEANS,WHITE'),
  ('Trans-5128',17,'Jan 9, 2023','UJS16MCQ6IJ','LONDON',321.99,3,'SLIM FIT JEANS,NAVY'),
  ('Trans-5129',9,'Jan 11, 2023','QTW93LNN8XF','LONDON',276.99,2,'KNIT POLO SHIRT,GRAY'),
  ('Trans-5130',12,'Jan 14, 2023','XGB55LOE1JD','MANCHESTER',186.99,2,'STRIPED KNIT SWEATER,AQUA'),
  ('Trans-5131',15,'Jan 12, 2023','NVT72PTG8ET','NEWCASTLE',196.99,3,'JOGGER WAIST TROUSER,OLIVE'),
  ('Trans-5132',19,'Jan 11, 2023','OGS45KXG3MF','BIRMINGHAM',289.99,2,'HIGH-WAIST TROUSER,PINK'),
  ('Trans-5133',13,'Jan 17, 2023','LYK77BJW1JB','LIVERPOOL',251.99,2,'JOGGER WAIST TROUSER,BLUE'),
  ('Trans-5134',5,'Jan 28, 2023','YFS76GVV7LB','NEWCASTLE',275.99,3,'COLOUR BLOCK LEATHER JACKET,RED'),
  ('Trans-5135',2,'Jan 8, 2023','WJU50PWK6EO','SOUTHAMPTON   ',146.99,4,'SHIRT WITH CONTRAST COLLAR,GREEN'),
  ('Trans-5136',14,'Jan 28, 2023','MDQ13GNX7FR',' LONDON',195.99,1,'SLIM-FIT SUIT BLAZER,BLACK'),
  ('Trans-5137',18,'Jan 7, 2023','NPU77CKN6AY','LONDON',107.99,4,'SOFT BOWLING BAG,BROWN'),
  ('Trans-5138',3,'Jan 24, 2023','ZJN44NYI2UG','LONDON',290.99,5,'FAUX SUEDE BOMBER JACKET,WHITE'),
  ('Trans-5139',11,'Jan 25, 2023','WJS26LVH7NQ','SOUTHAMPTON   ',298.99,3,'STUDDED DENIM SKIRT,NAVY'),
  ('Trans-5140',8,'Jan 16, 2023','NSV27HQG4YD','MANCHESTER',320.99,1,'OVERSIZED HOODIE,GRAY'),
  ('Trans-5141',10,'Jan 14, 2023','YQJ22QFN2FP',' LONDON',148.99,2,'CROPPED HOODIE,AQUA'),
  ('Trans-5142',14,'Jan 18, 2023','ESP98KEX2HU','SOUTHAMPTON   ',301.99,4,'RIPPED JEANS,OLIVE'),
  ('Trans-5143',21,'Jan 28, 2023','EJK66QGF3YB',' LIVERPOOL',241.99,3,'JOGGER WAIST TROUSER,PINK'),
  ('Trans-5144',12,'Jan 18, 2023','GSS85DJW4HK','SOUTHAMPTON   ',398.99,3,'KNIT POLO SHIRT,BLUE'),
  ('Trans-5145',22,'Jan 23, 2023','EDK84GKT2EP','LIVERPOOL',168.99,2,'STRIPED KNIT SWEATER,RED'),
  ('Trans-5146',17,'Jan 10, 2023','INN03YPM1GJ',' LIVERPOOL',162.99,4,'JOGGER WAIST TROUSER,GREEN'),
  ('Trans-5147',20,'Dec 31, 2022','NCX71VFK6RD','NEWCASTLE',305.99,2,'HIGH-WAIST TROUSER,BLACK'),
  ('Trans-5148',4,'Jan 23, 2023','BJO47QKP7QX','BIRMINGHAM',116.99,2,'FAUX SUEDE BOMBER JACKET,BROWN'),
  ('Trans-5149',20,'Jan 3, 2023','KUF85YGX2UC',' LONDON',199.99,1,'COLOUR BLOCK LEATHER JACKET,WHITE'),
  ('Trans-5150',5,'Jan 21, 2023','MZH62NVJ0GV',' LIVERPOOL',236.99,4,'SHIRT WITH CONTRAST COLLAR,NAVY'),
  ('Trans-5151',11,'Jan 8, 2023','EZJ54BTP1OI','LIVERPOOL',368.99,3,'SLIM-FIT SUIT BLAZER,GRAY'),
  ('Trans-5152',2,'Jan 9, 2023','DEQ07YSM2JF','LIVERPOOL',354.99,2,'SOFT BOWLING BAG,AQUA'),
  ('Trans-5153',21,'Dec 31, 2022','UVN61JTD7CX','LONDON',290.99,5,'LONG DENIM BERMUDA SHORT,OLIVE'),
  ('Trans-5154',10,'Jan 5, 2023','QQY85GHC8BR','LIVERPOOL',230.99,1,'STUDDED DENIM SKIRT,PINK'),
  ('Trans-5155',4,'Jan 18, 2023','BRM15JLB2VI','LIVERPOOL',103.99,5,'JOGGER WAIST TROUSER,BLUE'),
  ('Trans-5156',19,'Jan 24, 2023','TNG64UCO9LN','NEWCASTLE',158.99,5,'CROPPED HOODIE,RED'),
  ('Trans-5157',17,'Jan 20, 2023','XCJ01NRP7IV',' LONDON',217.99,3,'RIPPED JEANS,GREEN'),
  ('Trans-5158',6,'Jan 19, 2023','CMN89LTI6GN','SOUTHAMPTON   ',208.99,3,'SLIM FIT JEANS,BLACK'),
  ('Trans-5159',9,'Jan 23, 2023','ISF40ETU7YJ','LIVERPOOL',397.99,3,'JOGGER WAIST TROUSER,BROWN'),
  ('Trans-5160',8,'Jan 30, 2023','POO52SIF7TO','LONDON',234.99,1,'STRIPED KNIT SWEATER,WHITE'),
  ('Trans-5161',14,'Jan 6, 2023','PXC65LHN6JO','LIVERPOOL',131.99,4,'JOGGER WAIST TROUSER,NAVY'),
  ('Trans-5162',12,'Jan 26, 2023','JYH00EIS4CD',' LONDON',128.99,4,'HIGH-WAIST TROUSER,GRAY'),
  ('Trans-5163',14,'Jan 23, 2023','XSV69GOY7HJ',' LONDON',248.99,3,'FAUX SUEDE BOMBER JACKET,AQUA'),
  ('Trans-5164',20,'Jan 20, 2023','CBZ93NIM4MQ','MANCHESTER',135.99,5,'COLOUR BLOCK LEATHER JACKET,OLIVE'),
  ('Trans-5165',11,'Jan 22, 2023','HRB15BST8HK',' LIVERPOOL',194.99,4,'SHIRT WITH CONTRAST COLLAR,PINK'),
  ('Trans-5166',14,'Jan 14, 2023','OBM87JSH4CW','LIVERPOOL',130.99,1,'SLIM-FIT SUIT BLAZER,BLUE'),
  ('Trans-5167',10,'Jan 15, 2023','KMT35GYI6VO','SOUTHAMPTON   ',178.99,2,'SOFT BOWLING BAG,RED'),
  ('Trans-5168',18,'Jan 8, 2023','PVT88HJZ6TS','MANCHESTER',227.99,3,'LONG DENIM BERMUDA SHORT,GREEN'),
  ('Trans-5169',4,'Jan 30, 2023','YZQ34DPS2GM','LIVERPOOL',287.99,3,'STUDDED DENIM SKIRT,BLACK'),
  ('Trans-5170',5,'Jan 22, 2023','XPI05NIW0GX','LONDON',171.99,3,'FAUX SUEDE BOMBER JACKET,BROWN'),
  ('Trans-5171',20,'Jan 19, 2023','YGU51JNV5EB','LIVERPOOL',264.99,4,'CROPPED HOODIE,WHITE'),
  ('Trans-5172',13,'Jan 14, 2023','HOB77GRS4VH','SOUTHAMPTON   ',151.99,3,'RIPPED JEANS,NAVY'),
  ('Trans-5173',7,'Jan 2, 2023','MRK86YCO6SW',' LIVERPOOL',279.99,2,'SLIM FIT JEANS,GRAY'),
  ('Trans-5174',2,'Jan 10, 2023','BAC37DTP6CR',' LONDON',363.99,3,'KNIT POLO SHIRT,AQUA'),
  ('Trans-5175',14,'Jan 18, 2023','YWC00ZMB6YT','BIRMINGHAM',380.99,5,'STRIPED KNIT SWEATER,OLIVE'),
  ('Trans-5176',1,'Jan 11, 2023','UBI98YUS4GS',' LIVERPOOL',112.99,4,'JOGGER WAIST TROUSER,PINK'),
  ('Trans-5177',20,'Jan 24, 2023','WTP76HVO1VS',' LONDON',322.99,4,'HIGH-WAIST TROUSER,BLUE'),
  ('Trans-5178',4,'Jan 3, 2023','QYP32XJT5MP','LONDON',141.99,4,'FAUX SUEDE BOMBER JACKET,RED'),
  ('Trans-5179',20,'Jan 27, 2023','KKI66IWS2MO','SOUTHAMPTON   ',111.99,3,'COLOUR BLOCK LEATHER JACKET,GREEN'),
  ('Trans-5180',22,'Jan 26, 2023','BVB73XSI1AS',' LONDON',275.99,2,'SHIRT WITH CONTRAST COLLAR,BLACK'),
  ('Trans-5181',10,'Jan 15, 2023','LDQ46YJE7VT',' LONDON',331.99,1,'SLIM-FIT SUIT BLAZER,BROWN'),
  ('Trans-5182',12,'Jan 22, 2023','OMI57ERD8EA',' LONDON',371.99,2,'FAUX SUEDE BOMBER JACKET,WHITE'),
  ('Trans-5183',20,'Jan 23, 2023','LVC87JGI8EB','BIRMINGHAM',324.99,2,'LONG DENIM BERMUDA SHORT,NAVY'),
  ('Trans-5184',3,'Jan 4, 2023','AIG71GIE5UA','LIVERPOOL',206.99,1,'STUDDED DENIM SKIRT,GRAY'),
  ('Trans-5185',4,'Jan 27, 2023','SKT21VOM9TF','LIVERPOOL',109.99,1,'OVERSIZED HOODIE,AQUA'),
  ('Trans-5186',19,'Jan 12, 2023','STH13VLX1ME','BIRMINGHAM',162.99,4,'CROPPED HOODIE,OLIVE'),
  ('Trans-5187',21,'Jan 2, 2023','FEN35UEP7YV','LONDON',268.99,4,'RIPPED JEANS,PINK'),
  ('Trans-5188',10,'Jan 23, 2023','RZJ65RFC5FB','NEWCASTLE',338.99,3,'SLIM FIT JEANS,BLUE'),
  ('Trans-5189',13,'Jan 8, 2023','OHQ05XAG5YD','LONDON',390.99,4,'KNIT POLO SHIRT,RED'),
  ('Trans-5190',10,'Jan 15, 2023','LHF74PPI1DJ','MANCHESTER',153.99,1,'STRIPED KNIT SWEATER,GREEN'),
  ('Trans-5191',5,'Jan 23, 2023','WVI35NFH2YY',' LONDON',176.99,1,'JOGGER WAIST TROUSER,BLACK'),
  ('Trans-5192',14,'Jan 9, 2023','GQG72ARX0CL','MANCHESTER',295.99,2,'HIGH-WAIST TROUSER,BROWN'),
  ('Trans-5193',9,'Jan 14, 2023','ESO82NPQ9GM','NEWCASTLE',126.99,4,'FAUX SUEDE BOMBER JACKET,WHITE'),
  ('Trans-5194',9,'Jan 18, 2023','RHZ84DGL1NY',' LONDON',354.99,2,'COLOUR BLOCK LEATHER JACKET,NAVY'),
  ('Trans-5195',10,'Jan 28, 2023','XKQ71YPX8SJ',' LONDON',380.99,2,'SHIRT WITH CONTRAST COLLAR,GRAY'),
  ('Trans-5196',12,'Jan 25, 2023','GBI16OWP4JO','LIVERPOOL',271.99,4,'SLIM-FIT SUIT BLAZER,AQUA'),
  ('Trans-5197',8,'Jan 25, 2023','KQZ67SOJ9SQ','LONDON',192.99,4,'SOFT BOWLING BAG,OLIVE'),
  ('Trans-5198',15,'Jan 18, 2023','WUW11HGO2AK','BIRMINGHAM',327.99,4,'LONG DENIM BERMUDA SHORT,PINK'),
  ('Trans-5199',11,'Jan 24, 2023','HNU71PMU9KN',' LIVERPOOL',300.99,2,'STUDDED DENIM SKIRT,BLUE'),
  ('Trans-5200',19,'Dec 31, 2022','TGD17SAB2AL','BIRMINGHAM',359.99,1,'STUDDED DENIM SKIRT,WHITE'),
  ('Trans-5201',15,'Dec 31, 2022','AGH74PPI1DJ','MANCHESTER',153.99,2,'KNIT POLO SHIRT,GREEN');


-- Step 4: Write a Select * statement to print the dataset, then Investigate data quality issues.


-- Step 5: Write a new Select statement to extract the following columns : 

PRODUCT_DESCRIPTION: Extract product description without color from PRODUCT using SPLIT_PART
ORDER_CITY: use TRIM to remove Leading Spaces from ORDERCITY
ORDER_DATE: convert ORDERDATE into a Date Column using TO_DATE
ORDERID and QUANTITY : keep these columns as is. 
 

-- Step 6: Modify the previous query then add :
 
Filter dates  Between '2023-01-01' and '2023-01-31'
GROUP BY PRODUCT_DESCRIPTION, ORDER_CITY
COUNT_ORDERS = COUNT(ORDERID)
TOTAL_QUANTITY_SOLD=  SUM(QUANTITY) 
ORDER BY  TOTAL_QUANTITY_SOLD DESC
LIMIT result to 5



-- Step 7: Extract the result as CSV.

-- Use the extration button from UI

Practice 1 standardize phone columns
-- ********************************** PRACTICE TASK 1 : Standarize Phone Column ********************************** 


-- Step 1.1 Setup the right context for your worksheet ---

-- IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
--			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
--			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.



-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 1.2 Use LTRIM TO REMOVE + and 0 ---

/*
    DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/ltrim.html 
    SYNTAX : LTRIM( <expr> [, <characters> ] );
*/


-- Step 2.1 Setup the right context for your worksheet ---

-- IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
--			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
--			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 2.2 Use DATEDIFF() to count Age of each Customer in "YEARS"  ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/datediff.html#
	SYNTAX : DATEDIFF( <date_or_time_part>, <date_or_time_expr1>, <date_or_time_expr2> );
    ** Notes : CURRENT_DATE() Returns the current date of the system. For more information, visit this link : 
				https://docs.snowflake.com/en/sql-reference/functions/current_date.html
*/





-- "BONUS" Step 2.3 Combine all in one Select Statement  ---


SELECT 
    ID, 
	SPLIT_PART(TRIM(NAME,' 0'),', ', 1) as FIRST_NAME, 
    SPLIT_PART(TRIM(NAME,' 0'),', ', 2) as LAST_NAME, 
    EMAIL,
    TO_DATE(DOB,'MMMM DD, YYYY') DOB,
	TO_DATE(LastTransaction,'AUTO') AS LastTransaction,
	DATEDIFF(days, TO_DATE(LastTransaction,'AUTO'), current_date()) as DaysSinceLastTrans,
	DATEDIFF(days, TO_DATE(DOB,'MMMM DD, YYYY'), current_date()) as Age,
    LTRIM(PHONE,'0+') as Standarized_Phone,
    ADDRESS, 
    REGION , 
    COUNTRY,
    COMPANY
FROM
    CUSTOMERS;
*/
-- ********************************** TASK 1 : Project Overview & Project Data Loading ********************************** 

-- Step 1.1 Use the UI to Create DATABASE COURSERA 
/* 
	DOC : https://docs.snowflake.com/en/sql-reference/sql/create-database.html 
	SYNTAX : CREATE OR REPLACE DATABASE <name> 
*/

--- Step 1.2 Create Table CUSTOMERS under COURSERA.PUBLIC ---
/* 
	DOCUMENTATION : https://docs.snowflake.com/en/sql-reference/sql/create-table.html 
	SYNTAX: CREATE [ OR REPLACE ]  TABLE <table_name>
			( 
			<col1_name> <col1_type>,
			<col2_name> <col2_type>,
			...
			);
*/

 CREATE OR REPLACE TABLE CUSTOMERS (
  id int autoincrement start 1 increment 1 NOT NULL,
  Name varchar(255),
  Phone varchar(100),
  Email varchar(255),
  Address varchar(255),
  PostalZip varchar(50),
  Region varchar(50),
  Country varchar(100),
  Company varchar(255),
  LastTransaction varchar(255),
  DoB varchar(255)
);
 

-- Step 1.3 Load Data Manually
/* 
	DOCUMENTATION : https://docs.snowflake.com/en/sql-reference/sql/insert.html 
	SYNTAX: INSERT INTO <target_table> ( <target_col_name> , <target_col_name>, ...  ) 
            VALUES ( { <value1> | DEFAULT | NULL } [ , ... ] ) ++ [ , ( ... ) ] 
*/

INSERT INTO CUSTOMERS (name,phone,email,address,postalZip,region,country,Company,LastTransaction,DoB)
VALUES
  ('   Kline, Alisa T.','00448454643','tempor.bibendum@yahoo.ca','Ap #671-8278 Nec St.','8386-3377','Pernambuco','United Kingdom','','2022-09-21 23:00:00','February 10, 1996'),
  (' Whitney, Kaitlin T.','+481513245743','sapien@yahoo.org','Ap #972-5338 Dignissim. Rd.','65-168','Santa Catarina','Poland',NULL,'2022-03-15 22:11:00','January 23, 1969'),
  ('Curtis, Anthony T.   ','+448001111','ut.ipsum@yahoo.net','490-7128 Nunc. Av.','281132','Guanacaste','United Kingdom','Nullam Scelerisque Company',Concat(TO_VARCHAR(current_date()),' 01:04:15'),'June 22, 1975'),
  ('000Bennett, Nasim Z.','+47169772165','elementum.sem@hotmail.org','Ap #138-7239 Integer St.','4114 DC','Mexico City','Norway','Cursus Diam At Ltd','2021-12-21 09:00:00','October 21, 1951'),
  ('Brock, Alec N.','00551366269750','enim.nunc.ut@yahoo.couk','597-548 Egestas. Rd.','2892','Vorarlberg','Brazil','Nec Ante Blandit Company','2022-10-01 12:21:00','December 30, 1999'),
  ('Golden, Lane H.','00638811661136','lacus.varius@outlook.net','518-7417 Arcu Av.','82454','San José','Philippines','Risus Associates','2022-10-01 09:44:00','September 12, 1970'),
  ('Mayer, Dominique V.','0063171546824','ipsum.phasellus@aol.edu','P.O. Box 443, 6497 Elementum, Rd.','374482','Kaluga Oblast','China','Iaculis Quis Corporation','2022-09-01 18:10:00','November 27, 1997'),
  ('Whitfield, Len F.','00521375483625','quisque.fringilla@protonmail.org','Ap #246-753 Arcu. Avenue','Y2L 5R6','Akwa Ibom','Mexico','Nec Ante Institute','2022-10-12 13:11:00','July 19, 1975'),
  ('Hyde, Angelica E.','+445508611528','odio.aliquam@hotmail.edu','Ap #671-6622 Feugiat Road','1898-8474','Hatay','United Kingdom','Magna Limited','2022-06-19 13:11:00','January 31, 1951'),
  ('Alford, Reece S.','+903069949880','vel@outlook.edu','P.O. Box 427, 691 Vel Av.','43021','Sumy oblast','Turkey','Amet Corporation','2022-07-18 13:11:00','October 20, 1967'),
  ('Huber, Nora Y.','00481515895743','noray32@yahoo.org','Ap 10 Dignissim. Rd.','65-168','Santa Catarina','Poland','LETNI','2022-05-29 23:50:00','December 23, 1999'),
  ('Tate, Rosalyn G.','+18454642','dui.semper@aol.co.uk','P.O. Box 717, 486 Sed St.','17580','Gangwon','United States','Mauris Vel Associates',Concat(TO_VARCHAR(current_date()),' 00:44:00'),'September 25, 1959'),
  ('T, Rosalyn G.','+18454642','dui.semper@aol.co.uk','P.O. Box 717, 486 Sed St.','17580','Gangwon','United States','Mauris Vel Associates','2022-11-11 13:11:00','September 25, 1959'),
  ('Kirby, Shea Y.','00317021434131','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting',Concat(TO_VARCHAR(current_date()),' 00:55:45'),'December 10, 1955'),
  ('Kirbi, Shea Y.','','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting','2022-12-01 13:11:00','December 10, 1955'),
  ('K, Shea Y.','00317021434131','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting','2020-04-18 13:11:00','December 10, 1955'),
  (Null,'',Null,'722-6870 Amet Road','091952','Aragón','Netherlands','Semper Rutrum Fusce Consulting',Concat(TO_VARCHAR(current_date()),' 00:23:45'),'December 10, 1955'),
  ('Booker, Bradley R. ','00448001111','','490-7128 Nunc. Av.','281132','Guanacaste','United Kingdom','Nullam Scelerisque Company','2022-11-01 13:11:00','June 22, 1975'),
  (Null,Null,Null,'Ap #972-5338 Dignissim. Rd.','65-168','Santa Catarina','Poland','Aptent Taciti PC','2022-12-15 13:11:00','January 23, 1969'),
  ('Sandoval, Quinlan Z.','0015567878637','ut@protonmail.edu','166-7842 Eget Road','537423','Huádōng','United States','Suspendisse Foundation','2022-10-12 01:58:45','May 14, 2000'),
  ('Small, Gil U.','00317042618694','id.risus@google.ca','906-9695 Velit. Street','36362','Emilia-Romagna','Netherlands','Aliquam Gravida Associates','2022-09-22 19:29:58','March 17, 1994'),
 ('Kirby, Cameron D.','001800473297','nunc@hotmail.com','5034 Lacus. Rd.','95804','Khyber Pakhtoonkhwa','United States','Suspendisse Foundation','2022-10-22 17:02:07','December 1, 1989')
  ;

-- Step 1.3 Check loaded Data
Select * from CUSTOMERS; -- ********************************** TASK 2 : Investigate Data Quality Issues ********************************** 


-- Step 2.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.



-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 
*/ 
USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data.
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;




-- Step 2.2 Write a Select * statement to visualise the data. ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/sql/select.html 
	SYNTAX : SELECT {<object_name>|<alias>}.<col_name> / * FROM {<DATABASE>.<SCHEMA>.}<TABLE> ;
	
	***OPTIONAL*** Add ORDER BY RANDOM() if dealing with Massive dataset  ---	
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/random.html 
	SYNTAX : RAND() 
	** NOTES ** : The function RANDOM() generates a random value for each row in the table.
			The ORDER BY clause sorts all rows in the table by the random number generated by the RAND() function.
			The LIMIT clause picks the first row in the result set sorted randomly.
*/


-- <Your SQL Script Here>  

	
--- Step 2.3 Use the Contextual Statistcis Panel  ---
/* 
	DOCUMENTATION : https://docs.snowflake.com/en/user-guide/ui-snowsight-query.html#automatic-contextual-statistics 
	** NOTES ** Up to 10,000 rows can be displayed in the results. If your query returns more than 10,000 rows, the statistics still reflect the entire result set.
*/

-- 1- Check Data Types 

-- 2- Use the Result Panel from UI
-- ********************************** TASK 3 : Remove Unwanted Characters ********************************** 


-- Step 3.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 3.2 Use CONCAT() to Visualize Spaces in the "NAME" COLUMN ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/concat.html 
	SYNTAX : CONCAT( <expr1> [ , <exprN> ... ] ) ;
    ** Note : the function CONCAT() is used to facilitiate extra Spaces detection 	
*/

-- <Your SQL Script Here> 



-- Step 3.3 Use TRIM() to Remove leading and trailing characters from column "NAME" ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/trim.html  
	SYNTAX : TRIM( <expr> [, <characters> ] )
	
*/



-- Step 4.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 4.2 Use SPLIT_PART() to split a Text column into 2 parts using ',' as a delimiter ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/split_part.html 
	SYNTAX : SPLIT_PART(<string>, <delimiter>, <partNumber>);
    ** Notes : <partNumber> : If the value is negative, the parts are counted backward from the end of the string.
*/

 

-- Step 5.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 5.2 Use TO_DATE() convert Text column into Date by defining the input format  ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/to_date.html
	SYNTAX : TO_DATE( <string_expr> [, <format> ] );
    ** Notes : <format> Date format specifier for string_expr or AUTO, which specifies that Snowflake should automatically detect the format to use. For more information, see : 
					https://docs.snowflake.com/en/sql-reference/functions-conversion.html#label-date-time-format-conversion
*/

-- <Your SQL Script Here> 

-- ********************************** TASK 6 : Add new computed column “Days Since Last Transaction” ********************************** 


-- Step 6.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 6.2 Use DATEDIFF() to count the Number of days between LASTTRANSACTION Column and CURRENT_DATE() in "DAYS"  ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/datediff.html#
	SYNTAX : DATEDIFF( <date_or_time_part>, <date_or_time_expr1>, <date_or_time_expr2> );
    ** Notes : CURRENT_DATE() Returns the current date of the system. For more information, visit this link : 
				https://docs.snowflake.com/en/sql-reference/functions/current_date.html
*/

-- <Your SQL Script Here> 


-- Step 6.3 Using the DaysSinceLastTransaction column Query the DataSet to find the list of Inactive Customers (DaysSinceLastTransaction>90)  ---
/* 
	Note : Use Select Statement with a where Clause
*/



SELECT 
    ID, 
	SPLIT_PART(TRIM(NAME,' 0'),', ', 1) as FIRST_NAME, 
    SPLIT_PART(TRIM(NAME,' 0'),', ', 2) as LAST_NAME, 
    EMAIL,
    TO_DATE(DOB,'MMMM DD, YYYY') DOB,
	TO_DATE(LastTransaction,'AUTO') AS LastTransaction,
	DATEDIFF(days, TO_DATE(LastTransaction,'AUTO'), current_date()) as DaysSinceLastTrans,
    LTRIM(PHONE,'0+') as Standarized_Phone,
    ADDRESS, 
    REGION , 
    COUNTRY,
    COMPANY
FROM
    CUSTOMERS
 WHERE DaysSinceLastTrans > 90;


-- ********************************** TASK 7 : Handling Missing Values ********************************** 


-- Step 7.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 7.2 Handle Missing Data with Deletion  ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/is-null.html
	SYNTAX : <expr> IS [ NOT ] NULL;
    ** Notes : Use Logical operators AND, NOT OR
*/

-- <Your SQL Script Here> 


-- Step 7.3 Handle Missing Data with Imputation  ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/iff.html
	SYNTAX : IFF( <condition> , <expr1> , <expr2> )
*/

-- <Your SQL Script Here>
-- ********************************** TASK 8 : Eliminate Duplications ********************************** 


-- Step 8.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 8.2 Find Duplicated Customers based on email ---
/* 
	DOCUMENTATION  :https://docs.snowflake.com/en/sql-reference/functions/count.html 
	SYNTAX : SELECT ... COUNT(<expr1>) FROM ... GROUP BY ... HAVING <predicate>
		** NOTE : Add a having clause to filter rows produced by GROUP BY
*/

-- <Your SQL Script Here> 


-- Step 8.3 Eliminate Duplicated Customers and keep the record with the latest Transaction Date ---
/* 
	DOCUMENTATION  :https://docs.snowflake.com/en/sql-reference/functions/rank.html 
	SYNTAX : RANK() OVER ( [ PARTITION BY <expr1> ] ORDER BY <expr2> [ { ASC | DESC } ] [ <window_frame> ] )
	** NOTE : Additional use QUALIFY instead of WHERE https://docs.snowflake.com/en/sql-reference/constructs/qualify.html 
*/

-- <Your SQL Script Here>
-- ********************************** TASK 9 : Export the list of Inactive Customers ********************************** 


-- Step 9.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
USE DATABASE COURSERA;
USE SCHEMA PUBLIC;



-- Step 9.2 Create a View to scale and save your work ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/sql/create-view.html
	SYNTAX : CREATE OR REPLACE VIEW myview AS SELECT col1, col2 FROM MYTABLE;
	
*/

-- Bring together all bits and pieces from previous tasks    

-- Tasks 1 to 7 : Extracting First & Last Names, Extracting Dates, Calculating new Columns, Eliminating Nulls & Blanks
SELECT 
    ID, 
	SPLIT_PART(TRIM(NAME,' 0'),',',1) AS FIRST_NAME, 
    SPLIT_PART(TRIM(NAME,' 0'),', ',2) AS LAST_NAME, 
    EMAIL,
    TO_DATE(DoB, 'MMMM DD, YYYY' ) as DoB,
    DATEDIFF(year, TO_DATE(DoB, 'MMMM DD, YYYY' ), current_date()) as AGE,
	TO_DATE(LastTransaction,'AUTO') AS LastTransaction,
    DATEDIFF(days, LastTransaction, current_date()) as DaysSinceLastTrans,
    iff(((COMPANY IS NULL) OR (COMPANY = '') ),'N/A', COMPANY) AS COMPANY,
	LTRIM(PHONE, '+0' ) AS PHONE,
	ADDRESS, postalZip, Region , COUNTRY
FROM
    CUSTOMERS
WHERE 
    NOT(email is null OR email='');

-- Task 8 What about duplicates ? 
  
        SELECT 
		ID, Name, Email, LastTransaction,
		rank() over (partition by email order by TO_DATE(LastTransaction,'AUTO') desc) RANK 
        from CUSTOMERS QUALIFY RANK =1;

/* Create a View to Store the query 
	** NOTE**  : add a WITH to interconnect both queries. WITH clause defines a temporary data set whose output is available to be referenced in subsequent queries. 
		DOCUMENTATION : https://docs.snowflake.com/en/sql-reference/constructs/with.html
*/ 

-- Your Query Here



-- Step 9.3 Query CUSTOMERS_VW (newly created View) to find the list of inactive Customers then export results in CSV ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/sql/create-view.html#examples
	SYNTAX : SELECT .... FROM MY_VIEW WHERE ...
*/


-- Step 9.4 Query CUSTOMERS_VW (newly created View) to find the list of inactive Customers then export results in CSV ---
/* 
	Use the UI to export the list of customers in a CSV files
	
*/
