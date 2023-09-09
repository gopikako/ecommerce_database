DROP table if exists orders cascade;
DROP table if exists delivery cascade;
DROP table if exists coupons cascade;
DROP table if exists sku cascade;
DROP table if exists sales cascade;
DROP table if exists suborders cascade;

---------------------------------------------------------------

CREATE TABLE ORDERS (
  Order_ID VARCHAR(50),
  Order_Date DATE NOT NULL,
  Order_Source VARCHAR(50) NOT NULL,
  Shipment_Type VARCHAR(50) NOT NULL,
  Order_Value NUMERIC(15,2) DEFAULT 0,
  PRIMARY KEY (Order_ID)
);

CREATE TABLE SKU (
	SKU VARCHAR(50),
	Product_Category VARCHAR(50) NOT NULL,
	Product_Sub_Category VARCHAR(50) NOT NULL,
	Product_Color VARCHAR(50),
	Product_Manufacturer VARCHAR(50) NOT NULL,
	Product_Buying_Price NUMERIC(15,2) DEFAULT 0,
	Product_Selling_Price NUMERIC(15,2) DEFAULT 0,
	PRIMARY KEY (SKU)
);

CREATE TABLE COUPONS (
	Coupon_Code VARCHAR(50),
	Percentage_Discount NUMERIC(15,2) DEFAULT 0,
	Min_Order_Value NUMERIC(15,2) DEFAULT 0,
	Max_Discount NUMERIC(15,2) DEFAULT 0,
	Coupon_Start_Date DATE NOT NULL,
	Coupon_End_Date DATE NOT NULL,
	PRIMARY KEY (Coupon_Code)
);

CREATE TABLE SALES (
	SubOrder_ID VARCHAR(50),
	SKU VARCHAR(50),
	Product_Buying_Price NUMERIC(15,2) DEFAULT 0,
	Product_Selling_Price NUMERIC(15,2) DEFAULT 0,
	Coupon_Code VARCHAR(50),
	Discount_Percentage NUMERIC(15,2) DEFAULT 0,
	Delivery_Charge NUMERIC(15,2) DEFAULT 0,
	Tax NUMERIC(15,2) DEFAULT 0,
	SubOrder_Value NUMERIC(15,2) DEFAULT 0,
	PRIMARY KEY (SubOrder_ID,SKU),
	FOREIGN KEY (Coupon_Code) REFERENCES COUPONS ON DELETE SET NULL ON UPDATE CASCADE
	
);

CREATE TABLE DELIVERY (
	Delivery_ID VARCHAR(50),
	Warehouse_ID VARCHAR(50) NOT NULL,
	STATUS VARCHAR(50) NOT NULL,
	PRIMARY KEY (Delivery_ID)
);

CREATE TABLE SUBORDERS (
	SubOrder_ID VARCHAR(50),
	SKU VARCHAR(50),
	Order_ID VARCHAR(50),
	QTY NUMERIC(15,0) DEFAULT 0,
	Status VARCHAR(50) NOT NULL,
	SubOrder_Value NUMERIC(15,2) DEFAULT 0,
	Order_Fulfilment VARCHAR(50) NOT NULL,
	Delivery_ID VARCHAR(50),
	PRIMARY KEY (SubOrder_ID,SKU),
	FOREIGN KEY (Order_ID) REFERENCES ORDERS ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (SKU) REFERENCES SKU ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Delivery_ID) REFERENCES DELIVERY ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (SubOrder_ID,SKU) REFERENCES SALES ON DELETE CASCADE ON UPDATE CASCADE
	
);
