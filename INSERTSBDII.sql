USE LOCADORA;
-- INSERTS

-- INSERT CLIENTES
INSERT INTO `locadora`.`CLIENTE` (idCLIENTE, CPFCLIENTE, NOMECLIENTE, DATANASCIMENTO, EMAILCLIENTE, TELCLIENTE, DATACADASTRO)
VALUES (1, '55555555552', 'Thaynara Lima', '2000-07-04', 'thay@email', '61988887777', '2025-01-10'),
(2, '12345678901', 'Marco Polo', '1998-03-12', 'marco@email', '61999998888', '2024-02-05'),
(3, '98765432100', 'Marina Ruy', '2001-11-22', 'marina@email', '61992223333', '2023-03-18'),
(4, '44433322211', 'Ana Braga', '1995-06-30', 'ana@email', '61991112222', '2024-04-09'),
(5, '22211133344', 'Fernanda Montenegro', '2002-09-17', 'fernanda@email', '61998886666', '2025-05-27'),
(6, '99988877766', 'Gabriel Medina', '1999-01-25', 'gabriel@email', '61997775555', '2024-06-14'),
(7, '11122233355', 'Bruna Marquezine', '2003-02-10', 'bruna@email', '61996664444', '2025-07-03'),
(8, '66677788899', 'Sasha Meneguel', '1997-10-08', 'sasha@email', '61995553333', '2023-08-21'),
(9, '33344455566', 'Willian Bonner', '2000-12-19', 'willian@email', '61994442222', '2025-09-10'),
(10, '88899900011', 'Sandy Lima', '1996-04-04', 'sandy@email', '61993331111', '2024-10-02');
-- CONFERINDO SE ESTA CORRETO
SELECT * FROM LOCADORA.CLIENTE;


-- MANTENDO A INTEGRIDADE REFERENCIAL, PRECISO CRIAR ESTADO -> CIDADE -> FILIAL
-- INSERT ESTADO
SELECT * FROM LOCADORA.ESTADO;
INSERT INTO `LOCADORA`.`ESTADO` (idESTADO, NOMEESTADO, UFESTADO) VALUES
(1,  'ACRE', 'AC'),
(2,  'ALAGOAS', 'AL'),
(3,  'AMAPA', 'AP'),
(4,  'AMAZONAS', 'AM'),
(5,  'BAHIA', 'BA'),
(6,  'CEARA', 'CE'),
(7,  'DISTRITO FEDERAL', 'DF'),
(8,  'ESPIRITO SANTO', 'ES'),
(9,  'GOIAS', 'GO'),
(10, 'MARANHAO', 'MA'),
(11, 'MATO GROSSO', 'MT'),
(12, 'MATO GROSSO DO SUL', 'MS'),
(13, 'MINAS GERAIS', 'MG'),
(14, 'PARA', 'PA'),
(15, 'PARAIBA', 'PB'),
(16, 'PARANA', 'PR'),
(17, 'PERNAMBUCO', 'PE'),
(18, 'PIAUI', 'PI'),
(19, 'RIO DE JANEIRO','RJ'),
(20, 'RIO GRANDE DO NORTE', 'RN'),
(21, 'RIO GRANDE DO SUL', 'RS'),
(22, 'RONDONIA', 'RO'),
(23, 'RORAIMA', 'RR'),
(24, 'SANTA CATARINA', 'SC'),
(25, 'SAO PAULO', 'SP'),
(26, 'SERGIPE', 'SE'),
(27, 'TOCANTINS', 'TO');

-- INSERT CIDADES
SELECT * FROM LOCADORA.CIDADE;
INSERT INTO `LOCADORA`.`CIDADE` (`idCIDADE`, `ESTADO_idESTADO`, `NOMECIDADE`) 
VALUES ('1', '21', 'RIO DE JANEIRO'),
('2', '7', 'BRASILIA'),
('3', '9', 'GOIANIA'),
('4', '25', 'SAO PAULO'),
('5', '5', 'SALVADOR');

