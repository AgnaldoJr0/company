USE company_database;

SELECT Dname, COUNT(*) AS num_people
FROM employee e
JOIN department d ON e.Dno = d.Dnumber
GROUP BY Dname
ORDER BY num_people DESC
LIMIT 2;

-- Índice utilizado: idx_employee_Dno
-- Tipo de índice: Índice B-tree
-- Motivo da escolha: Pela Eficiência de busca e Ordenação.
CREATE INDEX idx_employee_Dno ON employee(ativo) USING btree;

SELECT Dname, Dlocation
FROM department d
JOIN dept_locations dl ON d.Dnumber = dl.Dnumber;

-- Índice utilizado: idx_dept_locations_Dnumber
-- Tipo de índice: Índice B-tree
-- Motivo da escolha: Pela mesma razão do índice acima mas, também por conta à sua utilização em operações de junção.
CREATE INDEX idx_dept_locations_Dnumber ON dept_locations(ativo) USING btree;

SELECT Dname, COUNT(*) AS num_employees
FROM employee e
JOIN department d ON e.Dno = d.Dnumber
GROUP BY Dname;

-- Índice utilizado: idx_employee_Dno
-- Tipo de índice: Índice B-tree
-- Motivo da escolha: O índice B-tree ajuda a acelerar a busca, aumentando assim a eficiência da pesquisa e acelerando a junção da coluna Dno com a tabela department.
CREATE INDEX idx_employee_Dno ON employee(ativo) USING btree;

DELIMITER \\
CREATE PROCEDURE manipulate_data(
    IN action INT,
    IN employee_id INT,
    IN Fname VARCHAR(50),
    IN Minit CHAR(1),
    IN Lname VARCHAR(50),
    IN Ssn CHAR(9),
    IN Bdate DATE,
    IN Address VARCHAR(100),
    IN Sex CHAR(1),
    IN Salary DECIMAL(10, 2),
    IN Super_ssn CHAR(9),
    IN Dno INT
)
BEGIN
    IF action = 1 THEN
        INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
        VALUES (e_Fname, e_Minit, e_Lname, e_Ssn, e_Bdate, e_Address, e_Sex, e_Salary, e_Super_ssn, e_Dno);
    ELSEIF action = 2 THEN
        UPDATE employee
            SET Fname = Fname, Minit = Minit, Lname = Lname, Ssn = Ssn, Bdate = Bdate,
                Address = Address, Sex = Sex, Salary = Salary, Super_ssn = Super_ssn, Dno = Dno
            WHERE idEmployee = employee_id;
    ELSEIF action = 3 THEN
        DELETE FROM employee WHERE idEmployee = employee_id;
    ELSE
        SELECT 'Invalid action';
    END IF;
END\\
DELIMITER ;

CALL manipulate_data(1, 3, 'Joana', 'M', 'Silva', '555666777', '1990-07-15', 'Rua das Flores, 123', 'F', 55000.00, '351453829', 2);
-- Para INSERT, onde o segundo parâmetro é o ID do funcionário que você deseja inserir

CALL manipulate_data(2, 3, 'Joana', 'M', 'Oliveira', '555666777', '1990-07-15', 'Avenida das Palmeiras, 456', 'F', 60000.00, '123456789', 1);
-- Para UPDATE, onde o segundo parâmetro é o ID do funcionário que você deseja atualizar e os demais parâmetros são os novos valores

CALL manipulate_data(3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Para DELETE, onde o segundo parâmetro é o ID do funcionário que você deseja excluir

show indexes from employee;
show indexes from department;
show indexes from dept_locations;
show indexes from project;
show indexes from works_on;
show indexes from dependent;
