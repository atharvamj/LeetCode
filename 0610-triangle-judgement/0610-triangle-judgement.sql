
select x,y,z ,
CASE 
WHEN x>0 and y>0 and Z>0 THEN
    CASE
    WHEN x+y>z and x+z>y and y+z>x THEN 'Yes'
    ELSE 'No'
    END
WHEN x<0 and y<0 and z<0 THEN
    CASE
    WHEN x+y>z THEN 'No'
    ELSE 'Yes'
    END 
    -- WHEN x+z>y THEN 'Yes'
    -- WHEN y+z>x THEN 'Yes'

END AS triangle
FROM Triangle;