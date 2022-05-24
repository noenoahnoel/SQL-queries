USE mydb;

/*Some rudimentary data exploration*/

SELECT * 
FROM us_state; 

SELECT  
    name, 
    capitol  
FROM us_state  
WHERE name = "California";

SELECT *  
FROM club_member; 

SELECT 
    member_id 
FROM invoice
WHERE amount > 100;

SELECT * 
FROM tier;


/*Using SELECT statements with pattern matching and sorting*/

SELECT * 
FROM us_state 
ORDER BY area_size DESC; 

SELECT * 
FROM us_state 
WHERE name LIKE "M%"; 

SELECT * 
FROM us_state 
WHERE name LIKE "M%"  
ORDER BY name; 

SELECT * 
FROM us_state 
WHERE abbreviation LIKE "N%" 
ORDER BY capital


/*Inserting data into table using INSERT statements*/

INSERT INTO club_member 
SET first_name = "John", 
last_name = "Doe", 
phone_number = "3101231234" , 
middle_name = "Deer", 
city = "Tulsa", 
state_abbreviation = "OK",
email = "johndeere@hotmail.com", 
tier_code = "P", 
professional_title = "CEO"; 


/* Using DELETE statements to delete rows*/

DELETE 
FROM club_member
WHERE first_name = "John" AND member_id = 32; 

DELETE 
FROM club_member
WHERE first_name = "John" 
OR phone_number LIKE "%3101231234%"; 


/*Joining tables*/

SELECT 
	club_member.member_id, 
	first_name, 
	last_name, 
    description, 
    amount, due_date
FROM club_member, invoice 
WHERE club_member.member_id = invoice.member_id  
ORDER BY member_id 

SELECT 
	first_name, 
    middle_name, 
    last_name, 
    professional_title, 
    tier.description
FROM club_member, tier 
WHERE club_member.tier_code = tier.code 
ORDER BY last_name
