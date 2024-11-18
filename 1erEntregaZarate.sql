DROP DATABASE IF EXISTS PlataformaVideojuegos;
CREATE DATABASE PlataformaVideojuegos;

USE PlataformaVideojuegos;

CREATE TABLE PlataformaVideojuegos.Desarrolladores (
    desarrolladorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombreDesarrollador VARCHAR(100)
);


CREATE TABLE PlataformaVideojuegos.Videojuegos (
    juegoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    desarrolladorID INT,
    fechaLanzamiento DATE,
    precio DECIMAL(10, 2),
    FOREIGN KEY (desarrolladorID) REFERENCES desarrolladores(desarrolladorID)
);

CREATE TABLE PlataformaVideojuegos.Usuarios (
    userID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    Password VARCHAR(100)
);

CREATE TABLE PlataformaVideojuegos.Ventas (
    ventasID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    juegoID INT,
    fechaCompra DATE,
    precioCompra DECIMAL(10, 2),
    tipo_de_pago ENUM('DEBITO','CRYPTOMONEDA','CREDITO'),
    FOREIGN KEY (userID) REFERENCES Usuarios(userID),
    FOREIGN KEY (juegoID) REFERENCES Videojuegos(juegoID)
);

CREATE TABLE PlataformaVideojuegos.Reseña (
    reseñaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    juegoID INT,
    calificacion INT,
    comentario TEXT,
    FOREIGN KEY (userID) REFERENCES Usuarios(userID),
    FOREIGN KEY (juegoID) REFERENCES Videojuegos(juegoID)
);

CREATE TABLE PlataformaVideojuegos.Biblioteca (
    bibliotecaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    juegoID INT,
    fecha_de_adicion DATE,
    FOREIGN KEY (userID) REFERENCES Usuarios(userID),
    FOREIGN KEY (juegoID) REFERENCES Videojuegos(juegoID)
);