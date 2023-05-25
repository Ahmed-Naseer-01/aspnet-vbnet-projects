DROP TABLE Uses_t 		CASCADE CONSTRAINTS ;
DROP TABLE Works_In_t 		CASCADE CONSTRAINTS ;
DROP TABLE WORK_CENTER_t 	CASCADE CONSTRAINTS ;
DROP TABLE Does_Business_In_t 	CASCADE CONSTRAINTS ;
DROP TABLE Employee_Skills_t 	CASCADE CONSTRAINTS ;
DROP TABLE SUPPLIES_t 		CASCADE CONSTRAINTS ;
DROP TABLE Produced_In_t 	CASCADE CONSTRAINTS ;
DROP TABLE Order_line_t 	CASCADE CONSTRAINTS ;
DROP TABLE PRODUCT_t 		CASCADE CONSTRAINTS ;
DROP TABLE PRODUCT_LINE_t 	CASCADE CONSTRAINTS ;
DROP TABLE ORDER_t 		CASCADE CONSTRAINTS ;
DROP TABLE SALESPERSON_t 	CASCADE CONSTRAINTS ;
DROP TABLE VENDOR_t 		CASCADE CONSTRAINTS ;
DROP TABLE SKILL_t 		CASCADE CONSTRAINTS ;
DROP TABLE RAW_MATERIAL_t 	CASCADE CONSTRAINTS ;
DROP TABLE TERRITORY_t 		CASCADE CONSTRAINTS ;
DROP TABLE EMPLOYEE_t 		CASCADE CONSTRAINTS ;
DROP TABLE CUSTOMER_t 		CASCADE CONSTRAINTS ;




CREATE TABLE CUSTOMER_t
             (Customer_Id         number          NOT NULL,
	      Customer_Name       VARCHAR(25)    ,
	      Customer_Address    VARCHAR(30)    ,
              Customer_City       VARCHAR(20)    ,              
              Customer_State      VARCHAR(2)     ,
              Postal_Code         VARCHAR(10)     ,
CONSTRAINT CUSTOMER_PK PRIMARY KEY (Customer_Id));



CREATE TABLE TERRITORY_t
             (Territory_Id        number         NOT NULL,
              Territory_Name      VARCHAR(50)    ,
CONSTRAINT TERRITORY_PK PRIMARY KEY (Territory_Id));



CREATE TABLE Does_Business_In_t
             (Customer_Id         number           NOT NULL,
              Territory_Id        number           NOT NULL,
CONSTRAINT Does_Business_In_PK PRIMARY KEY (Customer_Id, Territory_Id),
CONSTRAINT Does_Business_In_FK1 FOREIGN KEY (Customer_Id) REFERENCES CUSTOMER_t(Customer_Id),
CONSTRAINT Does_Business_In_FK2 FOREIGN KEY (Territory_Id) REFERENCES TERRITORY_t(Territory_Id));



CREATE TABLE EMPLOYEE_t
             (Employee_Id         VARCHAR(10)    NOT NULL,
              Employee_Name       VARCHAR(25)    ,
              Employee_Address    VARCHAR(30)    ,
              Employee_BirthDate  DATE           ,
              Employee_City       VARCHAR(20)    ,
              Employee_Date_Hired DATE           ,
              Employee_State      VARCHAR(2)     ,
              Employee_Supervisor VARCHAR(10)    ,
              Employee_Zip        VARCHAR(10)     ,
CONSTRAINT EMPLOYEE_PK PRIMARY KEY (Employee_Id));



CREATE TABLE SKILL_t
             (Skill_Id            VARCHAR(12)    NOT NULL,
	      Skill_Description   VARCHAR(30)    ,              
CONSTRAINT SKILL_PK PRIMARY KEY (Skill_Id));



CREATE TABLE Employee_Skills_t
             (Employee_Id         VARCHAR(10)    NOT NULL,
              Skill_Id            VARCHAR(12)    NOT NULL,
CONSTRAINT Employee_Skills_PK PRIMARY KEY (Employee_Id, Skill_Id),
CONSTRAINT Employee_Skills_FK1 FOREIGN KEY (Employee_Id) REFERENCES EMPLOYEE_t(Employee_Id),
CONSTRAINT Employee_Skills_FK2 FOREIGN KEY (Skill_Id) REFERENCES SKILL_t(Skill_Id));



