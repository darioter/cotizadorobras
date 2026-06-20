-- ============================================================
-- SCHEMA OBRA ESTIMATOR — Ejecutar en Supabase SQL Editor
-- Tablas separadas de stand-estimator
-- ============================================================

-- Tabla de proyectos de obra
create table if not exists proyectos_obra (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  cliente text,
  brief_texto text,
  superficie_m2 numeric,
  resultado jsonb,
  estado text default 'borrador',
  created_by uuid references profiles(id),
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table proyectos_obra enable row level security;

drop policy if exists "proyectos_obra_select" on proyectos_obra;
drop policy if exists "proyectos_obra_all" on proyectos_obra;
create policy "proyectos_obra_select" on proyectos_obra for select to authenticated using (true);
create policy "proyectos_obra_all" on proyectos_obra for all to authenticated using (true) with check (true);

-- Tabla de catálogo de obra
create table if not exists catalogo_obra (
  id text primary key,
  rubro text not null,
  label text not null,
  unit text default 'u',
  precio numeric(12,2) default 0,
  activo boolean default true,
  orden integer default 0,
  updated_by uuid references profiles(id),
  updated_at timestamptz default now(),
  created_at timestamptz default now()
);

alter table catalogo_obra enable row level security;

drop policy if exists "catalogo_obra_select" on catalogo_obra;
drop policy if exists "catalogo_obra_insert" on catalogo_obra;
drop policy if exists "catalogo_obra_update" on catalogo_obra;
drop policy if exists "catalogo_obra_delete" on catalogo_obra;
create policy "catalogo_obra_select" on catalogo_obra for select to authenticated using (true);
create policy "catalogo_obra_insert" on catalogo_obra for insert to authenticated with check (true);
create policy "catalogo_obra_update" on catalogo_obra for update to authenticated using (true) with check (true);
create policy "catalogo_obra_delete" on catalogo_obra for delete to authenticated using (true);

create index if not exists catalogo_obra_rubro_idx on catalogo_obra(rubro, orden);

-- Tabla config para obra (parámetros financieros separados)
create table if not exists config_obra (
  key text primary key,
  value text,
  updated_by uuid references profiles(id),
  updated_at timestamptz default now()
);

alter table config_obra enable row level security;
create policy "config_obra_all" on config_obra for all to authenticated using (true) with check (true);

-- Verificar
select 'proyectos_obra' as tabla, count(*) from proyectos_obra
union all
select 'catalogo_obra', count(*) from catalogo_obra
union all
select 'config_obra', count(*) from config_obra;
