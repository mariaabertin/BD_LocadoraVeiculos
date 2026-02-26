USE LOCADORA;
-- VIEW (visões)

-- VIEW para analisar o faturamento mensal da locadora 
CREATE VIEW VwFaturamentoMensal AS
SELECT 
    YEAR(DATADEVOLUCAO) AS Ano,
    MONTH(DATADEVOLUCAO) AS Mes,
    SUM(VALORFINAL) AS FaturamentoTotal
FROM LOCACAO
GROUP BY Ano, Mes;


-- VIEW para analisar faturamento por filial
CREATE VIEW VwFaturamentoFilial AS 
SELECT 
    B.NOMEFILIAL,
    SUM(A.VALORFINAL) AS FaturamentoFilial
FROM LOCACAO A
JOIN FILIAL B ON B.idFILIAL = A.IDFILIALDEV
GROUP BY B.NOMEFILIAL;


-- VIEW para analisar os veículos disponíveis
CREATE VIEW VWVeiculosDisponiveis AS
SELECT 
A.idVEICULO,
B.NOMEMODELO
FROM VEICULO A 
INNER JOIN MODELO B ON A.IDMODELO = B.idMODELO
WHERE IDSTATUS = 1; 
