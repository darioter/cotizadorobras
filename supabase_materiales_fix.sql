-- LIMPIEZA DE CATEGORÍAS DUPLICADAS
-- Ejecutar en Supabase SQL Editor

UPDATE materiales_obra SET categoria='Hierros' WHERE categoria='Hierro';
UPDATE materiales_obra SET categoria='Pinturas' WHERE categoria='Pintura';
UPDATE materiales_obra SET categoria='Sanitaria' WHERE categoria='Sanitaria mat.';
UPDATE materiales_obra SET categoria='Ladrillos' WHERE categoria='Mampostería';

-- Verificar resultado
SELECT categoria, count(*) FROM materiales_obra WHERE activo=true GROUP BY categoria ORDER BY categoria;
