use ecommerce;
insert into Clients (Fname, Minit, Lname, Address) 
	   values('Maria','M','Silva', 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel','rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva','avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França','rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz','rua alemeda das flores 28, Centro - Cidade das flores');
INSERT INTO Clients (Fname, Minit, Lname, Address)
VALUES
  ('Compania Buceta Associados', NULL, NULL, 'Rua Empresa 1, Cidade A'),
  ('Anitta e Porno S.A', NULL, NULL, 'Rua Empresa 2, Cidade B'),
  ('Cinema S.A', NULL, NULL, 'Rua Empresa 3, Cidade C'),
  ('Americanas', NULL, NULL, 'Rua Empresa 4, Cidade D'),
  ('Amazon', NULL, NULL, 'Rua Empresa 5, Cidade E');
 
 select * from clients;
INSERT INTO clients_fisico(CPF,idClienteGeral) VALUES ('12346789',1),
  ('987654321',2),
  ('45678913',3),
  ('789123456',4),
  ('98745631',5),
  ('654789123',6);
  
  INSERT INTO clients_juridico(CNPJ,idClienteGeral) VALUES ('12346789000123', 7),
  ('98765432000123', 8),
  ('45678913000123', 9),
  ('78912345600123', 10),
  ('98745631000123', 11);
  
UPDATE product 
SET idProductStorage = 5 WHERE idProductStorage is NULL ;

select * from product;
select * from clients;


-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
							  ('Plug Anal',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Gucci',true,'Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2',null),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null);

select * from clients;
select * from product;

-- PAYMENT INSERT

INSERT INTO payments (idclient, idPayment, typePayment, limitAvailable)
VALUES
    (1, 1, 'Boleto', 1000.00),
    (1, 2, 'Cartão', 500.00),
    (2, 1, 'Boleto', 1500.00),
    (2, 2, 'Dois cartões', 2000.00),
    (3, 1, 'Cartão', 800.00);

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (1, default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,5,2,null),
                         (2,5,1,null),
                         (3,6,1,null);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,6,80),
                         (2,7,10);