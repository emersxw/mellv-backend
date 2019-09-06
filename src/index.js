import "@babel/polyfill";
import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';

const app = express();

app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb', extended: true, parameterLimit: 50000}));
app.use(cors());

// app.use('/auth', auth);
// app.use('/projects', authMiddleware, routes);
// app.use('/api', authMiddleware, apiRoutes);

app.get('/', (req, res) => {
  console.log(req.body);
  res.json({message: 'hello world :)!'});
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