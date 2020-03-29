import express from 'express';
import User from '../models/user.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
// import nodemailer from 'nodemailer';

const router = express.Router();

// whats unique about your user model
// and a secret key
function generateToken(params = {}) {
  return jwt.sign(params, 'secret', {
    expiresIn: '30d',
  });
}

router.post('/register', async (req, res) => {
  try {
    const { email } = req.body;

    if (await User.findOne({ email })) {
      return res.status(400).send({ error: 'user already exists' });
    }

    const user = await User.create(req.body);

    // Set to false for testing purposes -- sendgrid free plan has a limit
    // of emails that can be sent
    // if (false) {
    //   // if (false) {
    //   // create reusable transporter object using the default SMTP transport
    //   // This is just a dev email account
    //   let transporter = nodemailer.createTransport({
    //     host: 'smtp.sendgrid.net',
    //     port: 465,
    //     secure: true,
    //     auth: {
    //       user: 'apikey',
    //       pass:
    //         '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',
    //     },
    //   });

    //   // send mail with defined transport object
    //   let info = await transporter.sendMail({
    //     from: '"Ethics Net Team" <ethics.net.dev@gmail.com>', // sender address
    //     to: email, // list of receivers
    //     subject: 'Welcome to Ethics Net ✔', // Subject line
    //     text:
    //       'Welcome to Ethics Net! Now you can start annotating text from the web!', // plain text body
    //     html: `
    //           <p>
    //             Welcome to Ethics Net! Now you can start annotating text from the web!
    //           </p>
    //           <p>
    //             Visit 
    //               <a href="http://extension.lupuselit.me/" target="_blank">
    //                 extension.lupuselit.me
    //               </a>
    //               to get started.
    //           </p>
    //           <p>
    //             Download the 
    //             <a href="https://chrome.google.com/webstore/detail/ethics-net/djamiamgnjcpjhkknjddilkaibbhmhgc" target="_blank">
    //               Chrome extension
    //             </a>.
    //           </p>
    //           `, // html body
    //   });    }

    // so the password doesnt get sent back on the response
    user.password = undefined;

    const token = generateToken({ id: user._id, isAdmin: user.isAdmin });

    // res.send({ user, token });
    return res.status(200).send({ user, token, message: 'Welcome to EthicsNet!' });
  } catch (error) {
    return res.status(400).send({ error: 'registration failed', errorMessage: error.message });
  }
});

router.post('/authenticate', async (req, res) => {
  const { email, password } = req.body;

  const user = await User.findOne({ email })
    .select('password')
    .select('isAdmin');

  if (!user) {
    return res.status(400).send({ error: 'user not found' });
  }

  if (!(await bcrypt.compare(password, user.password))) {
    return res.status(400).send({ error: 'invalid password' });
  }

  const fullUser = await User.findById(user._id);

  if (!fullUser) {
    return res.status(400).send({ error: 'full user not found' });
  }

  fullUser.password = undefined;

  const token = generateToken({ id: user._id, isAdmin: user.isAdmin });
  res.send({ user: fullUser, token, message: 'Welcome back ' + fullUser.firstName });
});

router.get('/email/:email', async (req, res) => {
  // return res.status(200).send({ message: 'Welcome to EthicsNet!' });
  const { email } = req.params;

  if (await User.findOne({ email })) {
    return res.status(400).send({ error: 'User already exists' });
  }

  return res.status(200).send({ message: 'ok' });
});

export default router;