SELECT 
    v.num_venda,
    c.nome AS cliente_nome,
    ROUND((vp.quantidade * p.preco_unitario), 2) AS subtotal,
    ROUND((vp.quantidade * p.preco_unitario * p.iva_unitario / 100), 2) AS iva_total,
    ROUND(((vp.quantidade * p.preco_unitario) - vp.desconto) + 
          (vp.quantidade * p.preco_unitario * p.iva_unitario / 100), 2) AS valor_total
FROM 
    Venda v
INNER JOIN Cliente c ON v.ClienteID = c.ClienteID
INNER JOIN VendaProduto vp ON v.num_venda = vp.num_venda
INNER JOIN Produto p ON vp.ProdutoID = p.ProdutoID;
