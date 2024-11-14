USE construction_test;

ALTER TABLE building
ADD FOREIGN KEY (host_id) REFERENCES `host`(id);

ALTER TABLE building
ADD FOREIGN KEY (contractor_id) REFERENCES `contractor`(id);


ALTER TABLE `work`
ADD FOREIGN KEY (building_id) REFERENCES `building`(id);

ALTER TABLE `work`
ADD FOREIGN KEY (worker_id) REFERENCES `worker`(id);

ALTER TABLE `design`
ADD FOREIGN KEY (building_id) REFERENCES `building`(id);

ALTER TABLE `design`
ADD FOREIGN KEY (architect_id) REFERENCES `architect`(id);

-- Exercise 3--
SELECT `name`, `cost`
FROM building
WHERE cost = (SELECT MAX(cost) FROM building);

SELECT city, `cost`
FROM building
WHERE cost = (SELECT MAX(cost) FROM building) AND city = 'can tho';


SELECT * FROM building
WHERE cost  >  (SELECT MIN(cost) FROM building WHERE  city = 'can tho');

SELECT * FROM building
WHERE id NOT IN (SELECT architect_id FROM DESIGN);

SELECT a.* FROM architect a
JOIN (SELECT birthday, COUNT(*) FROM architect GROUP BY birthday HAVING count(*) > 1) b
ON a.birthday = b.birthday ORDER BY a.birthday;

SELECT * FROM design;

-- Exercise 4--
SELECT AVG(benefit)
FROM design
WHERE architect_id;

SELECT building_id, SUM(benefit) FROM design d GROUP BY building_id;
SELECT building_id, SUM(benefit) FROM design d GROUP BY building_id HAVING SUM(benefit) > 50;


SELECT * FROM design a  JOIN (SELECT * FROM architect)b
ON a.architect_id = b.id
JOIN(SELECT * FROM building)c ON a.building_id = c.id 
WHERE b.place IS NOT NULL;



-- Exercise 5--

SELECT a.`name` AS name_building, h.`name` AS name_host, c.`name` AS name_contractor FROM building a 
JOIN (SELECT id, `name` FROM `host`) h ON a.host_id = h.id
JOIN (SELECT id,  `name` FROM  contractor) c ON a.contractor_id = c.id;

SELECT b.`name` AS name_building, a.`name` AS name_architect, s.`benefit` AS benefit FROM design d 
JOIN (SELECT id, `name` FROM `building`) b ON d.building_id = b.id
JOIN (SELECT id,  `name` FROM  architect) a ON d.architect_id = a.id
JOIN (SELECT benefit FROM design) s;




SELECT b.`name` AS name_building, b.`address` AS address_building, c.`name` AS contractor_name FROM building b 

JOIN (SELECT id, `name` FROM `contractor`) c ON b.contractor_id = c.id
WHERE c.`name` = 'cty xd so 6';

SELECT b.city AS city_building, c.`name` AS name_contractor, c.`phone` AS phone_contractor, a.`name` AS architect_name FROM building b 
JOIN (SELECT id,  `name`, phone FROM  contractor) c ON b.contractor_id = c.id
JOIN (SELECT building_id, architect_id FROM  design) d ON b.id = d.building_id
JOIN (SELECT id,  `name` FROM  architect) a ON d.architect_id = a.id
WHERE b.city = 'can tho' AND a.`name` = 'le kim dung';

SELECT b.`name` AS name_building, a.`place` AS place_architect FROM building b 
JOIN (SELECT building_id, architect_id FROM  design) d ON b.id = d.building_id
JOIN (SELECT id,  place FROM  architect) a ON d.architect_id = a.id
WHERE b.`name` = 'khach san quoc te';


SELECT DISTINCT 
    worker.name AS HoTen,
    worker.birthday AS NamSinh,
    work.date AS NamVaoNghe
FROM 
    worker
JOIN 
    work ON worker.id = work.worker_id
JOIN 
    building ON work.building_id = building.id
JOIN 
    contractor ON building.contractor_id = contractor.id
WHERE 
    (worker.skill = 'han' OR worker.skill = 'dien')
    AND contractor.name = 'le van son';
    
SELECT 
    worker.name AS HoTen,
    DATEDIFF(LEAST('1994-12-31', work.date) , GREATEST('1994-12-15', work.date)) + 1 AS SoNgayThamGia
FROM 
    worker
JOIN 
    work ON worker.id = work.worker_id
JOIN 
    building ON work.building_id = building.id
WHERE 
    building.name = 'khach san quoc te' 
    AND building.city = 'can tho'
    AND work.date BETWEEN '1994-12-15' AND '1994-12-31'
ORDER BY 
    worker.name;
    
    
SELECT DISTINCT 
    architect.name AS HoTen,
    architect.birthday AS NamSinh
FROM 
    architect
JOIN 
    design ON architect.id = design.architect_id
JOIN 
    building ON design.building_id = building.id
WHERE 
    architect.place = 'tp hcm'
    AND building.cost > 400;


SELECT 
    name AS TenCongTrinh
FROM 
    building
ORDER BY 
    cost DESC
LIMIT 1;

SELECT 
    architect.name AS TenKienTrucSu
FROM 
    architect
