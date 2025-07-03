# 📊 Sistema de Análise de Churn - Agência de Viagens (MySQL)

![Mysql_3](https://github.com/user-attachments/assets/227b2972-938b-4db2-9fb5-f400f709f2e4)
![Mysql_2](https://github.com/user-attachments/assets/d65f1ae4-9315-4ab0-8e80-9a91488e9a8c)


Este é um projeto de banco de dados relacional em **MySQL** para uma **agência de viagens fictícia**, com foco na **análise de churn (cancelamento de clientes)**. O sistema foi desenvolvido para registrar informações dos clientes, viagens realizadas, pagamentos, interações com o SAC e motivos de cancelamento, com o objetivo de gerar **insights sobre o comportamento dos clientes**.

---

## 🔍 Visão Geral

O sistema foi projetado para apoiar a análise de dados e decisões estratégicas da empresa, possibilitando:

- Cadastro e monitoramento de **clientes** (ativos, inativos e cancelados)
- Registro de **viagens**, incluindo destinos, datas e preços
- Controle de **pagamentos** e métodos utilizados
- Histórico de **interações com o SAC** (elogios, dúvidas e reclamações)
- Registro de **cancelamentos** e seus respectivos **motivos**

---

## 🗃️ Estrutura do Banco de Dados

O banco é composto por **5 tabelas**:

| Tabela         | Descrição |
|----------------|-----------|
| **clientes**      | Informações pessoais, status e motivo de cancelamento |
| **viagens**       | Detalhes das viagens (destino, preço, data, status) |
| **pagamentos**    | Informações sobre o pagamento das viagens |
| **interacoes**    | Registros de SAC: reclamações, dúvidas e elogios |
| **cancelamentos** | Motivos e canais de cancelamento utilizados |

---

## 🛠️ Tecnologias Utilizadas

- **MySQL**
- **SQL Queries (consultas analíticas)**
- **Modelagem Relacional**
- **Diagrama ER (Entidade-Relacionamento)**

---

## 📁 Estrutura do Projeto

- `create_tables.sql`: Criação das tabelas com chaves primárias e estrangeiras
- `insert_data.sql`: Inserção de dados fictícios (25 clientes + dados associados)
- `queries.sql`: Consultas analíticas para relatórios e visualizações

---

✅ Resultados Esperados

Churn Analysis: identificar os principais motivos de cancelamento
Clientes Frequentes: segmentação para campanhas de fidelização
Otimização de Estratégias: com base no histórico de viagens e interações
Tomada de Decisão Baseada em Dados
Escalabilidade: estrutura preparada para milhares de registros com índices otimizados

