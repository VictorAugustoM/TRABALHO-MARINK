
CREATE TABLE Mesa (
    id_mesa INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
	status varchar (50)
    );
    

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    preco_unitario DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    estoque_minimo INT NOT NULL,
    marca VARCHAR(100)
    );
    
    CREATE TABLE Forma_Pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL
    );

    CREATE TABLE Venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_mesa INT NOT NULL,
    id_cliente INT,
    forma_pagamento INT NOT NULL,
    data_hora DATETIME NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (forma_pagamento) REFERENCES Forma_Pagamento(id_forma_pagamento)
    );
    
    CREATE TABLE Venda_Produto (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
    );
    
 SELECT * FROM Mesa;
 
 SELECT * FROM Venda;
 
 SELECT * FROM Venda_Produto;
 --------------------------------------   
 #A#
 SELECT 
    Cliente.Nome AS Nome_Funcionario, 
    Mesa.Numero AS Numero_Mesa, 
    SUM(Venda.Valor_Total) AS Total_Gasto
FROM 
    Venda
INNER JOIN 
    Cliente ON Venda.ID_Cliente = Cliente.ID_Cliente
INNER JOIN 
    Mesa ON Venda.ID_Mesa = Mesa.ID_Mesa
GROUP BY 
    Cliente.Nome, Mesa.Numero
ORDER BY 
    Cliente.Nome, Mesa.Numero;
-----------------------------------------------      
 
 #B)#
SELECT 
    p.descricao AS produto,
    vp.quantidade,
    vp.subtotal
FROM Venda_Produto vp
JOIN Produto p ON vp.id_produto = p.id_produto
JOIN Venda v ON vp.id_venda = v.id_venda
JOIN Mesa m ON v.id_mesa = m.id_mesa
WHERE m.numero = 4;
 --------------------------------------------   
#C)#  
 DELIMITER $$

CREATE PROCEDURE Mesa_Para_Livre(IN num_mesa INT)
BEGIN
    -- Verifica se a mesa existe e altera o status para "Livre"
    UPDATE Mesa
    SET status = 'Livre'
    WHERE numero = num_mesa;

    -- Caso a mesa não exista, retorna uma mensagem
    IF ROW_COUNT() = 0 THEN
        SELECT 'Mesa não encontrada ou já está livre.' AS mensagem;
    ELSE
        SELECT 'Status da mesa alterado para "Livre".' AS mensagem;
    END IF;
END $$

DELIMITER ;

CALL Mesa_Para_Livre(2);



