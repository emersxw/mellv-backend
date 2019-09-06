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

router.put('/:id', async(request, response) => {
  const { id } = request.params;
  const { name, email } = request.body

  await database.query('UPDATE users SET name = $1, email = $2 WHERE id = $3',
  [name, email, id]);

  response.status(200).send(`User modified with ID: ${id}`)
})

router.delete('/:id', async(request, response) => {
  const { id } = request.params;

  await database.query('DELETE FROM users WHERE id = $1', [id])

  response.status(200).send(`User deleted with ID: ${id}`)

});

export default router;