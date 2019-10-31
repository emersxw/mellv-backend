import express from 'express';
import database from '../database';
import axios from 'axios';
import mercadopago from 'mercadopago';

const router = express.Router();

mercadopago.configure({
  sandbox: true,
  access_token:
    'TEST-4415076868599036-103013-2a84384cd5d574f4c1d00711111fd15a-484624306',
});

mercadopago.configurations.setAccessToken(
  'TEST-4415076868599036-103013-2a84384cd5d574f4c1d00711111fd15a-484624306',
);

// mercadopago.payment
//   .get(22436854)
//   .then(data => console.log(data))
//   .catch(error => console.log(error));

// mercadopago.payment
//   .cancel(22436854)
//   .then(data => console.log(data))
//   .catch(error => console.log(error));

// mercadopago.payment
//   .refund(22436854)
//   .then(data => console.log(data))
//   .catch(error => console.log(error));

router.post('/', (request, response) => {
  // var payment_data = {
  //   transaction_amount: 135,
  //   token: 'ff8080814c11e237014c1ff593b57b4d'
  //   description: 'Aerodynamic Copper Shoes',
  //   installments: 1,
  //   payment_method_id: 'visa',
  //   payer: {
  //     email: 'aglae@bol.com.br'
  //   }
  // };

  // OS CAMPOS OBRIGATÓRIOS PARA ENVIAR SÃO TOKEN, TRANSACTION_AMOUNT, PAYMENT_METHOD_ID E O PAYER.EMAIL
  // console.log('====================================');
  // console.log(request.body);
  // console.log('====================================');

  const { id, public_key, status, email } = request.body;

  var payment_data = {
    transaction_amount: 135,
    // card token?!??
    token: id,
    // description: 'Aerodynamic Copper Shoes',
    installments: 1,
    // dar um jeito de pegar a bandeira do cartao!
    payment_method_id: 'master',
    payer: {
      email,
    },
  };

  // Save and posting the payment
  mercadopago.payment
    .save(payment_data)
    .then(function(data) {
      // ...
      response.json(data.body.status);
      console.log(data);
    })
    .catch(function(error) {
      console.log(error);
      response.json({ error });

      // ...
    });
});

/*

// exemplo de pedido completo

curl -X POST \
  'https://api.mercadopago.com/v1/payments?access_token=ACCESS_TOKEN_ENV' \
  -d '{
	"token":"b3a7dbec3eb0d71798c4f19fec445795",
	"installments":1,
	"transaction_amount":58.80,
	"description":"Point Mini a maquininha que dá o dinheiro de suas vendas na hora",
	"payment_method_id":"visa",
	"payer":{
	"email":"test_user_123456@testuser.com"

    },
	"notification_url":"https://www.suaurl.com/notificacoes/",
	"sponsor_id":null,
	"binary_mode":false,
	"external_reference":"MP0001",
	"statement_descriptor":"MercadoPago",
	"additional_info":{
	"items":[
		{
			"id":"PR0001",
			"title":"Point Mini",
			"picture_url":"https://http2.mlstatic.com/resources/frontend/statics/growth-sellers-landings/device-mlb-point-i_medium@2x.png",
			"quantity":1,
			"unit_price":58.80
		}
	],
	"payer":{
		"first_name":"Nome",
		"last_name":"Sobrenome",
		"address":{
		"zip_code":"06233-200",
		"street_name":"Av das Nacoes Unidas",
		"street_number":3003
	},
	"registration_date":"2019-01-01T12:01:01.000-03:00",
	"phone":{
	"area_code":"011",
	"number":"987654321"
	}
},
	"shipments":{
	"receiver_address":{
	"street_name":"Av das Nacoes Unidas",
	"street_number":3003,
	"zip_code":"06233200"
	}
   }
  }
}' 

*/

/*

router.post('/', async (request, response) => {
  try {
    const {
      codigo,
      nome,
      preco,
      descricao,
      instrucoes,
      tamanhos,
      tipo,
      foto_url,
    } = request.body;

    await database.query(
      'INSERT INTO produtos (codigo, nome, preco, descricao, instrucoes, tamanhos, tipo, foto_url) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)',
      [
        codigo,
        nome,
        preco,
        descricao,
        instrucoes,
        tamanhos,
        tipo,
        foto_url,
      ],
    );

    return response
      .status(201)
      .json({ status: 'success', message: 'product created' });
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

*/
export default router;
