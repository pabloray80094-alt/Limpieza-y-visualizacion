create database credit_card;
use credit_card;

select *
from registros;

-- transformacion de datos, estandarizacion
ALTER TABLE registros MODIFY COLUMN gender VARCHAR(20);

UPDATE registros 
SET gender = CASE 
    when TRIM(gender) = '1' then 'Hombre'
    when TRIM(gender) = '0' then 'Mujer'
    else gender
END;

ALTER TABLE registros MODIFY COLUMN Married VARCHAR(20);

UPDATE registros 
set Married = case 
	when trim(Married) = "1" then "Casado"
	when trim(Married) = "0" then "Soltero"
    else "Otro"
END;

ALTER TABLE registros MODIFY COLUMN BankCustomer VARCHAR(20);

UPDATE registros 
set BankCustomer = case 
	when trim(BankCustomer) = "1" then "Si"
	when trim(BankCustomer) = "0" then "No"
    else "Otro"
END;

ALTER TABLE registros MODIFY COLUMN PriorDefault VARCHAR(20);

UPDATE registros 
set PriorDefault = case 
	when trim(PriorDefault) = "1" then "Si"
	when trim(PriorDefault) = "0" then "No"
    else "Otro"
END;

ALTER TABLE registros MODIFY COLUMN Employed VARCHAR(20);

UPDATE registros 
set Employed = case 
	when trim(Employed) = "1" then "Si"
	when trim(Employed) = "0" then "No"
    else "Otro"
END;

ALTER TABLE registros MODIFY COLUMN DriversLicense VARCHAR(20);

UPDATE registros 
set DriversLicense = case 
	when trim(DriversLicense) = "1" then "Si"
	when trim(DriversLicense) = "0" then "No"
    else "Otro"
END;

ALTER TABLE registros MODIFY COLUMN Approved VARCHAR(20);

UPDATE registros 
set Approved = case 
	when trim(Approved) = "1" then "Si"
	when trim(Approved) = "0" then "No"
    else "Otro"
END;
