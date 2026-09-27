CREATE TABLE Readers (
    id_read INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Books (
    ISBN VARCHAR(50) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    publication_year INT CHECK (
        publication_year >= 1000
        AND publication_year <= 2100
    )
);

CREATE TABLE Authors (
    id_auth INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Book_Authors (
    ISBN VARCHAR(50),
    id_auth INT,

    PRIMARY KEY (ISBN, id_auth),

    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (id_auth) REFERENCES Authors(id_auth)
);

CREATE TABLE Loans (
    id_loan INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_read INT NOT NULL,
    ISBN VARCHAR(50) NOT NULL,
    issue_date DATE NOT NULL,
    planned_return_date DATE NOT NULL,
    actual_return_date DATE NULL,

    FOREIGN KEY (id_read) REFERENCES Readers(id_read),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),

    CHECK (planned_return_date >= issue_date),
    CHECK (
        actual_return_date IS NULL
        OR actual_return_date >= issue_date
    )
);

INSERT INTO Readers (name, phone)
VALUES
('Анна Петрова', '+7-900-111-22-33'),
('Иван Соколов', '+7-900-222-33-44'),
('Мария Ким', '+7-900-333-44-55'),
('Олег Васильев', '+7-900-444-55-66'),
('Тестовый читатель', '+7-900-555-66-77');

INSERT INTO Books (ISBN, name, publication_year)
VALUES
('978-5-17-118366-8', 'Мастер и Маргарита', 1967),
('978-5-389-06256-6', 'Преступление и наказание', 1866),
('978-5-04-116716-3', 'Война и мир', 1869),
('978-5-699-12014-7', 'Золотой теленок', 1931),
('978-5-389-03713-7', 'Пикник на обочине', 1972);

INSERT INTO Authors (name)
VALUES
('Михаил Булгаков'),
('Федор Достоевский'),
('Лев Толстой'),
('Илья Ильф'),
('Евгений Петров'),
('Аркадий Стругацкий'),
('Борис Стругацкий');

INSERT INTO Book_Authors (ISBN, id_auth)
VALUES
('978-5-17-118366-8', 1),  
('978-5-389-06256-6', 2),  
('978-5-04-116716-3', 3),  
('978-5-699-12014-7', 4),
-- у этой книги два автора 
('978-5-389-03713-7', 6), 
('978-5-389-03713-7', 7);

INSERT INTO Loans
    (id_read, ISBN, issue_date, planned_return_date, actual_return_date)
VALUES
-- Активная выдача Анны
(1, '978-5-17-118366-8', '2026-09-01', '2026-09-15', NULL),
-- Активная выдача Ивана
(2, '978-5-389-06256-6', '2026-09-05', '2026-09-20', NULL),
-- Завершенная выдача Анны
(1, '978-5-04-116716-3', '2026-08-01', '2026-08-15', '2026-08-14'),
-- Завершенная выдача Марии
(3, '978-5-699-12014-7', '2026-08-10', '2026-08-25', '2026-08-23'),
-- Еще одна выдача Анны
(1, '978-5-389-03713-7', '2026-09-10', '2026-09-25', NULL),
-- Еще одна выдача Анны
(1, '978-5-699-12014-7', '2026-08-20', '2026-09-03', '2026-09-02');

-- У Анны Петровой изменился номер телефона
UPDATE Readers
SET phone = '+7-900-999-88-77'
WHERE id_read = 1;

-- Книга была возвращена
UPDATE Loans
SET actual_return_date = '2026-09-14'
WHERE id_loan = 1;

-- Удаляем тестового читателя
DELETE FROM Readers
WHERE id_read = 5;
