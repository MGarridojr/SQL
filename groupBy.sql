-- exercicio 1
SELECT COUNT("endDate") as "currentExperiences" FROM experiences

-- exercicio 2
SELECT u.id, COUNT(e."courseId") AS educations FROM users u 
JOIN educations e ON u.id=e."userId"
GROUP BY u.id ORDER BY u.id

-- exercicio 3
SELECT u.name AS writer, COUNT(t.id) AS "testimonailCount" FROM users u
JOIN testimonials t ON u.id="writerId"
WHERE u.id=435
GROUP BY u.name

-- exercicio 4 
SELECT MAX(j.salary) AS "maximumSalary", r.name FROM roles r
JOIN jobs j ON j."roleId"=r.id
WHERE j.active = true
GROUP BY r.name 
ORDER BY MAX(j.salary)

-- exercicio bonus
SELECT s.name AS school, c.name AS course, COUNT(e."userId") AS "studentsCount", e.status AS "role" FROM educations e 
JOIN schools s ON e."schoolId" = s.id 
JOIN courses c ON e."courseId" = c.id 
WHERE e.status='ongoing' OR e.status='finished'
GROUP BY s."name", c."name", e.status 
ORDER BY COUNT(e."userId") desc LIMIT 3;


