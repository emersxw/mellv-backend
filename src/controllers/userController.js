import express from 'express';
import database from '../database';

const router = express.Router();

router.get('/', async (request, response) => {
  const { rows } = await database.query('SELECT * FROM users');

  response.status(200).json(rows);
});

router.post('/', async (request, response) => {
  const { name, email } = request.body

  await database.query('INSERT INTO users (name, email) VALUES ($1, $2)', [name, email]);

  response.status(201).json({status: 'success', message: 'book created'})
});

export default router;