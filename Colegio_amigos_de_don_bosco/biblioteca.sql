-- Script para crear tabla usuarios (si se necesita)
CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  usuario VARCHAR(50) NOT NULL UNIQUE,
  contraseña VARCHAR(100) NOT NULL,
  rol ENUM('Administrador','Profesor','Alumno') NOT NULL
);
