---Might have to change the path in copy function

COPY coupons(Coupon_Code,Percentage_Discount,Min_Order_Value,Max_Discount,Coupon_Start_Date,Coupon_End_Date)
FROM 'C:\Users\gopik\Downloads\coupons.csv'
DELIMITER ','
CSV HEADER;

COPY delivery(Delivery_ID,Warehouse_ID,Status)
FROM 'C:\Users\gopik\Downloads\delivery.csv'
DELIMITER ','
CSV HEADER;

COPY sku(SKU,Product_Category,Product_Sub_Category,Product_Color,Product_Manufacturer,Product_Buying_Price,Product_Selling_Price)
FROM 'C:\Users\gopik\Downloads\SKUs.csv'
DELIMITER ','
CSV HEADER;

COPY orders(Order_ID, Order_Date, Order_Source, Shipment_Type, Order_Value)
FROM 'C:\Users\gopik\Downloads\orders.csv'
DELIMITER ','
CSV HEADER;

COPY sales(SubOrder_ID,SKU,Product_Buying_Price,Product_Selling_Price,Coupon_Code,Discount_Percentage,Delivery_Charge,Tax,SubOrder_Value)
FROM 'C:\Users\gopik\Downloads\sales.csv'
DELIMITER ','
CSV HEADER;

COPY suborders(SubOrder_ID,SKU,Order_ID,QTY,Status,SubOrder_Value,Order_Fulfilment,Delivery_ID)
FROM 'C:\Users\gopik\Downloads\suborders.csv'
DELIMITER ','
CSV HEADER;
