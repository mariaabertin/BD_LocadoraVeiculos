Sistema de Locadora de Veículos
1. Descrição do Domínio
Este projeto modela o banco de dados de uma locadora de veículos, cobrindo desde o cadastro operacional (clientes, funcionários, filiais, veículos e categorias) até processos de negócio mais complexos, como reservas, locações, cálculo de faturamento, controle de devolução, multas por atraso e status de disponibilidade da frota.
O banco busca refletir o funcionamento real de uma locadora: o cliente escolhe um carro, define a filial de retirada, realiza a reserva, posteriormente efetiva uma locação com quilometragem, data e filial de devolução, e cálculo de valor final. Além disso, o sistema permite análises gerenciais, como faturamento mensal, faturamento por filial, análise dos veículos disponíveis  e desempenho por categoria de veículo.
Com isso, o projeto simula um ambiente completo para estudo de modelagem e análise de dados, complementados pela criação de consultas SQL e implementação de procedures e functions.

2. Como Executar os Scripts (ordem recomendada)
2.1 LOCADORAddl.sql
Cria o schema LOCADORA e todas as tabelas base.
2.2 ddlAlter.sql
Executa alterações de evolução de esquema: ALTER TABLE; TRUNCATE; DROP
2.3 dmlInserts.sql
Insere dados das tabelas criadas (estados, cidades, clientes, filiais, categorias, veículos, categorias, modelos, status, reservas e locações).
2.4 SelectJoins.sql
Contém todas as consultas pedidas (JOINs e agregações).
2.5 views.sql
Cria as views gerenciais (faturamento mensal, faturamento mensal e veículos disponíveis).
2.6 procedureFunction.sql
Define a FUNCTION de cálculo de multa e a PROCEDURE de registrar devolução (agregando a função de calcular multa).


3. Dependências e Configurações
Utilização do MySQL Workbench.
Configurações iniciais:
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

4. Glossário das Tabelas

Tabela
Função
CLIENTE
Armazena dados de identificação e contato dos clientes
FUNCIONARIO
Registra os funcionários vinculados às filiais
FILIAL
Armazena as filiais da locadora
ESTADO/CIDADE
Domínio geográfico para localização das filiais
CATEGORIA
Tipos de veículos (SUV, Econômico, Luxo etc).
MARCA/MODELO
Especificações técnicas dos veículos
STATUSVEICULO
Tabela de domínio (Disponível / Em Manutenção / Locado)
VEICULO
Todos os automóveis da empresa, com categoria, status e filial.
RESERVA
Registro de intenção de uso, com datas e filiais
LOCACAO
Registro final da utilização do veículo, km, valores e devolução


5. Decisões de Modelagem
5.1 Separação entre RESERVA e LOCACAO
A reserva representa uma intenção futura, já a locação é um evento concreto com dados operacionais:
quilometragem retirada;
quilometragem devolução;
cálculo financeiro;
funcionário responsável.

5.2 Status do veículo, Marca e Modelo em tabela de domínio
Para garantir a padronização dos valores e fácil alteração e cadastro, evitando redundâncias e repetições inadequadas.

5.3 PK simples para todas as tabelas
Simplifica joins, garante performance e evita problemas de FK durante a evolução do esquema.

5.4 Filial de Retirada e Filial de Devolução separadas
Pensado para manutenção de cenários reais, como retirar em Brasília e devolver em Goiânia, idealizando uma locação para viagem de carro, por exemplo.

