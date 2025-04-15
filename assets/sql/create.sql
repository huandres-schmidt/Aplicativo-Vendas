CREATE TABLE IF NOT EXISTS TABELA_CLIENTE (
    id                          INTEGER PRIMARY KEY,
    nome_cliente                TEXT,
    cnpj_cliente                TEXT,
    limite_credito              FLOAT
);

CREATE TABLE IF NOT EXISTS TABELA_PRODUTO (
    id                          INTEGER PRIMARY KEY,
    nome_produto                TEXT,
    codigo_produto              INTEGER,
    peso_embalagem_produto      FLOAT,
    valor_peso_produto          FLOAT,
    estoque_produto             INTEGER,
    tipo_produto                TEXT
);

CREATE TABLE IF NOT EXISTS TABELA_VENDA (
    numero_venda                INTEGER PRIMARY KEY AUTOINCREMENT,
    preco_total                 FLOAT,
    preco_final                 FLOAT,
    desconto_venda              FLOAT,
    cliente_cnpj_venda          TEXT,
    cliente_nome_venda          TEXT
);

CREATE TABLE IF NOT EXISTS TABELA_PRODUTO_VENDA (
    numero_pedido               INTEGER,
    nome_produto_venda          TEXT,
    codigo_produto_venda        INTEGER,
    quantidade_produto_venda    INTEGER
);

CREATE TABLE IF NOT EXISTS TABELA_EMPRESA (
    id                          INTEGER PRIMARY KEY,
    nome_empresa                TEXT,
    cnpj_empresa                TEXT,
    faturamento_empresa         FLOAT
);