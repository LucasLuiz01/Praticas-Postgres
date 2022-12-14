SELECT * FROM courses ;
SELECT * FROM users ;
/*id = 30;
status = "finished"
Education indica o UserId que tem que ser 30; o status tem que ser finished; dai relacionar o schoolId com school.name */
SELECT tcurso.id, users.name AS name, courses.name  AS course, schools.name AS school, educations."endDate"  FROM educations JOIN courses tcurso ON educations."courseId" = tcurso.id JOIN users ON  educations."userId" = users.id JOIN courses ON educations."courseId" = courses.id JOIN schools ON educations."schoolId"=schools.id WHERE educations.status = 'finished' AND users.id = 30;
/* SEMPRE QUANDO TIVER QUE FAZER MAIS DE UM JOIN NA MESMA TABELA UTILIZAR UM APELIDO

