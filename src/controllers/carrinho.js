import express from 'express';
import database from '../database';

const router = express.Router();

router.get('/', async (request, response) => {
  try {
    const { rows } = await database.query('SELECT * FROM carrinho');

    if (!rows.length) {
      return response.status(404).json({ msg: 'not carrinho found' });
    }

    console.log('====================================');
    console.log('rows salvos -> ', rows);
    console.log('====================================');

    return response.status(200).json(rows);
  } catch (error) {
    console.log('====================================');
    console.log(error);
    console.log('====================================');
    return response
      .status(500)
      .json({ msg: 'internal server error', error });
  }
  // nothing else runs ...
});

// CREATE TABLE products (ID SERIAL PRIMARY KEY, product_name VARCHAR(100), product_type INTEGER, price NUMERIC(15,6), size VARCHAR(50), product_description VARCHAR(5000), product_image VARCHAR(500));

router.post('/', async (request, response) => {
  try {
    const { usuario_id, produtos } = request.body;

    // ('{"(408)-589-5842","(408)-589-58423"}');

    console.log('====================================');
    console.log(produtos);
    console.log('====================================');

    await database.query(
      'INSERT INTO carrinho (usuario_id, pedidos_id) VALUES ($1, $2)',
      [usuario_id, produtos],
    );

    return response
      .status(201)
      .json({ status: 'success', message: 'carrinho created' });
  } catch (error) {
    console.log('====================================');
    console.log(error);
    console.log('====================================');
    return response
      .status(500)
      .json({ msg: 'isso derruba um banco', error });
  }
});

router.put('/:id', async (request, response) => {
  try {
    const { id } = request.params;
    const {
      product_name,
      product_type,
      price,
      size,
      product_description,
      product_image,
    } = request.body;

    await database.query(
      'UPDATE products SET product_name = $1, product_type = $2, price = $3,  size = $4, product_description = $5, product_image = $6 WHERE id = $7',
      [
        product_name,
        product_type,
        price,
        size,
        product_description,
        product_image,
        id,
      ],
    );

    return response.status(200).send({ img: '' });
  } catch (error) {
    return response
      .status(500)
      .send({ msg: 'internal server error' });
  }
});

router.get('/:id', async (request, response) => {
  const { id } = request.params;
  const { rows } = await database.query(
    'SELECT * FROM products WHERE id = $1',
    [id],
  );
  return response.status(200).json({ product: rows[0] });
});

router.delete('/:id', async (request, response) => {
  const { id } = request.params;
  await database.query('DELETE FROM products WHERE id = $1', [id]);
  return response.status(200).send({ msg: 'user deleted' });
});

export default router;
