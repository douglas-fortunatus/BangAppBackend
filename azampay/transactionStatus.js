import fetch from 'node-fetch';
import TokenFetcher from '../azampay/TokenFetcher.js'; // Import the TokenFetcher class

const transactionId = 'AZMbe391bac090d4a279f57758d67cd6c06';
const mnoName = 'Tigo';

const token = await TokenFetcher.fetchToken();

console.log(token);

const headers = {
  'Content-Type': 'application/json',
  'Authorization': `Bearer ${token}`
};


fetch(`https://api-disbursement-sandbox.azampay.co.tz/api/v1/azampay/transactionstatus?pgReferenceId=${transactionId}&bankName=${mnoName}`, {
  method: 'GET',
  headers,
})
  .then(res => {
    
    if (!res.ok) {
      throw new Error(`HTTP error! Status: ${res.status}`);
    }
    return res.json(); // Assuming the response is JSON, adjust accordingly
  })
  .then(responseData => {
    console.log('Response:', responseData);
    // Handle the response data as needed
  })
  .catch(error => {
    console.error('Error:', error.message);
    // Handle the error
  });