-- INSERT FILIAL
SELECT * FROM LOCADORA.FILIAL;
INSERT INTO `LOCADORA`.`FILIAL` (`idFILIAL`, `FILIALCIDADE`, `NOMEFILIAL`) 
VALUES ('1', '2', 'CARROS JATO'),
('2', '1', 'CARROS MAR'),
('3', '1', 'CARROS TERRA'),
('4', '5', 'CARROS LAGO'),
('5', '3', 'CARROS ESTRADA'),
('6', '4', 'CARROS TRANSITO'),
('7', '5', 'CARROS SOL'),
('8', '3', 'CARROS ASFALTO'),
('9', '2', 'CARROS ESPLANADA'),
('10', '2', 'CARROS CATEDRAL');


-- MANTENDO A INTEGRIDADE REFERENCIAL, PRECISO CRIAR CATEGORIA, MARCA, MODELO E STATUS ANTES DE CRIAR VEICULO
-- INSERT CATEGORIA
SELECT * FROM LOCADORA.CATEGORIA;
INSERT INTO `LOCADORA`.`CATEGORIA` 
(idCATEGORIA, NOMECATEGORIA, DESCCATEGORIA, VALORDIARIA)
VALUES
(1, 'ECONÔMICO', 'Veículos compactos, baixo consumo e custo-benefício.', 89.90),
(2, 'HATCH', 'Modelos hatch intermediários, conforto para pequenas viagens.', 109.90),
(3, 'SEDAN', 'Sedans médios com porta-malas amplo e bom desempenho.', 139.90),
(4, 'SUV COMPACTO', 'SUV pequeno, ideal para família e viagens curtas.', 159.90),
(5, 'SUV PREMIUM', 'SUVs maiores com mais potência e tecnologia.', 229.90),
(6, 'LUXO', 'Veículos premium com alto nível de conforto e acabamento.', 299.90),
(7, 'PICKUP', 'Caminhonetes para carga leve e média, uso urbano ou rural.', 189.90),
(8, 'MINIVAN', 'Veículos com 6 a 7 lugares, focados em viagens em grupo.', 249.90),
(9, 'ESPORTIVO', 'Modelos com desempenho acima da média e design esportivo.', 349.90),
(10, 'ELETRICO', 'Carros 100% elétricos, tecnologia e sustentabilidade.', 199.90);

-- INSERT MARCA
SELECT * FROM LOCADORA.MARCA;
INSERT INTO `LOCADORA`.`MARCA` (idMARCA, NOMEMARCA)
VALUES
(1, 'Volkswagen'),
(2, 'Chevrolet'),
(3, 'Fiat'),
(4, 'Hyundai'),
(5, 'Toyota'),
(6, 'Honda'),
(7, 'Renault'),
(8, 'Jeep'),
(9, 'Nissan'),
(10, 'Ford');

-- INSERT MODELO
SELECT * FROM LOCADORA.MODELO;
INSERT INTO `LOCADORA`.`MODELO` (idMODELO, NOMEMODELO)
VALUES
(1, 'Gol'),
(2, 'Onix'),
(3, 'Argo'),
(4, 'HB20'),
(5, 'Corolla'),
(6, 'Civic'),
(7, 'Kwid'),
(8, 'Renegade'),
(9, 'Kicks'),
(10, 'Ranger');


-- INSERT STATUS
SELECT * FROM LOCADORA.STATUSVEICULO;
INSERT INTO `LOCADORA`.`STATUSVEICULO` (`idSTATUS`, `NOME_STATUS`) 
VALUES (1, 'DISPONIVEL'),
(2, 'LOCADO'),
(3, 'RESERVADO'),
(4, 'MANUTENCAO'),
(5, 'BLOQUEADO'),
(6, 'TRANSITO');


