import express from 'express';
import database from '../database';

const router = express.Router();

router.get('/', async (request, response) => {
  try {
    const { rows } = await database.query('SELECT * FROM users');
    // const data = await database.query('SELECT * FROM users');

    if (!rows.length) {
      return response.status(404).json({ msg: 'not users found' });
    }

    return response.status(200).json(rows);
  } catch (error) {
    return response
      .status(500)
      .json({ msg: 'internal server error' });
  }
  // nothing else runs ...
});

router.post('/', async (request, response) => {
  try {
    const { name, email } = request.body;

    await database.query(
      'INSERT INTO users (name, email) VALUES ($1, $2)',
      [name, email],
    );

    return response
      .status(201)
      .json({ status: 'success', message: 'book created' });
  } catch (error) {
    return response
      .status(500)
      .json({ msg: 'isso derruba um banco' });
  }
});

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
