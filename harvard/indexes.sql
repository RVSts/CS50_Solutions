CREATE INDEX "student_index" ON "students"("id");

DROP INDEX "student_index";

CREATE INDEX "student_2023_index" ON "students"("id")
WHERE 
