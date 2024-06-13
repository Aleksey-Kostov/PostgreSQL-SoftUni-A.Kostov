UPDATE cars
SET condition = 'C'
WHERE (mileage >= 800000 or mileage is NULL) 
and "year" <= 2010 
and make <> 'Mercedes-Benz';
