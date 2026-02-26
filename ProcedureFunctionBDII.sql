USE LOCADORA;
-- PROCEDURE e FUNCTION


-- FUNCTION: calcula o valor da multa baseado nos dias de atraso
DELIMITER $$
CREATE FUNCTION calcularMulta(
    p_diasAtraso INT,
    p_valorDiaria DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_multa DECIMAL(10,2);

    IF p_diasAtraso > 0 THEN
        SET v_multa = p_diasAtraso * (p_valorDiaria * 2.5);
    ELSE
        SET v_multa = 0;
    END IF;

    RETURN v_multa;
END$$
DELIMITER ;


-- PROCEDURE: registra a devolução de um veículo
DELIMITER $$
CREATE PROCEDURE RegistrarDevolucao(
    IN p_idLocacao INT,
    IN p_dtDevolucao DATE,
    IN p_kmDevolucao INT
)
BEGIN
    DECLARE v_idReserva INT;
    DECLARE v_idVeiculo INT;
    DECLARE v_valorDiaria DECIMAL(10,2);
    DECLARE v_dataPrevista DATE;
    DECLARE v_diasAtraso INT;
    DECLARE v_multa DECIMAL(10,2);

    -- Busca os dados básicos da locação
    SELECT 
        IDRESERVA, 
        IDVEICULO, 
        VALORDIARIA
    INTO 
        v_idReserva, 
        v_idVeiculo, 
        v_valorDiaria
    FROM LOCACAO
    WHERE IDLOCACAO = p_idLocacao;

    -- Busca a data prevista de entrega
    SELECT DATAPREVFIMRESERVA
    INTO v_dataPrevista
    FROM RESERVA
    WHERE idRESERVA = v_idReserva;

    -- Calcula dias de atraso
    SET v_diasAtraso = DATEDIFF(p_dtDevolucao, v_dataPrevista);

    -- Calcula multa via FUNCTION
    SET v_multa = calcularMulta(v_diasAtraso, v_valorDiaria);

    -- Atualiza a locação com os dados da devolução
    UPDATE LOCACAO
    SET 
        DATADEVOLUCAO = p_dtDevolucao,
        KMDEVOLUCAO = p_kmDevolucao,
        MULTA = v_multa,
        VALORFINAL = (DATEDIFF(p_dtDevolucao, DATARETIRADA) * v_valorDiaria) + TAXAS + v_multa
    WHERE IDLOCACAO = p_idLocacao;

    -- Atualiza status do veículo para disponível (1)
    UPDATE VEICULO
    SET IDSTATUS = 1
    WHERE idVEICULO = v_idVeiculo;

END$$
DELIMITER ;