-- INSERT VEICULO
SELECT * FROM LOCADORA.VEICULO;
INSERT INTO `LOCADORA`.`VEICULO` (idVEICULO, PLACA, RENAVAM, ANOVEICULO, IDSTATUS, IDFILIAL, IDCATEGORIA, IDMARCA, IDMODELO)
VALUES (1, 'ABC1A23', '12345678901', '2019', 1, 1, 1, 1, 1),   -- Disponível
(2, 'DEF2B34', '23456789012', '2020', 3, 1, 2, 2, 2),   -- Locado
(3, 'GHI3C45', '34567890123', '2018', 6, 2, 3, 3, 3),   -- Em trânsito
(4, 'JKL4D56', '45678901234', '2021', 1, 2, 4, 4, 4),   -- Disponível
(5, 'MNO5E67', '56789012345', '2022', 1, 3, 5, 5, 5),   -- Disponível
(6, 'PQR6F78', '67890123456', '2017', 4, 3, 1, 6, 6),   -- Indisponível
(7, 'STU7G89', '78901234567', '2016', 2, 4, 2, 7, 7),   -- Em manutenção
(8, 'VWX8H90', '89012345678', '2020', 3, 4, 3, 8, 8),   -- Locado
(9, 'YZA9I01', '90123456789', '2019', 5, 5, 4, 9, 9),   -- Bloqueado
(10,'BCD0J12', '11223344556', '2021', 1, 5, 5, 10,10),  -- Disponível
(11,'CDE1K23', '22334455667', '2018', 3, 1, 1, 1, 1),   -- Locado
(12,'DEF2L34', '33445566778', '2022', 2, 2, 2, 2, 2),   -- Em manutenção
(13,'EFG3M45', '44556677889', '2017', 4, 3, 3, 3, 3),   -- Indisponível
(14,'FGH4N56', '55667788990', '2020', 1, 4, 4, 4, 4),   -- Disponível
(15,'GHI5O67', '66778899001', '2023', 1, 5, 5, 5, 5),   -- Disponível
(16, 'ABC1D23', '98765432110', '2018', 1, 1, 3, 4, 7), -- Disponível
(17, 'DEF4G56', '12345987655', '2020', 1, 2, 5, 2, 3), -- Disponível
(18, 'HIJ7K89', '56473829101', '2021', 4, 3, 1, 7, 9), -- Indisponível
(19, 'LMN2O34', '90817263544', '2019', 3, 4, 6, 1, 6), -- Locado
(20, 'PQR5S67', '34562781900', '2017', 1, 5, 4, 8, 2), -- Disponível
(21, 'TUV8W90', '11823344556', '2022', 2, 1, 7, 6, 8), -- Em manutenção
(22, 'XYZ1A23', '77889966554', '2023', 1, 2, 2, 10, 5), -- Disponível
(23, 'BCD4E56', '55667788992', '2016', 3, 3, 9, 5, 10), -- Locado
(24, 'FGH7I89', '44332211009', '2018', 4, 4, 8, 3, 4), -- Indisponível
(25, 'JKL0M12', '22114455887', '2020', 1, 5, 10, 9, 1); -- Disponível



-- INSERT FUNCIONARIOS
SELECT * FROM LOCADORA.FUNCIONARIO;
INSERT INTO FUNCIONARIO (idFUNCIONARIO, idFILIAL, CPFFUNC, NOMEFUNC, EMAILFUNC)
VALUES (1, 1, '11111111111', 'Lucas Andrade', 'lucas.andrade@locadora.com'),
(2, 1, '22222222222', 'Mariana Costa', 'mariana.costa@locadora.com'),
(3, 2, '33333333333', 'João Carvalho', 'joao.carvalho@locadora.com'),
(4, 2, '44444444444', 'Ana Bezerra', 'ana.bezerra@locadora.com'),
(5, 3, '55555555555', 'Pedro Martins', 'pedro.martins@locadora.com'),
(6, 3, '66666666666', 'Carla Ribeiro', 'carla.ribeiro@locadora.com'),
(7, 4, '77777777777', 'Rafael Moreira', 'rafael.moreira@locadora.com'),
(8, 4, '88888888888', 'Juliana Teles', 'juliana.teles@locadora.com'),
(9, 5, '99999999999', 'Bruno Ferreira', 'bruno.ferreira@locadora.com'),
(10, 5, '10101010101', 'Letícia Souza', 'leticia.souza@locadora.com');


