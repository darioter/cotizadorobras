-- NUEVOS MATERIALES DE PINTURA — herramientas y consumibles
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
  ('mat_fijador_ext_lt', 'Fijador exterior (lt) (u)', 'lt', 3800, 'Pinturas', true, 111)
ON CONFLICT (id) DO UPDATE SET precio=EXCLUDED.precio, label=EXCLUDED.label, updated_at=now();