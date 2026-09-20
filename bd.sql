CREATE TABLE Readers (
    id_read INT PRIMARY KEY,
    name VARCHAR(100),
    phone INT
);

CREATE TABLE Books (
    id_bk INT PRIMARY KEY,
    since VARCHAR(4),
    name VARCHAR(200)
);

CREATE TABLE Authors (
    id_auth INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Books_authors (
    id_bk INT,
    id_auth INT,

    PRIMARY KEY (id_bk, id_auth),

    FOREIGN KEY (id_bk) REFERENCES Books(id_bk),
    FOREIGN KEY (id_auth) REFERENCES Authors(id_auth)
);

CREATE TABLE Takes (
    id_take INT PRIMARY KEY,
    id_read INT,
    id_bk INT,
    date_of_issue VARCHAR(8),
    return_date VARCHAR(8),
    issuance_timeframe INT,

    FOREIGN KEY (id_read) REFERENCES Readers(id_read),
    FOREIGN KEY (id_bk) REFERENCES Books(id_bk)
);