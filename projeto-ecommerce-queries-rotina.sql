use ecommerce;
select * from clients;
select concat(fname,' - ', Minit, ' - ', lname) as full_name from clients;
SELECT fname AS company_names
FROM clients
WHERE Minit IS NULL AND lname IS NULL;
-- Bagunça de uma nested query para concatenar nomes completos e não completos
SELECT CONCAT(fname, ' ', Minit, ' ', lname) AS full_name
FROM clients
WHERE (fname, Minit, lname) IN (
    SELECT fname, Minit, lname
    FROM clients
    WHERE Minit IS NOT NULL AND lname IS NOT NULL
)
OR (Minit IS NULL AND lname IS NULL);

-- só os pobretões no crédito
SELECT fname as name, count(*) as quantity from clients c
INNER JOIN payments p on p.idClient = c.idClient where typepayment like '%C_%' group by c.idClient, c.fname;

-- avaliando os produtos pela média
SELECT AVG(CASE WHEN avaliação <= 2 THEN 1 ELSE 0 END) AS avg_avaliacao
FROM product;

-- apenas nomes de clientes juridicos
SELECT fname as company_name, address as address from clients c
INNER JOIN clients_juridico cj on cj.idClienteGeral = c.idClient;

-- limite maior de 700 como total de limite ordenada por id
SELECT idclient, SUM(limitAvailable) AS totalLimit
FROM payments
GROUP BY idclient
HAVING totalLimit > 700;

-- essa n funciona kkk
SELECT idPoProduct, AVG(avaliação) AS average_rating
FROM productorder
GROUP BY idPoProduct
HAVING AVG(avaliação) > 2;

-- Quantos pedidos foram feitos por cada cliente?
SELECT idClient, COUNT(*) AS num_orders
FROM productorder
GROUP BY idClient;

-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT s.SocialName AS supplier_name, po.pname AS product_name
FROM seller s
INNER JOIN productSeller p ON s.idSeller = p.idPSeller
INNER JOIN product po on p.idPproduct = po.idProduct; 

-- Relação de produtos fornecedores e estoques;
SELECT p.pname AS product_name, s.SocialName AS supplier_name, ps.quantity AS stock_quantity
FROM product p
INNER JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
INNER JOIN Supplier s ON ps.idPsSupplier = s.idSupplier;

-- Algum vendedor também é fornecedor?
SELECT s.SocialName as Name
FROM Seller s
INNER JOIN Supplier su ON su.SocialName = s.SocialName;










