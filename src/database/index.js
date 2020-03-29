import 'dotenv/config';

import mongoose from 'mongoose';

mongoose.connect(
  'mongodb://localhost:27017/mellv-dev',
  { useNewUrlParser: true }
)
  .then(() => console.log('Connected to DB...'))
  .catch(err => console.error(err, 'Could not connect to MongoDB...'));

mongoose.Promise = global.Promise;

export default mongoose;
