CREATE SCHEMA papelaria;

-- Tabela Cliente
CREATE TABLE papelaria.Cliente (
    ClienteID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    contribuinte VARCHAR(20)
);

-- Tabela Produto
CREATE TABLE papelaria.Produto (
    ProdutoID SERIAL PRIMARY KEY,
    descricao VARCHAR(100),
    embalagem VARCHAR(50),
    preco_unitario DECIMAL(10, 2),
    iva_unitario DECIMAL(5, 2)
);

-- Tabela Venda
CREATE TABLE papelaria.Venda (
    num_venda SERIAL PRIMARY KEY,
    ClienteID INT,
    data DATE,
    local VARCHAR(100),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- Tabela VendaProduto (relaciona Venda e Produto)
CREATE TABLE papelaria.VendaProduto (
    VendaProdutoID SERIAL PRIMARY KEY,
    num_venda INT,
    ProdutoID INT,
    quantidade INT,
    desconto DECIMAL(5, 2),
    iva_produto DECIMAL(10, 2),
    FOREIGN KEY (num_venda) REFERENCES Venda(num_venda),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

-- Tabela Opcional: ValorProduto (separada para valores calculados por item)
CREATE TABLE papelaria.ValorProduto (
    ValorProdutoID SERIAL PRIMARY KEY,
    VendaProdutoID INT,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (VendaProdutoID) REFERENCES VendaProduto(VendaProdutoID)
);