-- INSERT RESERVAS
SELECT * FROM LOCADORA.RESERVA;
INSERT INTO RESERVA (idRESERVA, IDCLIENTE, IDVEICULO, IDFILIALRETIRADA, IDFILIALDEV, DATAINICIORESERVA, DATAPREVFIMRESERVA, STATUSRESERVA) 
VALUES (1, 1, 3, 1, 2, '2025-01-05', '2025-01-10', 0),
(2, 2, 7, 2, 2, '2025-01-12', '2025-01-15', 0),
(3, 3, 10, 3, 4, '2025-02-01', '2025-02-05', 0),
(4, 4, 5, 1, 1, '2025-02-10', '2025-02-12', 1),
(5, 5, 12, 4, 3, '2025-03-03', '2025-03-07', 0),
(6, 6, 14, 5, 5, '2025-03-10', '2025-03-13', 0),
(7, 7, 18, 6, 7, '2025-03-20', '2025-03-25', 0),
(8, 8, 21, 3, 3, '2025-04-01', '2025-04-06', 1),
(9, 9, 25, 7, 8, '2025-04-07', '2025-04-10', 0),
(10, 10, 2, 8, 8, '2025-04-15', '2025-04-18', 1),
(11, 1, 6, 4, 5, '2025-05-01', '2025-05-04', 0),
(12, 2, 9, 6, 6, '2025-05-05', '2025-05-08', 1),
(13, 3, 11, 7, 7, '2025-05-09', '2025-05-12', 0),
(14, 4, 13, 8, 9, '2025-06-01', '2025-06-05', 0),
(15, 5, 15, 9, 9, '2025-06-10', '2025-06-14', 0),
(16, 6, 17, 10, 10, '2025-07-01', '2025-07-04', 1),
(17, 7, 19, 1, 1, '2025-07-10', '2025-07-12', 0),
(18, 8, 22, 2, 4, '2025-07-15', '2025-07-18', 1),
(19, 9, 23, 3, 5, '2025-08-01', '2025-08-05', 0),
(20, 10, 24, 4, 6, '2025-08-10', '2025-08-15', 0);


-- INSERT LOCAÇÕES
SELECT * FROM LOCADORA.LOCACAO;
INSERT INTO LOCACAO (IDLOCACAO, DATARETIRADA, KMRETIRADA, IDFILIALRETIRADA, IDFILIALDEV, DATADEVOLUCAO, KMDEVOLUCAO, VALORDIARIA, TAXAS, MULTA, VALORFINAL, IDRESERVA, IDCLIENTE, IDVEICULO, IDFUNCIONARIO)
VALUES (1, '2025-01-05', 12000, 1, 2, '2025-01-10', 12350, 150.00, 20.00, 0.00, 770.00, 1, 1, 3, 1),
(2, '2025-01-12', 45000, 2, 2, '2025-01-15', 45130, 180.00, 0.00, 0.00, 540.00, 2, 2, 7, 2),
(3, '2025-02-01', 30000, 3, 4, '2025-02-05', 30220, 200.00, 15.00, 10.00, 825.00, 3, 3, 10, 3),
(4, '2025-02-10', 18000, 1, 1, '2025-02-12', 18140, 100.00, 0.00, 0.00, 200.00, 4, 4, 5, 4),
(5, '2025-03-03', 52000, 4, 3, '2025-03-07', 52350, 170.00, 12.00, 5.00, 697.00, 5, 5, 12, 5),
(6, '2025-03-10', 61000, 5, 5, '2025-03-13', 61190, 140.00, 10.00, 0.00, 430.00, 6, 6, 14, 6),
(7, '2025-03-20', 75000, 6, 7, '2025-03-25', 75320, 160.00, 0.00, 15.00, 815.00, 7, 7, 18, 7),
(8, '2025-04-01', 90000, 3, 3, '2025-04-06', 90330, 220.00, 18.00, 0.00, 1118.00, 8, 8, 21, 8),
(9, '2025-04-07', 13000, 7, 8, '2025-04-10', 13125, 130.00, 10.00, 0.00, 400.00, 9, 9, 25, 9),
(10, '2025-04-15', 48000, 8, 8, '2025-04-18', 48220, 100.00, 0.00, 0.00, 300.00, 10, 10, 2, 10),
(11, '2025-05-01', 22000, 4, 5, '2025-05-04', 22200, 140.00, 8.00, 0.00, 428.00, 11, 1, 6, 2),
(12, '2025-05-05', 33000, 6, 6, '2025-05-08', 33250, 155.00, 0.00, 0.00, 465.00, 12, 2, 9, 3),
(13, '2025-05-09', 27000, 7, 7, '2025-05-12', 27150, 120.00, 7.00, 0.00, 367.00, 13, 3, 11, 4),
(14, '2025-06-01', 51000, 8, 9, '2025-06-05', 51320, 190.00, 0.00, 10.00, 770.00, 14, 4, 13, 5),
(15, '2025-06-10', 62000, 9, 9, '2025-06-14', 62300, 210.00, 12.00, 0.00, 852.00, 15, 5, 15, 6);