JOIN 
    design ON architect.id = design.architect_id
JOIN 
    building AS b1 ON design.building_id = b1.id
JOIN 
    contractor AS c1 ON b1.contractor_id = c1.id
JOIN 
    building AS b2 ON design.building_id = b2.id
JOIN 
    contractor AS c2 ON b2.contractor_id = c2.id
WHERE 
    c1.name = 'phong dich vu so xd'
    AND c2.name = 'le van son';


SELECT 
    worker.name AS HoTen
FROM 
    worker
JOIN 
    work ON worker.id = work.worker_id
JOIN 
    building ON work.building_id = building.id
WHERE 
    building.city = 'can tho'
    AND worker.id NOT IN (
        SELECT worker_id
        FROM work
        JOIN building ON work.building_id = building.id
        WHERE building.city = 'vinh long'
    );



SELECT 
    contractor.name AS TenChuThau
FROM 
    contractor
JOIN 
    building ON contractor.id = building.contractor_id
WHERE 
    building.cost > ALL (
        SELECT cost
        FROM building
        JOIN contractor ON building.contractor_id = contractor.id
        WHERE contractor.name = 'phong dich vu so xd'
    );


SELECT 
    architect.name AS HoTen
FROM 
    architect
JOIN 
    design ON architect.id = design.architect_id
WHERE 
    design.benefit < (SELECT AVG(benefit) FROM design);
    
    
SELECT 
    contractor.name AS TenChuThau,
    contractor.address AS DiaChi
FROM 
    contractor
JOIN 
    building ON contractor.id = building.contractor_id
WHERE 
    building.cost = (SELECT MIN(cost) FROM building);
    


SELECT 
    worker.name AS HoTen,
    worker.skill AS ChuyenMon
FROM 
    worker
JOIN 
    work ON worker.id = work.worker_id
JOIN 
    building ON work.building_id = building.id
JOIN 
    design ON building.id = design.building_id
JOIN 
    architect ON design.architect_id = architect.id
WHERE 
    architect.name = 'le thanh tung';


SELECT DISTINCT 
    c1.name AS ChuThau1,
    c2.name AS ChuThau2
FROM 
    building AS b1
JOIN 
    contractor AS c1 ON b1.contractor_id = c1.id
JOIN 
    building AS b2 ON b1.city = b2.city AND b1.id <> b2.id
JOIN 
    contractor AS c2 ON b2.contractor_id = c2.id
WHERE 
    c1.id < c2.id;


SELECT 
    contractor.name AS TenChuThau,
    SUM(building.cost) AS TongKinhPhi
FROM 
    contractor
JOIN 
    building ON contractor.id = building.contractor_id
GROUP BY 
    contractor.name;


SELECT 
    architect.name AS HoTen
FROM 
    architect
JOIN 
    design ON architect.id = design.architect_id
GROUP BY 
    architect.name
HAVING 
    SUM(design.benefit) > 25;
    
    
    
SELECT 
    COUNT(*) AS SoLuongKienTrucSu
FROM 
    architect
JOIN 
    design ON architect.id = design.architect_id
GROUP BY 
    architect.id
HAVING 
    SUM(design.benefit) > 25;
    
    
SELECT 
    building.name AS TenCongTrinh,
    COUNT(DISTINCT work.worker_id) AS TongSoCongNhan
FROM 
    building
JOIN 
    work ON building.id = work.building_id
GROUP BY 
    building.id;

SELECT 
    building.name AS TenCongTrinh,
    building.address AS DiaChi
FROM 
    building
JOIN 
    work ON building.id = work.building_id
GROUP BY 
    building.id
ORDER BY 
    COUNT(DISTINCT work.worker_id) DESC
LIMIT 1;


SELECT 
    building.city AS ThanhPho,
    AVG(building.cost) AS KinhPhiTrungBinh
FROM 
    building
GROUP BY 
    building.city;


SELECT 
    worker.name AS HoTen
FROM 
    worker
JOIN 
    work ON worker.id = work.worker_id
GROUP BY 
    worker.id
HAVING 
    SUM(DATEDIFF(work.date_end, work.date_start) + 1) > (
        SELECT 
            SUM(DATEDIFF(work.date_end, work.date_start) + 1)
        FROM 
            worker
        JOIN 
            work ON worker.id = work.worker_id
        WHERE 
            worker.name = 'nguyen hong van'
    );


SELECT 
    contractor.name AS TenChuThau,
    building.city AS ThanhPho,
    COUNT(building.id) AS TongSoCongTrinh
FROM 
    contractor
JOIN 
    building ON contractor.id = building.contractor_id
GROUP BY 
    contractor.name, building.city;
    
    
    
SELECT 
    worker.name AS HoTen
FROM 
    worker
JOIN 
    work ON worker.id = work.worker_id
GROUP BY 
    worker.id
HAVING 
    COUNT(DISTINCT work.building_id) = (SELECT COUNT(*) FROM building);
    
    
SELECT 
    worker.name AS HoTen
FROM 
    worker
JOIN 
    work ON worker.id = work.worker_id
GROUP BY 
    worker.id
HAVING 
    COUNT(DISTINCT work.building_id) = (SELECT COUNT(*) FROM building);




