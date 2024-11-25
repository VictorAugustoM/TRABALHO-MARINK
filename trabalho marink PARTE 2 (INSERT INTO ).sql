INSERT INTO Mesa (numero, status) VALUES
(1, 'Livre'),
(2, 'Ocupada'),
(3, 'Sobremesa'),
(4, 'Ocupada Ociosa');

INSERT INTO Cliente (nome, telefone) VALUES
('Victor Augusto', '123456789'),
('Paulo Ricardo', '987654321');

INSERT INTO Forma_Pagamento (descricao) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Pix');

INSERT INTO Produto (codigo, descricao, preco_unitario, quantidade_estoque, estoque_minimo, marca) VALUES
('P001', 'Coca-Cola', 5.00, 100, 10, 'Coca Cola '),
('P002', 'Hambúrguer', 15.00, 50, 5, 'Burger');

INSERT INTO Venda_Produto (id_venda, id_produto, quantidade, subtotal) VALUES
(1, 1, 3, 24.00), 
(1, 2, 1, 30.00);

INSERT INTO Venda (id_mesa, id_cliente, forma_pagamento, data_hora, valor_total) 
VALUES (2, 1, 1, '2024-11-25 12:00:00', 24.00);

INSERT INTO Venda (id_mesa, id_cliente, forma_pagamento, data_hora, valor_total) 
VALUES (3, NULL, 1, '2024-11-25 14:30:00', 54.00);

INSERT INTO Venda_Produto (id_venda, id_produto, quantidade, subtotal) 
VALUES (2, 1, 1, 30.00); 

INSERT INTO Venda_Produto (id_venda, id_produto, quantidade, subtotal) 
VALUES (4, 2, 5, 25.00); 








