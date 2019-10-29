import '@babel/polyfill';
import express from 'express';
import cors from 'cors';
import 'dotenv/config';

const app = express();

app.use(express.json({ limit: '50mb' }));
app.use(
  express.urlencoded({
    limit: '50mb',
    extended: true,
    parameterLimit: 50000,
  }),
);
app.use(cors());

import authMiddleware from './middlewares/auth';
import userRoutes from './controllers/user';
import products from './controllers/product';
import pedidos from './controllers/pedidos';
import carrinho from './controllers/carrinho';

app.use('/api/user', userRoutes);
app.use('/api/product', products);
app.use('/api/pedidos', pedidos);
app.use('/api/carrinho', carrinho);

// example of a protected route
app.get('/secret', authMiddleware, (req, res) => {
  console.log('====================================');
  console.log(req.userId);
  console.log('====================================');
  res.send({
    message: 'nice ;)',
    cpf: req.userId,
  });
});

const port = process.env.PORT || 5000;
app.listen(port, () => console.log('magic happens on port ' + port));
