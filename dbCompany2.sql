USE company_database;

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES 
('John', 'M', 'Doe', '123456789', '1990-01-15', '123 Main St', 'M', 50000.00, NULL, 1),
('Jane', 'D', 'Smith', '987654321', '1992-05-20', '456 Elm St', 'F', 60000.00, '123456789', 2);

select * from employee;

INSERT INTO department (Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES 
('Sales', 1, '123456789', '2010-01-01'),
('Marketing', 2, '987654321', '2015-03-15');

select * from department;

INSERT INTO dept_locations (Dnumber, Dlocation) VALUES 
(1, 'New York'),
(2, 'Los Angeles');

select * from dept_locations;

INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES 
('Project A', 1, 'New York', 1),
('Project B', 2, 'Los Angeles', 2);

select * from project;

INSERT INTO works_on (Essn, Pno, Hours) VALUES 
('123456789', 1, 40),
('987654321', 2, 35);

select * from works_on;

INSERT INTO dependent (Dessn, Dependent_name, Sex, Bdate, Relationship) VALUES 
('123456789', 'Mary Doe', 'F', '2010-02-28', 'Daughter'),
('987654321', 'John Smith Jr', 'M', '2012-07-15', 'Son');

select * from dependent;