import express from 'express';
import database from '../database';

import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

const router = express.Router();

// user model on DB example
// {
//   "cpf": "222.222.222-22",
//   "email": "maria.maria@gmail.com",
//   "nome_completo": "Maria Flores",
//   "data_nasc": "02-02-1999",
//   "genero": "Feminino",
//   "num_telefone": "38-98888-8888",
//   "senha_usuario_cpf": "aaaaaaaaa123",
//   "endereco": "Rua Sao Francisco",
//   "num_endereco": 200,
//   "bairro": "Sol",
//   "cep": "43121-111",
//   "cidade": "Matias",
//   "uf": "SP"
// }

function generateToken(params = {}) {
  return jwt.sign(params, 'secret', {
    expiresIn: '30d',
  });
}

router.get('/', async (request, response) => {
  try {
    const { rows } = await database.query(
      'SELECT * FROM usuario_cad_cpf',
    );
    // const data = await database.query('SELECT * FROM users');

    if (!rows.length) {
      return response.status(404).json({ msg: 'not users found' });
    }

    return response.status(200).json(rows);
  } catch (error) {
    return response
      .status(500)
      .json({ msg: 'internal server error', error });
  }
  // nothing else runs ...
});

router.post('/signup', async (request, response) => {
  try {
    let {
      cpf,
      email,
      nome_completo,
      data_nasc,
      genero,
      num_telefone,
      senha_usuario_cpf,
      endereco,
      num_endereco,
      bairro,
      cep,
      cidade,
      uf,
    } = request.body;

    const hash = await bcrypt.hash(senha_usuario_cpf, 10);
    senha_usuario_cpf = hash;

    await database.query(
      'INSERT INTO usuario_cad_cpf (cpf, email, nome_completo, data_nasc, genero, num_telefone, senha_usuario_cpf, endereco, num_endereco, bairro, cep, cidade, uf) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)',
      [
        cpf,
        email,
        nome_completo,
        data_nasc,
        genero,
        num_telefone,
        senha_usuario_cpf,
        endereco,
        num_endereco,
        bairro,
        cep,
        cidade,
        uf,
      ],
    );

    const { rows } = await database.query(
      'SELECT * FROM usuario_cad_cpf WHERE cpf = $1',
      [cpf],
    );

    rows[0].senha_usuario_cpf = undefined;

    const token = generateToken({ id: cpf });

    return response
      .status(201)
      .json({ status: 'success', user: rows[0], token });
  } catch (error) {
    return response
      .status(500)
      .json({ msg: 'isso derruba um banco', error });
  }
});

router.post('/login', async (request, response) => {
  try {
    const { email, senha_usuario_cpf } = request.body;

    const { rows } = await database.query(
      'SELECT * FROM usuario_cad_cpf WHERE email = $1',
      [email],
    );

    const user = rows[0];

    console.log(user);

    if (
      !(await bcrypt.compare(
        senha_usuario_cpf,
        user.senha_usuario_cpf,
      ))
    ) {
      return response.status(400).send({ error: 'invalid password' });
    }

    user.senha_usuario_cpf = undefined;

    const token = generateToken({ id: user.cpf });

    return response.status(200).send({ status: 'ok', user, token });
  } catch (error) {
    return response.status(500).send({ status: 'ops', error });
  }
});

// these only work for the another database!
router.put('/:id', async (request, response) => {
  try {
    const { id } = request.params;
    const { name, email } = request.body;

    await database.query(
      'UPDATE users SET name = $1, email = $2 WHERE id = $3',
      [name, email, id],
    );

    return response
      .status(200)
      .send({ img: `User modified with ID: ${id}` });
  } catch (error) {
    return response
      .status(500)
      .send({ msg: 'internal server error' });
  }
});

router.delete('/:id', async (request, response) => {
  const { id } = request.params;
  await database.query('DELETE FROM users WHERE id = $1', [id]);
  return response.status(200).send(`User deleted with ID: ${id}`);
});

export default router;
