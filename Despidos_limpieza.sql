--  data cleaning

select * 
from layoffs;

-- 1. Eliminar Duplicados
-- 2. Estandalizar Datos 
-- 3. Valores en blanco
-- 4. Eliminar Columnas

Create Table despidos_sinPreparacion
    like layoffs;

select *
from despidos_sinpreparacion
;

Insert despidos_sinPreparacion
select * 
from layoffs;

select *,
row_number () over( partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from despidos_sinpreparacion;

with dulicados_CTE AS
(
select *,
row_number () over( partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from despidos_sinpreparacion
)
SELECT *
from dulicados_CTE
where row_num > 1;

select *
from despidos_sinpreparacion2
where company = "casper" ;


Create Table despidos_sinPreparacion2
like layoffs;

alter table despidos_sinpreparacion2 add column row_num int;

select *
from despidos_sinpreparacion2;


insert into despidos_sinpreparacion2
select *,
row_number () over( partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from despidos_sinpreparacion;

set sql_safe_updates = 0;

delete
from despidos_sinpreparacion2
where row_num >1;

select *
from despidos_sinpreparacion2
where row_num >1;

-- estandarizacion

select *
from despidos_sinpreparacion2;

select company, (trim(company))
from despidos_sinpreparacion2;

update despidos_sinpreparacion2
set company = trim(company);

select *
from despidos_sinpreparacion2
where industry like "crypto%";

update despidos_sinpreparacion2
set industry = "cripto%"
where industry like "cripto";

select distinct countrdespidos_sinpreparacion2y, trim(trailing "." from country)
from despidos_sinpreparacion2
order by 1;

update despidos_sinpreparacion2
set country = trim(trailing "." from country)
where country like "united states%";

select `date`,
str_to_date(`date`, "%m/%d/%Y")
from despidos_sinpreparacion2;

update despidos_sinpreparacion2
set `date` = str_to_date(`date`, "%m/%d/%Y");

select *
from despidos_sinpreparacion2;

alter table despidos_sinpreparacion2
modify column `date` DATE;


SELECT distinct company
from despidos_sinpreparacion2;

select *
from despidos_sinpreparacion2
where company is null
or industry= "";

select *
from despidos_sinpreparacion2
where company like "bally%";


select t1.industry, t2.industry
from despidos_sinpreparacion2 t1
join despidos_sinpreparacion2 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry ="")
and t2.industry is not null;

update despidos_sinpreparacion2 t1
join despidos_sinpreparacion2 t2
	on t1.company = t2.company
set t1.industry=t2.industry
where t1.industry is null
and t2.industry is not null;

update despidos_sinpreparacion2
set industry = null
where industry = "";

select *
from despidos_sinpreparacion2
where total_laid_off is null
and percentage_laid_off is null;

delete 
from despidos_sinpreparacion2
where total_laid_off is null
and percentage_laid_off is null;

select *
from despidos_sinpreparacion2;

alter table despidos_sinpreparacion2
drop column row_num;






