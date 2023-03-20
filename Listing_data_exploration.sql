SELECT * FROM Listing

---- updating some values of columns ------------
UPDATE Listing
SET Price_USD = ROUND(Price_USD,2)

SELECT DISTINCT(Listing_Status) FROM Listing

UPDATE Listing
SET Listing_Status = 'Edited'
WHERE Listing_Status  = 'edited'

UPDATE Listing
SET Listing_Status = 'On'
WHERE Listing_Status  = 'on'

----checking distint property category 
SELECT DISTINCT(Type_Category) FROM Listing

----checking distint property type
SELECT DISTINCT(Type) FROM Listing

---total number of property listed-----
SELECT DISTINCT(count(Listing_Id)) AS Total_Property_Listed FROM Listing

---total number of property listed by property category-----
SELECT Type_Category,COUNT(Listing_Id) AS Total_Property_Listed
FROM Listing
GROUP BY Type_Category

---total number of property listed by property type-----
SELECT Type,COUNT(Listing_Id) AS Total_Property_Listed
FROM Listing
GROUP BY Type


----Total number Property listed for Buy and rent
SELECT Purpose,COUNT(Listing_Id) AS Total_Property
FROM Listing
GROUP BY Purpose

-----Total number of property listed for buy and rent in Dhaka
SELECT City,Purpose,COUNT(Listing_Id) AS Total_Property FROM Listing
GROUP BY City,Purpose


-----Total number of property listed for buy  by sector
SELECT Sector,Purpose,COUNT(Listing_Id) AS Total_Property FROM Listing
WHERE Purpose ='Buy'
GROUP BY Sector,Purpose
ORDER BY Sector

-----Total number of property listed for rent  by sector
SELECT Sector,Purpose,COUNT(Listing_Id) AS Total_Property FROM Listing
WHERE Purpose ='Rent'
GROUP BY Sector,Purpose
ORDER BY Sector

---Average price of Property in Taka currency by type Category
SELECT Type_Category,ROUND(AVG(Price_Taka),2) AS Average_Price FROM Listing
GROUP BY Type_Category
ORDER BY Average_Price

---Average price of Property in USD currency by type Category
SELECT Type_Category,ROUND(AVG(Price_USD),2) AS Average_Price FROM Listing
GROUP BY Type_Category
ORDER BY Average_Price


---Average price of Property for rent 
SELECT Type,Purpose,ROUND(AVG(Price_USD),2) AS Average_Price FROM Listing
WHERE Purpose = 'Rent'
GROUP BY Type,Purpose
ORDER BY Average_Price

---Average price of Property for Buying
SELECT Type,Purpose,ROUND(AVG(Price_USD),2) AS Average_Price FROM Listing
WHERE Purpose = 'Buy'
GROUP BY Type,Purpose
ORDER BY Average_Price


--Total property viewed by Type_Category
SELECT Type_Category,SUM(Property_Viewed) AS Total_Views FROM Listing
GROUP BY Type_Category
HAVING SUM(Property_Viewed) > 0

--Total property viewed by Type
SELECT Type,SUM(Property_Viewed) AS Total_Views FROM Listing
GROUP BY Type
HAVING SUM(Property_Viewed) > 0

--Total property viewed by Type for rent purpose
SELECT Type,Purpose,SUM(Property_Viewed) AS Total_Views FROM Listing
WHERE Purpose ='Rent'
GROUP BY Type,Purpose
HAVING SUM(Property_Viewed) > 0

--Total property viewed by Type for buying purpose
SELECT Type,Purpose,SUM(Property_Viewed) AS Total_Views FROM Listing
WHERE Purpose ='Buy'
GROUP BY Type,Purpose
HAVING SUM(Property_Viewed) > 0

----Checking status of property listing
select distinct(Listing_Status) from Listing

SELECT * FROM  Listing
WHERE Listing_Status IN('Pending','Edited','On')

---Total Property that are pending and available currently 
SELECT Listing_Status,Count(Listing_Id) AS Total_Property_Status FROM  Listing
WHERE Listing_Status IN('Pending','Edited','On')
GROUP BY Listing_Status

---Total Property that are not available  
SELECT Listing_Status,Count(Listing_Id) AS Total_Property_Status FROM  Listing
WHERE Listing_Status NOT IN('Pending','Edited','On')
GROUP BY Listing_Status


---Total Property that are pending and available currently for buy and rent 
SELECT Listing_Status,Purpose,Count(Listing_Id) AS Total_Property_Status FROM  Listing
WHERE Listing_Status IN('Pending','Edited','On')
GROUP BY Listing_Status,Purpose

---Total Property that are pending and available currently for buy by Property Type
SELECT Type,Count(Listing_Id) AS Total_Property_Status FROM  Listing
WHERE Listing_Status IN('Pending','Edited','On') AND Purpose ='Buy'
GROUP BY Type

---Total Property that are pending and available currently for Rent by Property Type
SELECT Type,Count(Listing_Id) AS Total_Property_Status FROM  Listing
WHERE Listing_Status IN('Pending','Edited','On') AND Purpose ='Rent'
GROUP BY Type


---Total Property that are available currently for buy by Property Type
SELECT Type,Count(Listing_Id) AS Total_Property_Status FROM  Listing
WHERE Listing_Status= 'On' AND Purpose ='Buy'
GROUP BY Type

---Total Property that are pending and available currently for Rent by Property Type
SELECT Type,Count(Listing_Id) AS Total_Property_Status FROM  Listing
WHERE Listing_Status ='on' AND Purpose ='Rent'
GROUP BY Type

--total views on property whose current listing status  ON
SELECT Type,Count(Listing_Id) AS Total_Property_Status,SUM(Property_Viewed) As Total_viewed FROM  Listing
WHERE Listing_Status ='on' 
GROUP BY Type
