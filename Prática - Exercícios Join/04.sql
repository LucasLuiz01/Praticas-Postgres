SELECT * FROM companies ;
SELECT * FROM roles ;
/*ENDDATE da Tabela Experiences tem que ser NULL e o usario.id = 50 */
SELECT tcompanies.id, users.name AS name, roles.name AS role, companies.name AS company, experiences."startDate" FROM experiences JOIN companies tcompanies ON tcompanies.id = experiences."companyId" JOIN users ON experiences."userId" = users.id JOIN roles ON experiences."roleId" = roles.id JOIN companies ON experiences."companyId" = companies.id WHERE experiences."endDate" IS NULL AND users.id = 50 ;

