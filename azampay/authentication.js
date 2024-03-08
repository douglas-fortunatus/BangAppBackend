import fetch from 'node-fetch';

const data = {
  'appName': 'BangApp Tz',
  'clientId': 'd29a8cef-6d22-4a2e-8055-ec73638041c7',
  'clientSecret': 'GZ/MjKg3BUQaDmHQDYfuGqtv71SVrIXl5isu/uhdAS5MxyalUSM4sK/iQ9lER14ddc53OpdXlyXVhdLDA0sl6VQ4VvgBF6TeRFVDC/Ser3lai5MSohpCEa+aKnQRSlCm0XNOMQAGEmiwlrPXhkM13QW9ERppRjDBj/LB/4JKk+8seUdGgULIxmxnzus0nZ8J8gIFC5Zg5+naqJktLQB/OetjC0Je+lvXdjO/53qkHmXFEXr8IqZNUYyy4CnmjxGs9UjQvV2tgkBa/AwR4/+etndFrh6KmXCOetga7Ug4SPGicD0jCPPC8US4firqvzlZQ/CqFLWcWk9hHitP+dVSpNZeYabs/2lmqn+EAWS/kefNApshjUIP49htV/6WHYvlVkXCR1gVY1Fd6hQY1Etbr7K3duQ5SRUFPFI7vixjfK/ySCx8eY9/Rn2buSMgMJMsxLEC0mf62b1VCVKRWKb+v0Mgc9eDEVTQSgklPkkpiNmy1NYYK8EUIY++VoU601YDAtTdtrp93E5ABffH/Fv2gMNDskEML8O8bdI1oWs3kOvb64v6YHLElkvMKQqTZ3lYTHxe6nbmxtlS8WcP2Oc9UV0fMXiMd3lhcZir5vtAF0hjueewDGCsUdi5RrPO4QOaPvbxBEfb9AJTG7lFAovErJZw8f/WbdxkNzPKtjf0nIc='
};

fetch('https://authenticator.azampay.co.tz/AppRegistration/GenerateToken', {
  method: 'POST',
  body: JSON.stringify(data), // Convert data to JSON string
  headers: {
    'Content-Type': 'application/json', // Specify content type
  },
})
  .then(res => {
    if (!res.ok) {
      throw new Error(`HTTP error! Status: ${res.status}`);
    }
    return res.json(); // Parse response JSON
  })
  .then(responseData => {
    console.log('Returned data:', responseData);
    // Continue with your logic based on the returned data
  })
  .catch(err => {
    console.error('Error:', err.message);
    // Handle the error
  });
