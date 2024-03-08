import https from 'https';

const options = {
  hostname: 'sandbox.azampay.co.tz',
  path: '/azampay/namelookup',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + 'U2FsdGVkX19tYI7svrmVCuA0cKqaqHkNbnvsmwOQhoAjCbwGA210x2Gde83mPtmlPbLMV1A908C2HvD7yuT+1DYGY3TS/IcmomzbaxkKAz3QmzPnTKWwDCCRtwGZlLZbolZNfcURk2Oj2qRDma0F8rYGScioN+Tzmaw2K2UfH+AcB11q2iyKKUswrqlKhhNVTngxC33G5laK4znBMG5W3DQrjdtXzwP5eepxHoi6e8OtC0QdrmmJjPTLj2FPoWBZvpvc5TaNOPn9ENECZlPMbkdJ5e05y4R/uhMXTnpR5oXm8gJLk5wxuvYKTh15UhAVqaPtJ803FkAncefoYK/WvQW4yYm901fzD0StbfSS5FJALCMEwtQ/Tyq5dZBBlNq6e406fxz8PyH/QZdu8avvSE4wSL0AEgdTaLZUrheQgx0GlY2nBZ3A54HONoCEfmLrF1BzkG8Reu6tfCj5AQfw/+kprjg8LxAjCLzESaclVh2PsWgaFHV28qtmtJS21gqSFHRXf8Breza55uxEt8HB/yXlQoMEz7m6TnSJmcNtxJpaIGa4PggrfjhaDkAP/ETLpkRaaNi2oAMs+xR4by/2e2aY36qvCyxyIewFGE2mX/+lVbU+T/n1bi8xrveQoO5BeVFE8hHcT5BBEXQS6ukw0NkAGVn0hgSRnkJV/0ouGqELI/1ebPsu8BVQ/AmhQ878lQYxm4UqCsxlATEx5jvoCw0Z0ngj3ckxJBy2xANNIUhZ0H2ueDcKce16zdhaQszc/U0ZGuESlQMyhL3UXu18U1EiNQsH++HCPf4D80u8RsO1PTrwmNeT7/up1BQDHLeeoxgbkcCsDP2TLMBGnYBMSKQ5PWuM9nko09rZAB4FUWARhUiC1IbfIo9PyTh9A7FGu/RicP3Z3428FTglDR4/btV2+Eupil/6oK3895iXZfmkhzoufbXAEo+h6bfYk9DG981qQaoEqxN5fc44Y7oCopp+lYpwCuNXPGOp5naXy8H4GFKm2ttN8DDivGIlGgBB',
  }
};

const req = https.request(options, (res) => {
  console.log(`statusCode: ${res.statusCode}`);

  const chunks = [];

  res.on('data', (d) => {
    chunks.push(d);
  });

  res.on('end', () => {
    const responseData = Buffer.concat(chunks).toString();
    console.log('Response:', responseData);
    // Handle the response data as needed
  });
});

req.on('error', (error) => {
  console.error('Error:', error);
});

const requestData = JSON.stringify({
  bankName: 'tigo',
  accountNumber: '0710426568',
  checksum: 'string'
});

req.write(requestData);
req.end();
