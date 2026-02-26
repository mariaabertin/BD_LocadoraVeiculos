USE LOCADORA;
-- SELECTS + JOIN + AGREGAÇÕES

-- INNER JOIN: listagem de locações com cliente, veículo e filial de retirada
-- select para ter informacoes base sobre as locações
SELECT
A.IDLOCACAO as Locacao,
B.NOMECLIENTE as Cliente,
C.NOMEMODELO as ModeloVeiculo,
D.NOMEFILIAL as Filial
FROM LOCACAO A
INNER JOIN CLIENTE B ON A.IDCLIENTE = B.idCLIENTE
INNER JOIN VEICULO E ON A.IDVEICULO = E.idVEICULO
INNER JOIN MODELO C ON E.IDMODELO = C.idMODELO
INNER JOIN FILIAL D ON A.IDFILIALRETIRADA = D.idFILIAL;


-- LEFT JOIN: veículos e sua última locação (mesmo que não tenham sido locados).
-- select para estar a par da procura por locação dos veiculos
SELECT
A.idVEICULO as Veiculo,
B.NOMEMODELO as ModeloVeiculo,
C.IDLOCACAO AS Locacao,
C.DATARETIRADA AS DataLocacao
FROM VEICULO A
INNER JOIN MODELO B ON A.IDMODELO = B.idMODELO
LEFT JOIN LOCACAO C ON A.idVEICULO = C.IDVEICULO;


-- RIGHT JOIN: filiais e veículos (ou cenário equivalente que justifique RIGHT).
-- select para estar a par das procuras das filiais para devolucao
SELECT
A.NOMEFILIAL AS Filial,
B.IDFILIALDEV AS FilialDevolucao,
B.IDLOCACAO AS Locacao
FROM LOCACAO B
RIGHT JOIN FILIAL A ON A.IDFILIAL = B.IDFILIALDEV;


-- Agregações: SUM faturamento por mês/filial; MAX/MIN por categoria (ex.: maior valor de diária, menor quilometragem).
-- select para saber o faturamento mensal 
-- me atentando a colocar a data de dovolução como parâmetro, pois só após a dev que o faturamento é contabilizado
SELECT 
    YEAR(DATADEVOLUCAO) AS Ano,
    MONTH(DATADEVOLUCAO) AS Mes,
    SUM(VALORFINAL) AS FaturamentoTotal
FROM LOCACAO
GROUP BY Ano, Mes
ORDER BY Ano, Mes;

-- select para comparar o desempenho e precificação por categoria
SELECT 
    C.NOMECATEGORIA,
    MAX(A.VALORDIARIA) AS MaiorDiaria,
    MIN(A.VALORDIARIA) AS MenorDiaria
FROM LOCACAO A
JOIN VEICULO B ON B.idVEICULO = A.IDVEICULO
JOIN CATEGORIA C ON C.idCATEGORIA = B.IDCATEGORIA
GROUP BY C.NOMECATEGORIA
ORDER BY MaiorDiaria DESC;


-- GROUP BY: quantidade de locações por categoria de veículo
-- select para ter um parâmetro da procura/interesse pelos veículos
SELECT
COUNT(A.IDLOCACAO) as QntLocacoes,
B.NOMECATEGORIA
FROM LOCACAO A
INNER JOIN VEICULO C ON A.IDVEICULO = C.idVEICULO
INNER JOIN CATEGORIA B ON C.IDCATEGORIA = B.idCATEGORIA
GROUP BY B.NOMECATEGORIA;


-- CASE: classificação de atraso (ex.: CASE WHEN diasAtraso > 0 THEN 'Com atraso' ELSE 'No prazo' END).
-- select para estar a par da integridade das reservas e ter noção de quantas estão no prazo e quantos foram atrasadas
SELECT
    A.IDLOCACAO,
    CASE 
        WHEN DATEDIFF(A.DATADEVOLUCAO, B.DATAPREVFIMRESERVA) > 0 
            THEN 'Com atraso'
        ELSE 'No prazo'
    END AS SituacaoDevolucao
FROM LOCACAO A
JOIN RESERVA B ON A.IDRESERVA = B.idRESERVA;


-- Subconsulta: top 3 clientes por valor total locado.
-- select para compreender quais os tres clientes que mais gastaram na empresa
SELECT 
    A.idCLIENTE,
    A.NOMECLIENTE,
    (
        SELECT SUM(B.VALORFINAL)
        FROM LOCACAO B
        WHERE B.IDCLIENTE = A.idCLIENTE
    ) AS TotalGasto
FROM CLIENTE A
ORDER BY TotalGasto DESC
LIMIT 3;
	


-- Consultas de validação (obrigatórias)

-- PRECEDURE
-- Primeiro preciso deicar os valores de kilometragem e data devolução nulos
UPDATE LOCACAO
SET DATADEVOLUCAO = NULL, KMDEVOLUCAO = NULL
WHERE IDLOCACAO = 1;
-- Agora efetivar o PROCEDURE para ver se está válido
CALL RegistrarDevolucao(1, '2025-02-05', 12345);
-- Confirmando se foi registrado
SELECT * FROM LOCACAO WHERE IDLOCACAO = 1;


-- VIEW
SELECT * FROM vwfaturamentomensal WHERE mes='03';


-- FUNCTION
SELECT calcularMulta(2, 100.00);
