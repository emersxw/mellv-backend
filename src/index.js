import "@babel/polyfill";
import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import 'dotenv/config';
import morgan from 'morgan';

const app = express();

app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true, parameterLimit: 50000 }));
app.use(cors());

import authMiddleware from './middlewares/auth';
import products from './controllers/product';
import user from './controllers/user';
import auth from './controllers/auth';

app.get('/healthcheck', (req, res) => {
  return res.status(200).json({ message: 'OK' })
})

app.use('/api/user', user);
app.use('/api/auth', auth);

// use the auth middleware here
// products are currently in SQL
app.use('/product', products);

const port = process.env.PORT || 5000;
app.listen(port, () => console.log('Magic happens on port ' + port));
