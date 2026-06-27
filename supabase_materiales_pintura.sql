-- MATERIALES PINTURA — herramientas, insumos y consumibles
-- Ejecutar en Supabase SQL Editor

INSERT INTO materiales_obra (id, label, unit, precio, categoria, activo, orden) VALUES
  ('mat_enduido_plastico', 'Enduído plástico (kg)', 'kg', 1200, 'Pinturas', true, 100),
  ('mat_enduido_exterior', 'Enduído exterior (kg)', 'kg', 1400, 'Pinturas', true, 101),
  ('mat_lija_120', 'Lija N°120 (pliego)', 'u', 480, 'Pinturas', true, 102),
  ('mat_lija_80', 'Lija N°80 (pliego)', 'u', 450, 'Pinturas', true, 103),
  ('mat_rodillo_lana_23', 'Rodillo lana 23cm (u)', 'u', 3800, 'Pinturas', true, 104),
  ('mat_rodillo_antigota', 'Rodillo antigota 23cm (u)', 'u', 4200, 'Pinturas', true, 105),
  ('mat_pincel_3', 'Pincel 3" (u)', 'u', 1800, 'Pinturas', true, 106),
  ('mat_pincel_4', 'Pincel 4" (u)', 'u', 2200, 'Pinturas', true, 107),
  ('mat_cubeta_plastica', 'Cubeta plástica (u)', 'u', 1500, 'Pinturas', true, 108),
  ('mat_cinta_papel', 'Cinta de papel 50m (u)', 'u', 1200, 'Pinturas', true, 109),
  ('mat_fijador_agua_lt', 'Fijador al agua (lt) (u)', 'lt', 3200, 'Pinturas', true, 110),
  ('mat_fijador_ext_lt', 'Fijador exterior (lt) (u)', 'lt', 3800, 'Pinturas', true, 111),
  -- Hormigón elaborado
  ('mat_hormigon_h21', 'Hormigón H-21 (elaborado) (m³)', 'm³', 95000, 'Hormigón', true, 1),
  -- Placa OSB/multilaminado
  ('mat_fenolico_18', 'Fenólico 18mm (m²)', 'm²', 12000, 'Encofrado', true, 5),
  ('mat_puntal_met', 'Puntal metálico (u)', 'u', 3500, 'Encofrado', true, 6),
  ('mat_tabla_enc', 'Tabla encofrado 1"x10" (ml)', 'ml', 900, 'Encofrado', true, 7),
  -- Pisos madera
  ('mat_parquet_euc', 'Parquet eucaliptus (m²)', 'm²', 18000, 'Pisos madera', true, 1),
  -- Sanitaria completa
  ('mat_pegamento_pvc_u', 'Pegamento PVC (u)', 'u', 2400, 'Sanitaria', true, 30),
  ('mat_inodoro_blanco', 'Inodoro corto blanco común (u)', 'u', 87873, 'Sanitaria', true, 31),
  ('mat_bidet_blanco', 'Bidet blanco común (u)', 'u', 94552, 'Sanitaria', true, 32),
  ('mat_lavatorio_blanco', 'Lavatorio común blanco chico (u)', 'u', 90099, 'Sanitaria', true, 33),
  ('mat_accesorios_loza', 'Accesorios loza blancos (9 pzas.) (set)', 'set', 132858, 'Sanitaria', true, 34),
  ('mat_pileta_cocina_inox', 'Pileta cocina acero inox. doble bacha (u)', 'u', 119940, 'Sanitaria', true, 35),
  ('mat_pileta_lavadero', 'Pileta lavar Ferrum c/fregadero (u)', 'u', 160285, 'Sanitaria', true, 36),
  ('mat_cano_pvc_110', 'Caño PVC 3.2 110mm x 2m cloacal (u)', 'u', 19187, 'Sanitaria', true, 37),
  ('mat_cano_sigas_20', 'Caño Sigas thermofusión 20mm x 4m (u)', 'u', 25428, 'Sanitaria', true, 38),
  -- Eléctrica
  ('mat_cano_acero_58', 'Caño acero liviano 5/8" (ml)', 'ml', 2030, 'Eléctrica', true, 1),
  ('mat_cable_4mm', 'Cable 4mm² c/100m (u)', 'u', 116415, 'Eléctrica', true, 2),
  ('mat_cable_6mm', 'Cable 6mm² c/100m (u)', 'u', 162489, 'Eléctrica', true, 3),
  -- Calefacción
  ('mat_tubo_sigas_piso', 'Caño Sigas thermofusión 20mm x 4m (u)', 'u', 25428, 'Calefacción', true, 1),
  ('mat_poliestireno_2cm', 'Poliestireno expandido 2cm 20kg/m³ (m²)', 'm²', 4882, 'Calefacción', true, 2)
ON CONFLICT (id) DO UPDATE SET 
  precio=EXCLUDED.precio, 
  label=EXCLUDED.label,
  categoria=EXCLUDED.categoria,
  updated_at=now();

SELECT categoria, count(*) FROM materiales_obra WHERE activo=true GROUP BY categoria ORDER BY categoria;
