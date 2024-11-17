CREATE INDEX "student_index" ON "students"("id");

CREATE INDEX "course_dep_num_sem_index" ON "courses"("department", "number", "semester");

CREATE INDEX "course_semester_index" ON "courses"("semester");

CREATE INDEX "satisfies_course_index" ON "satisfies"("course_id");

CREATE INDEX "enrollment_student_index" ON "enrollments"("student_id");
