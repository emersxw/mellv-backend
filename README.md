# MellV backend

### requirimentos

1 - node

2 - npm

3 - postgreSQL

### Iniciando o projeto

1 - `npm install`

2 - acesse o postgre no terminal como root `psql postgres`

3 - lista de comandos 

\q | Exit psql connection

\c | Connect to a new database

\dt | List all tables

\du | List all roles

\list | List databases

4 - crie um novo usuario `CREATE ROLE mellv WITH LOGIN PASSWORD 'password';` 

5 - de permissão a mellv `ALTER ROLE mellv CREATEDB;`

6 - `\du` deve mostrar todos os usuarios e permiss˜øes 

7 - saia do shell `\q`

8 - conecte-se com o novo usuario `psql -d postgres -U mellv`

9 - ... pode comecar a usar os comandos do postgre

10 - `CREATE DATABASE mellv_users;`

11 - `\list`

12 - `\c mellv_users`

13 - `CREATE TABLE users (
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30),
  email VARCHAR(30)
);`

14 - `INSERT INTO users (name, email)
  VALUES ('Jerry', 'jerry@example.com'), ('George', 'george@example.com');`

15 - `SELECT * FROM users;`

16 - ... e por ai vai
