SELECT 
    SUM(valor_total) AS total_vendas, 
    SUM(iva_total) AS total_iva 
FROM 
    VendasDetalhadas;