CREATE TABLE ORDER_t
             (Order_Id            INTEGER        NOT NULL,
	      Customer_Id         number         ,
              Order_Date          DATE           ,
CONSTRAINT ORDER_PK PRIMARY KEY (Order_Id),
CONSTRAINT ORDER_FK1 FOREIGN KEY (Customer_Id) REFERENCES CUSTOMER_t(Customer_Id));



CREATE TABLE WORK_CENTER_t
             (Work_Center_Id       VARCHAR(12)    NOT NULL,
              Work_Center_Location VARCHAR(30)    ,
CONSTRAINT WORK_CENTER_PK PRIMARY KEY (Work_Center_Id));



CREATE TABLE PRODUCT_LINE_t
             (Product_Line_Id     number         NOT NULL,
              Product_Line_Name   VARCHAR(50)    ,
CONSTRAINT PRODUCT_LINE_PK PRIMARY KEY (Product_Line_Id));



CREATE TABLE PRODUCT_t
             (Product_Id          number         NOT NULL,
              Product_Line_Id     number         ,
              Product_Description VARCHAR(50)    ,
              Product_Finish      VARCHAR(20)    ,
              Standard_Price      Decimal(6,2)   ,
CONSTRAINT PRODUCT_PK PRIMARY KEY (Product_Id),
CONSTRAINT PRODUCT_FK1 FOREIGN KEY (Product_Line_Id) REFERENCES PRODUCT_LINE_t(Product_Line_Id));



CREATE TABLE Produced_In_t
	      (Product_Id	  number	 not null,
              Work_Center_Id      VARCHAR(12)    NOT NULL,
CONSTRAINT Produced_In_PK PRIMARY KEY (Product_Id, Work_Center_Id),
CONSTRAINT Produced_In_FK1 FOREIGN KEY (Product_Id) REFERENCES PRODUCT_t(Product_Id),
CONSTRAINT Produced_In_FK2 FOREIGN KEY (Work_Center_Id) REFERENCES WORK_CENTER_t(Work_Center_Id));




CREATE TABLE Order_line_t
	      (Order_Id            INTEGER        NOT NULL,
              Product_Id          number         NOT NULL,
              Ordered_Quantity    number         ,
CONSTRAINT Order_line_PK PRIMARY KEY (Order_Id, Product_Id),
CONSTRAINT Order_line_FK1 FOREIGN KEY (Order_Id) REFERENCES ORDER_t(Order_Id),
CONSTRAINT Order_line_FK2 FOREIGN KEY (Product_Id) REFERENCES PRODUCT_t(Product_Id));




CREATE TABLE RAW_MATERIAL_t
             (Material_Id         VARCHAR(12)    NOT NULL,
              Material_Name       VARCHAR(30)    ,
              Standard_Cost       Decimal(6,2)   ,
              Unit_Of_Measure     VARCHAR(10)    ,
CONSTRAINT RAW_MATERIAL_PK PRIMARY KEY (Material_Id));


CREATE TABLE SALESPERSON_t
             (SalesPerson_Id      number          NOT NULL,              
              SalesPerson_Name    VARCHAR(25)    ,
              SalesPerson_phone   VARCHAR(50)    ,
              SalesPerson_Fax     VARCHAR(50)    ,
              Territory_Id        number         ,
CONSTRAINT SALESPERSON_PK PRIMARY KEY (SalesPerson_Id),
CONSTRAINT SALESPERSON_FK1 FOREIGN KEY (Territory_Id) REFERENCES TERRITORY_t(Territory_Id));



CREATE TABLE VENDOR_t
             (Vendor_Id           number         NOT NULL,
              Vendor_Name         VARCHAR(25)    ,
              Vendor_Address      VARCHAR(30)    ,
              Vendor_City         VARCHAR(20)    ,
              Vendor_Contact      VARCHAR(50)    ,
              Vendor_Fax          VARCHAR(10)    ,              
              Vendor_Phone        VARCHAR(10)    ,
              Vendor_State        VARCHAR(2)     ,
              Vendor_Tax_Id       VARCHAR(50)    ,
              Vendor_Zipcode      VARCHAR(50)    ,
CONSTRAINT VENDOR_PK PRIMARY KEY (Vendor_Id));


