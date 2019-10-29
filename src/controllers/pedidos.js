import express from 'express';
import database from '../database';

const router = express.Router();

router.get('/', async (request, response) => {
  try {
    const { rows } = await database.query('SELECT * FROM pedidos');

    if (!rows.length) {
      return response.status(404).json({ msg: 'not orders found' });
    }

    console.log('rows salvos -> ', rows);

    return response.status(200).json(rows);
  } catch (error) {
    console.log(error);
    return response
      .status(500)
      .json({ msg: 'internal server error', error });
  }
  // nothing else runs ...
});


router.post('/', async (request, response) => {
  try {
    const {
      usuario_id,
      produto_codigo,
      status_pedido,
    } = request.body;

    await database.query(
      'INSERT INTO pedidos (usuario_id, produto_codigo, status_pedido) VALUES ($1, $2, $3)',
      [usuario_id, produto_codigo, status_pedido],
    );

    return response
      .status(201)
      .json({ status: 'success', message: 'pedido created' });
  } catch (error) {
    console.log(error);
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
