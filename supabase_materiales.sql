-- ============================================================
-- TABLA MATERIALES OBRA — precios de materiales
-- Ejecutar en Supabase SQL Editor
-- ============================================================

create table if not exists materiales_obra (
  id text primary key,
  label text not null,
  unit text default 'u',
  precio numeric(12,2) default 0,
  categoria text,
  activo boolean default true,
  orden integer default 0,
  updated_by uuid references profiles(id),
  updated_at timestamptz default now()
);

alter table materiales_obra enable row level security;
drop policy if exists "materiales_obra_select" on materiales_obra;
drop policy if exists "materiales_obra_all" on materiales_obra;
create policy "materiales_obra_select" on materiales_obra for select to authenticated using (true);
create policy "materiales_obra_all" on materiales_obra for all to authenticated using (true) with check (true);

-- Insertar materiales con precios de referencia mayo 2026
INSERT INTO materiales_obra (id, label, unit, precio, categoria, activo, orden) VALUES
-- Hormigón y cemento
('mat_horm_h21','Hormigón H-21 (elaborado)','m³',95000,'Hormigón',true,1),
('mat_horm_h8','Hormigón pobre H-8 (elaborado)','m³',72000,'Hormigón',true,2),
('mat_cemento','Cemento portland 50kg','u',8200,'Hormigón',true,3),
('mat_cal_hid','Cal hidratada 25kg','u',3800,'Hormigón',true,4),
('mat_cal_fina','Cal fina aérea 25kg','u',4200,'Hormigón',true,5),
('mat_arena_fina','Arena fina (m³)','m³',28000,'Hormigón',true,6),
('mat_arena_gruesa','Arena gruesa (m³)','m³',22000,'Hormigón',true,7),
('mat_cascote','Cascote partido (m³)','m³',18000,'Hormigón',true,8),
-- Hierro
('mat_hierro_8','Hierro Ø8mm (kg)','kg',1850,'Hierro',true,10),
('mat_hierro_10','Hierro Ø10mm (kg)','kg',1900,'Hierro',true,11),
('mat_hierro_12','Hierro Ø12mm (kg)','kg',1920,'Hierro',true,12),
('mat_hierro_16','Hierro Ø16mm (kg)','kg',1950,'Hierro',true,13),
('mat_malla_q188','Malla de acero Q188 (m²)','m²',4200,'Hierro',true,14),
('mat_alambre_rec','Alambre recocido 1.2mm (kg)','kg',2100,'Hierro',true,15),
-- Encofrado
('mat_fenolico','Fenólico 18mm (m²)','m²',12000,'Encofrado',true,20),
('mat_puntal','Puntal metálico (u)','u',3500,'Encofrado',true,21),
('mat_tabla_enc','Tabla encofrado 1"x10" (ml)','ml',900,'Encofrado',true,22),
-- Mampostería
('mat_lad_comun','Ladrillo común (u)','u',250,'Mampostería',true,30),
('mat_lad_hueco_8','Ladrillo hueco 8x18x33 (u)','u',280,'Mampostería',true,31),
('mat_lad_hueco_12','Ladrillo hueco 12x18x33 (u)','u',320,'Mampostería',true,32),
('mat_bloque_20','Bloque hormigón 20x20x40 (u)','u',450,'Mampostería',true,33),
('mat_bloque_10','Bloque hormigón 10x20x40 (u)','u',320,'Mampostería',true,34),
('mat_lad_cer_portante','Ladrillo cerámico portante 12x19x33 (u)','u',380,'Mampostería',true,35),
-- Durlock
('mat_placa_st','Placa Durlock ST 12.5mm (m²)','m²',3200,'Durlock',true,40),
('mat_placa_verde','Placa Durlock RH verde (m²)','m²',4100,'Durlock',true,41),
('mat_montante_70','Montante 70mm 3m (u)','u',1800,'Durlock',true,42),
('mat_solera_70','Solera 70mm 3m (u)','u',1600,'Durlock',true,43),
('mat_omega_60','Perfil omega 60mm 3m (u)','u',1400,'Durlock',true,44),
('mat_tornillos_aguja','Tornillos punta aguja x500 (cja)','u',2800,'Durlock',true,45),
('mat_masilla_30','Masilla Durlock 30kg (balde)','u',4200,'Durlock',true,46),
('mat_cinta_papel','Cinta papel kraft 50m (u)','u',800,'Durlock',true,47),
('mat_varilla_rosca','Varilla roscada 3/8" (ml)','ml',650,'Durlock',true,48),
-- Membrana y aislación
('mat_membrana_4','Membrana asfáltica 4mm (m²)','m²',4800,'Membranas',true,50),
('mat_imprimante','Imprimante asfáltico (lt)','lt',1200,'Membranas',true,51),
('mat_film_poli','Film polietileno 150µ (m²)','m²',280,'Membranas',true,52),
('mat_imper_fib','Impermeabilizante fibrado (lt)','lt',2800,'Membranas',true,53),
-- Cubiertas
('mat_chapa_n24','Chapa ondulada N24 (m²)','m²',6200,'Cubiertas',true,60),
('mat_chapa_prep','Chapa prepintada (m²)','m²',8400,'Cubiertas',true,61),
('mat_torn_autop','Tornillos autoperforantes (u)','u',120,'Cubiertas',true,62),
('mat_burlete','Burletes de sellado (ml)','ml',450,'Cubiertas',true,63),
-- Revoques
('mat_rev_proyec','Revoque proyectable seco (kg)','kg',320,'Revoques',true,70),
('mat_hidrofugo','Hidrófugo líquido (lt)','lt',1800,'Revoques',true,71),
('mat_yeso_proyec','Yeso proyectable (kg)','kg',280,'Revoques',true,72),
-- Cerámicos y pisos
('mat_cer_20x20','Cerámico 20x20 (m²)','m²',4800,'Cerámicos',true,80),
('mat_cer_30x30','Cerámico esmaltado 30x30 (m²)','m²',5200,'Cerámicos',true,81),
('mat_porc_30x30','Porcellanato 30x30 (m²)','m²',8500,'Cerámicos',true,82),
('mat_mosaic_gran','Mosaico granítico 30x30 (m²)','m²',12000,'Cerámicos',true,83),
('mat_adhesivo_cer','Adhesivo cerámico (kg)','kg',380,'Cerámicos',true,84),
('mat_adhesivo_flex','Adhesivo flexible (kg)','kg',480,'Cerámicos',true,85),
('mat_junta_cer','Junta cerámica (kg)','kg',620,'Cerámicos',true,86),
('mat_junta_porc','Junta porcellanato (kg)','kg',680,'Cerámicos',true,87),
('mat_crucetas_2','Crucetas 2mm (u)','u',8,'Cerámicos',true,88),
('mat_crucetas_3','Crucetas 3mm (u)','u',8,'Cerámicos',true,89),
-- Parquet
('mat_parquet_euc','Parquet eucaliptus (m²)','m²',18000,'Pisos madera',true,90),
('mat_adhesivo_epoxi','Adhesivo epoxi bicomponente (kg)','kg',4200,'Pisos madera',true,91),
('mat_plastif_pu','Plastificante poliuretánico (lt)','lt',3800,'Pisos madera',true,92),
('mat_lija_80','Lija para madera N°80 (u)','u',450,'Pisos madera',true,93),
('mat_lija_120','Lija para madera N°120 (u)','u',480,'Pisos madera',true,94),
-- Pintura
('mat_latex_int','Látex interior 1ª marca (lt)','lt',2800,'Pintura',true,100),
('mat_latex_ext','Látex exterior 1ª marca (lt)','lt',3200,'Pintura',true,101),
('mat_fijador_agua','Fijador al agua (lt)','lt',1800,'Pintura',true,102),
('mat_fijador_ext','Fijador exterior (lt)','lt',2200,'Pintura',true,103),
('mat_enduid_plas','Enduído plástico (kg)','kg',1200,'Pintura',true,104),
('mat_enduid_ext','Enduído exterior (kg)','kg',1400,'Pintura',true,105),
('mat_rodillo_ciel','Rodillo para cielo raso (u)','u',3500,'Pintura',true,106),
('mat_pincel_4','Pincel de 4" (u)','u',1200,'Pintura',true,107),
('mat_sellad_asf','Sellador asfáltico (lt)','lt',2400,'Pintura',true,108),
-- Sanitaria
('mat_inodoro','Inodoro (u)','u',85000,'Sanitaria',true,110),
('mat_bidet','Bidet (u)','u',55000,'Sanitaria',true,111),
('mat_vanitory','Vanitory (u)','u',75000,'Sanitaria',true,112),
('mat_griferia_bano','Grifería monocomando baño (u)','u',45000,'Sanitaria',true,113),
('mat_ducha','Ducha (u)','u',35000,'Sanitaria',true,114),
('mat_pileta_coc','Pileta cocina (u)','u',42000,'Sanitaria',true,115),
('mat_griferia_coc','Grifería monocomando cocina (u)','u',38000,'Sanitaria',true,116),
('mat_pileta_lav','Pileta lavadero (u)','u',28000,'Sanitaria',true,117),
('mat_can_pvc_110','Cañería PVC 110mm (ml)','ml',2800,'Sanitaria',true,118),
('mat_can_pvc_63','Cañería PVC 63mm (ml)','ml',1800,'Sanitaria',true,119),
('mat_can_poliprop','Cañería polipropileno 20mm (ml)','ml',1200,'Sanitaria',true,120),
('mat_pegamento_pvc','Pegamento PVC (u)','u',2400,'Sanitaria',true,121),
-- Eléctrica
('mat_cable_2_5','Cable 2.5mm² (ml)','ml',850,'Eléctrica',true,130),
('mat_cable_4','Cable 4mm² (ml)','ml',1200,'Eléctrica',true,131),
('mat_cano_corr_34','Caño corrugado 3/4" (ml)','ml',380,'Eléctrica',true,132),
('mat_cano_corr_1','Caño corrugado 1" (ml)','ml',520,'Eléctrica',true,133),
('mat_caja_paso','Caja de paso 10x10 (u)','u',650,'Eléctrica',true,134),
('mat_toma_schuko','Toma corriente schuko (u)','u',2800,'Eléctrica',true,135),
('mat_bornera','Bornera conexión (u)','u',180,'Eléctrica',true,136),
-- Piso radiante
('mat_tubo_pex','Tubo pex 16mm (ml)','ml',950,'Calefacción',true,140),
('mat_clips_pr','Clips sujeción piso radiante (u)','u',45,'Calefacción',true,141),
('mat_malla_pr','Malla metálica piso radiante (m²)','m²',2800,'Calefacción',true,142),
('mat_mortero_auto','Mortero autonivelante (kg)','kg',420,'Calefacción',true,143),
-- Varios
('mat_volquete','Volquete 4m³ (u)','u',45000,'Varios',true,150),
('mat_bolsa_cons','Bolsas de consorcio 240L (u)','u',180,'Varios',true,151),
('mat_silicona','Silicona neutra (u)','u',2800,'Varios',true,152),
('mat_soporte_mes','Soporte mesada (u)','u',1200,'Varios',true,153),
('mat_liston_2x2','Listones de madera 2x2" (ml)','ml',1800,'Varios',true,154),
('mat_clavo_2','Clavos 2" (kg)','kg',1200,'Varios',true,155)
ON CONFLICT (id) DO UPDATE SET label=EXCLUDED.label, precio=EXCLUDED.precio, updated_at=now();

-- Verificar
SELECT categoria, count(*) as materiales FROM materiales_obra WHERE activo=true GROUP BY categoria ORDER BY categoria;
