import "@babel/polyfill";
import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import 'dotenv/config';
import { pool } from './config';

const app = express();

app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb', extended: true, parameterLimit: 50000}));
app.use(cors());

// app.use('/auth', auth);
// app.use('/projects', authMiddleware, routes);
// app.use('/api', authMiddleware, apiRoutes);

console.log(process.env.DB_USER);

app.get('/', (request, response) => {
    pool.query('SELECT * FROM books', (error, results) => {
      if (error) {
        console.log(error);
      }
      response.status(200).json(results.rows)
    })
  console.log(request.body);
})

app.post('/', (request, response) => {
  const { author, title } = request.body
  pool.query('INSERT INTO books (author, title) VALUES ($1, $2)', [author, title], error => {
    if (error) {
      // throw error
      console.log(error);
    }
    response.status(201).json({ status: 'success', message: 'Book added.' })
  })
})

app.listen(5000, () => console.log('magic happens on port 5000'));


// import 'dotenv/config';

// const userCredentials = { firstname: 'Robin' };
// const userDetails = { nationality: 'German' };

// const user = {
//   ...userCredentials,
//   ...userDetails,
// };

// console.log(user);

// console.log(process.env.SOME_ENV_VARIABLE);