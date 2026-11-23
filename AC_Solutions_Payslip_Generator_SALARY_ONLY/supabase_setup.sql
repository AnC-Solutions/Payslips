-- Run in Supabase Dashboard > SQL Editor. Requires Supabase Auth email/password.
create table if not exists public.employees (
 user_id uuid not null references auth.users(id) on delete cascade,
 employee_id text not null,
 data jsonb not null,
 updated_at timestamptz not null default now(),
 primary key (user_id, employee_id)
);
create table if not exists public.payroll (
 user_id uuid not null references auth.users(id) on delete cascade,
 employee_id text not null,
 pay_month text not null check (pay_month ~ '^[0-9]{4}-[0-9]{2}$'),
 data jsonb not null,
 updated_at timestamptz not null default now(),
 primary key (user_id, employee_id, pay_month)
);
create index if not exists payroll_user_month_idx on public.payroll(user_id, pay_month);
alter table public.employees enable row level security;
alter table public.payroll enable row level security;
create policy "employees_self_select" on public.employees for select to authenticated using ((select auth.uid()) = user_id);
create policy "employees_self_insert" on public.employees for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "employees_self_update" on public.employees for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "payroll_self_select" on public.payroll for select to authenticated using ((select auth.uid()) = user_id);
create policy "payroll_self_insert" on public.payroll for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "payroll_self_update" on public.payroll for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
