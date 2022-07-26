-- EXERCICIO 1
SELECT u.id,u.name, c.name as "city" FROM users u 
JOIN cities c ON u."cityId" = c.id 
WHERE c.name = 'Rio de Janeiro' ORDER by u.id ;

-- EXERCICIO 2
SELECT t.id,w.name as "writer",r.name as "recipient", t.message FROM testimonials t
JOIN users w ON t."writerId" = w.id 
JOIN users r ON t."recipientId" = r.id ORDER by t.id;

-- EXERCICIO 3
SELECT u.id, u.name, s.name, c.name, e."endDate"  FROM educations e 
JOIN users u ON e."userId" = u.id  
JOIN schools s ON e."schoolId" = s.id
JOIN courses c ON e."courseId" = c.id 
WHERE e.status  = 'finished' ORDER by u.id;

-- EXERCICIO 4
SELECT u.id, u.name, r.name, c.name, e."startDate" FROM  experiences e 
JOIN users u ON e."userId" = u.id  
JOIN roles r  ON e."roleId"  = r.id
JOIN companies c  ON e."companyId"  = c.id 
WHERE e."endDate" IS NULL AND u.id = 50;
