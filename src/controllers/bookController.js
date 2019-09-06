import express from 'express';
import database from '../database';

const router = express.Router();

router.get('/', async (request, response) => {
  const { rows } = await database.query('SELECT * FROM books');

  response.status(200).json(rows);
});

router.post('/', async (request, response) => {
  const { author, title } = request.body

  await database.query('INSERT INTO books (author, title) VALUES ($1, $2)', [author, title]);

  response.status(201).json({status: 'success', message: 'book created'})
});

export default router;