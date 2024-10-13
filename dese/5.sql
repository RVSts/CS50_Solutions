SELECT COUNT("id"), "city" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT("id") 
