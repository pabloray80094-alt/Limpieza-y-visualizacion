create database Cafeteria;
use Cafeteria;

select * 
from sales;


-- Revisar si hay datos repetidos

select transaction_id, count(*) as Duplicados
from sales
group by transaction_id
HAVING COUNT(*) > 1;

-- manejo de registros "error" y vacios a nulos -- 
UPDATE sales 
SET Price_Per_Unit = NULL 
WHERE Price_Per_Unit NOT REGEXP '^[0-9]+$';
UPDATE sales
	SET Payment_Method = NULL WHERE Payment_Method = 'ERROR'
    or payment_method = "UNKNONWN"
    or paymenth_method = "";
UPDATE sales
	SET Location = NULL WHERE Location = 'ERROR'
    or Location = "UNKNONWN"
    or Location = "";
UPDATE sales 
	SET Transaction_Date = NULL WHERE Transaction_Date = 'ERROR' 
    OR Transaction_Date = '' 
    or transaction_date = "UNKNOWN";
update sales set item = null where item = "ERROR"
    OR  item = '' 
    or item = "UNKNOWN";


-- recalcular valores vacios numericos -- 
update sales 
set Total_spent = quantity * price_Per_Unit
where total_spent is null;

-- Cambiar nulos a sin especificar --
UPDATE sales SET Item ='Sin especificar'  WHERE Item is null;
UPDATE sales SET Payment_Method = 'Sin especificar'  WHERE Payment_Method is null;
UPDATE sales SET Location = 'Sin especificar'  WHERE Location is null;
update sales set transaction_date = "Sin especificar" where transaction_date is null;

-- Estandarizar las fechas -- 
UPDATE sales 
SET Transaction_Date = STR_TO_DATE(Transaction_Date, '%d/%m/%Y')
WHERE Transaction_Date IS NOT NULL;