CREATE TABLE SUPPLIES_t
             (Vendor_Id           number         NOT NULL,
              Material_Id         VARCHAR(12)    NOT NULL,
              Supply_Unit_Price   Decimal(6,2)   ,              
CONSTRAINT SUPPLIES_PK PRIMARY KEY (Vendor_Id, Material_Id),
CONSTRAINT SUPPLIES_FK1 FOREIGN KEY (Material_Id) REFERENCES RAW_MATERIAL_t(Material_Id),
CONSTRAINT SUPPLIES_FK2 FOREIGN KEY (Vendor_Id) REFERENCES VENDOR_t(Vendor_Id));



CREATE TABLE Uses_t
             (Goes_into_Quantity  INTEGER        ,
              Material_Id         VARCHAR(12)    NOT NULL,
              Product_Id          number         NOT NULL,
CONSTRAINT UsES_PK PRIMARY KEY (Product_Id, Material_Id),
CONSTRAINT UsES_FK1 FOREIGN KEY (Product_Id) REFERENCES PRODUCT_t(Product_Id),
CONSTRAINT UsES_FK2 FOREIGN KEY (Material_Id) REFERENCES RAW_MATERIAL_t(Material_Id));




CREATE TABLE Works_In_t
	     (Employee_Id         VARCHAR(10)    NOT NULL,
              Work_Center_Id      VARCHAR(12)    NOT NULL,
CONSTRAINT Works_IN_PK PRIMARY KEY (Employee_Id, Work_Center_Id),
CONSTRAINT Works_IN_FK1 FOREIGN KEY (Employee_Id) REFERENCES EMPLOYEE_t(Employee_Id),
CONSTRAINT Works_IN_FK2 FOREIGN KEY (Work_Center_Id) REFERENCES WORK_CENTER_t(Work_Center_Id));


delete from TABLE Uses_t;
delete from TABLE Works_In_t;
delete from TABLE WORK_CENTER_t;
delete from TABLE Does_Business_In_t;
delete from TABLE Employee_Skills_t;
delete from TABLE SUPPLIES_t;
delete from TABLE Produced_In_t;
delete from TABLE Order_line_t;
delete from TABLE PRODUCT_t;
delete from TABLE PRODUCT_LINE_t;
delete from TABLE ORDER_t;
delete from TABLE SALESPERSON_t;
delete from TABLE VENDOR_t;
delete from TABLE SKILL_t;
delete from TABLE RAW_MATERIAL_t;
delete from TABLE TERRITORY_t;
delete from TABLE EMPLOYEE_t;
delete from TABLE CUSTOMER_t;




INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (2, 'Value Furniture', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7743');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (3, 'Home Furnishings', '1900 Allard Ave.', 'Albany', 'NY', '12209-1125');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (7, 'Period Furniture', '394 Rainbow Dr.', 'Seattle', 'WA', '97954-5589');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (8, 'Calfornia Classics', '816 Peach Rd.', 'Santa Clara', 'CA', '96915-7754');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (9, 'M and H Casual Furniture', '3709 First Street', 'Clearwater', 'FL', '34620-2314');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (10, 'Seminole Interiors', '2400 Rocky Point Dr.', 'Seminole', 'FL', '34646-4423');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (11, 'American Euro Lifestyles', '2424 Missouri Ave N.', 'Prospect Park', 'NJ', '07508-5621');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (12, 'Battle Creek Furniture', '345 Capitol Ave. SW', 'Battle Creek', 'MI', '49015-3401');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (13, 'Heritage Furnishings', '66789 College Ave.', 'Carlisle', 'PA', '17013-8834');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (14, 'Kaneohe Homes', '112 Kiowai St.', 'Kaneohe', 'HI', '96744-2537');
INSERT INTO CUSTOMER_t  (Customer_Id, Customer_Name, Customer_Address, Customer_City, Customer_State, Postal_Code)
VALUES  (15, 'Mountain Scenes', '4132 Main Street', 'Ogden', 'UT', '84403-4432');



INSERT INTO TERRITORY_t  (Territory_Id, Territory_Name)
VALUES  (1, 'SouthEast');
INSERT INTO TERRITORY_t  (Territory_Id, Territory_Name)
VALUES  (2, 'SouthWest');
INSERT INTO TERRITORY_t  (Territory_Id, Territory_Name)
VALUES  (3, 'NorthEast');
INSERT INTO TERRITORY_t  (Territory_Id, Territory_Name)
VALUES  (4, 'NorthWest');
INSERT INTO TERRITORY_t  (Territory_Id, Territory_Name)
VALUES  (5, 'Central');





INSERT INTO Does_Business_In_t  (Customer_Id, Territory_Id)
VALUES  (1, 1);
INSERT INTO Does_Business_In_t  (Customer_Id, Territory_Id)
VALUES  (1, 2);
INSERT INTO Does_Business_In_t  (Customer_Id, Territory_Id)
VALUES  (2, 2);
INSERT INTO Does_Business_In_t  (Customer_Id, Territory_Id)
VALUES  (3, 3);
INSERT INTO Does_Business_In_t  (Customer_Id, Territory_Id)
VALUES  (4, 3);
INSERT INTO Does_Business_In_t  (Customer_Id, Territory_Id)
VALUES  (5, 2);
INSERT INTO Does_Business_In_t  (Customer_Id, Territory_Id)
VALUES  (6, 5);





INSERT INTO EMPLOYEE_t  (Employee_Id, Employee_Name, Employee_Address, Employee_City, Employee_State, Employee_Zip, Employee_Date_Hired, Employee_BirthDate, Employee_Supervisor)
VALUES  ('123-44-345', 'Jim Jason', '2134 Hilltop Rd', '', 'TN', '', '12/Jun/99', '', '454-56-768');
INSERT INTO EMPLOYEE_t  (Employee_Id, Employee_Name, Employee_Address, Employee_City, Employee_State, Employee_Zip, Employee_Date_Hired, Employee_BirthDate, Employee_Supervisor)
VALUES  ('454-56-768', 'Robert Lewis', '17834 Deerfield Ln', 'Nashville', 'TN', '', '01/Jan/99', '', '');




INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('BS12', '12in Band Saw');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('QC1', 'Quality Control');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('RT1', 'Router');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('S)1', 'Sander-Orbital');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('SB1', 'Sander-Belt');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('TS10', '10in Table Saw');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('TS12', '12in Table Saw');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('UC1', 'Upholstery Cutter');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('US1', 'Upholstery Sewer');
INSERT INTO SKILL_t  (Skill_Id, Skill_Description)
VALUES  ('UT1', 'Upholstery Tacker');




INSERT INTO Employee_Skills_t  (Employee_Id, Skill_Id)
VALUES  ('123-44-345', 'BS12');
INSERT INTO Employee_Skills_t  (Employee_Id, Skill_Id)
VALUES  ('123-44-345', 'RT1');
INSERT INTO Employee_Skills_t  (Employee_Id, Skill_Id)
VALUES  ('454-56-768', 'BS12');






INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1001, '21/Oct/08', 1);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1002, '21/Oct/08', 8);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1003, '22/Oct/08', 15);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1004, '22/Oct/08', 5);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1005, '24/Oct/08', 3);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1006, '24/Oct/08', 2);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1007, '27/Oct/08', 11);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1008, '30/Oct/08', 12);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1009, '05/Nov/08', 4);
INSERT INTO ORDER_t  (Order_Id, Order_Date, Customer_Id)
VALUES  (1010, '05/Nov/08', 1);




INSERT INTO PRODUCT_LINE_t  (Product_Line_Id, Product_Line_Name)
VALUES  (1, 'Cherry Tree');
INSERT INTO PRODUCT_LINE_t  (Product_Line_Id, Product_Line_Name)
VALUES  (2, 'Scandinavia');
INSERT INTO PRODUCT_LINE_t  (Product_Line_Id, Product_Line_Name)
VALUES  (3, 'Country Look');


INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (1, 'End Table', 'Cherry', 175, 1);
INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (2, 'Coffee Table', 'Natural Ash', 200, 2);
INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (3, 'Computer Desk', 'Natural Ash', 375, 2);
INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (4, 'Entertainment Center', 'Natural Maple', 650, 3);
INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (5, 'Writers Desk', 'Cherry', 325, 1);
INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (6, '8-Drawer Desk', 'White Ash', 750, 2);
INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (7, 'Dining Table', 'Natural Ash', 800, 2);
INSERT INTO PRODUCT_t  (Product_Id, Product_Description, Product_Finish, Standard_Price, Product_Line_Id)
VALUES  (8, 'Computer Desk', 'Walnut', 250, 3);




INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1001, 1, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1001, 2, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1001, 4, 1);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1002, 3, 5);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1003, 3, 3);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1004, 6, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1004, 8, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1005, 4, 3);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1006, 4, 1);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1006, 5, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1006, 7, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1007, 1, 3);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1007, 2, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1008, 3, 3);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1008, 8, 3);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1009, 4, 2);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1009, 7, 3);
INSERT INTO Order_line_t  (Order_Id, Product_Id, Ordered_Quantity)
VALUES  (1010, 8, 10);



INSERT INTO SALESPERSON_t  (SalesPerson_Id, SalesPerson_Name, SalesPerson_phone, SalesPerson_Fax, Territory_Id)
VALUES  (1, 'Doug Henny', '8134445555', '', 1);
INSERT INTO SALESPERSON_t  (SalesPerson_Id, SalesPerson_Name, SalesPerson_phone, SalesPerson_Fax, Territory_Id)
VALUES  (2, 'Robert Lewis', '8139264006', '', 2);
INSERT INTO SALESPERSON_t  (SalesPerson_Id, SalesPerson_Name, SalesPerson_phone, SalesPerson_Fax, Territory_Id)
VALUES  (3, 'William Strong', '5053821212', '', 3);
INSERT INTO SALESPERSON_t  (SalesPerson_Id, SalesPerson_Name, SalesPerson_phone, SalesPerson_Fax, Territory_Id)
VALUES  (4, 'Julie Dawson', '4355346677', '', 4);
INSERT INTO SALESPERSON_t  (SalesPerson_Id, SalesPerson_Name, SalesPerson_phone, SalesPerson_Fax, Territory_Id)
VALUES  (5, 'Jacob Winslow', '2238973498', '', 5);

INSERT INTO WORK_CENTER_t  (Work_Center_Id, Work_Center_Location)
VALUES  ('SM1', 'Main Saw Mill');

INSERT INTO WORK_CENTER_t  (Work_Center_Id, Work_Center_Location)
VALUES  ('WR1', 'Warehouse and Receiving');

INSERT INTO WORKS_IN_t (Employee_Id, Work_Center_Id)
VALUES ('123-44-345', 'SM1');



describe Uses_t;
describe Works_In_t;
describe WORK_CENTER_t;
describe Does_Business_In_t;
describe Employee_Skills_t;
describe SUPPLIES_t;
describe Produced_In_t;
describe Order_line_t;
describe PRODUCT_t;
describe PRODUCT_LINE_t;
describe ORDER_t;
describe SALESPERSON_t;
describe VENDOR_t;
describe SKILL_t;
describe RAW_MATERIAL_t;
describe TERRITORY_t;
describe EMPLOYEE_t;
describe CUSTOMER_t;

select * from Uses_t;
select * from Works_In_t;
select * from WORK_CENTER_t;
select * from Does_Business_In_t;
select * from Employee_Skills_t;
select * from SUPPLIES_t;
select * from Produced_In_t;
select * from Order_line_t;
select * from PRODUCT_t;
select * from PRODUCT_LINE_t;
select * from ORDER_t;
select * from SALESPERSON_t;
select * from VENDOR_t;
select * from SKILL_t;
select * from RAW_MATERIAL_t;
select * from TERRITORY_t;
select * from EMPLOYEE_t;
select * from CUSTOMER_t;

COMMIT;