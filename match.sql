SET profiling = 1;

EXPLAIN ANALYZE
SELECT n.*, c.* FROM noticias AS n LEFT JOIN categorias AS c ON c.id = n.categoria_id
WHERE n.ativo = 1
AND n.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
AND MATCH (title, conteudo) AGAINST ('+Dado*' IN BOOLEAN MODE)
ORDER BY n.data DESC;

SHOW PROFILES;
