import express from 'express';
import fetch from 'node-fetch';
// import https from 'https';
import PhoneNumberChecker from '../azampay//PhoneNumberChecker.js'; // Assuming you have this class
import TokenFetcher from '../azampay/TokenFetcher.js'; // Import the TokenFetcher class

const app = express();
const port = 3001;

app.use(express.json());

app.post('/azampay/checkout', async (req, res) => {
  console.log(req.body.phone_number);
  console.log('martin')
  console.log(req)
  try {
    const phoneNumber = req.body.phone_number;
    const amount = req.body.amount;

    // Fetch the token using the TokenFetcher class
    const token = await TokenFetcher.fetchToken();

    const data = {
      accountNumber: phoneNumber,
      amount: amount,
      currency: 'TZS',
      externalId: '123',
      provider: PhoneNumberChecker.checkProvider(phoneNumber),
      additionalProperties: {
        postId: req.body.post_id,
        userId: req.body.user_id,
      },
    };

    const headers = {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + token,
    };

    const apiUrl = 'https://checkout.azampay.co.tz/azampay/mno/checkout';

    const response = await fetch(apiUrl, {
      method: 'POST',
      headers,
      body: JSON.stringify(data),
    });

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const responseData = await response.json();
    res.json({ response: responseData });
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ error: error.message });
  }



});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
