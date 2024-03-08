import fetch from 'node-fetch';

const data = {
  'accountNumber': '0654680522',
  'amount': '1000',
  'currency': 'TZS',
  'externalId': '123',
  'provider': 'Tigo',
  'additionalProperties': {
    'property1': null,
    'property2': null
  }
};

const headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ' + 'U2FsdGVkX18H4p03e5yPEJuO/wlpQgdyAEPK65cZerDjjVLGoe4jacp5R568vrweCToQJI7cSybzDV+hS/y6aDZ4d6g2M+XxR+iaXt56mHZ6PlM8p3dGAP+TfV/CDf/uO9V6bTvGMsJM/2xDSdx0o3Mb7RXIZRmSYNobH1x3Wlr4U4dpfmb3r6zGSAxfpzJV0iMAr90x7Z7TP77le/pnNR0+GacsP1nsMBzbx2hMC4CdCeM+xnGWEV7e5MWxFgnSs9Kd8yG1eXs+HqD0mIq/1w6RyrHfWOc8Te5WB1K+ohPVuyFLf5Q6umZiY1BfrqTp8H7domrqBgEi0RbrktwFED8YlSXIqpSpT6YV3YtbYFSww/V/53s+e0SILqgqWcI/xgT+irsZZU54gFo+Ow5FWHVaew3i0/se1rxvjX3UKZ6F/SCBaOslyI00DALJFLr5kbCcSRBV1RSkmBK49wwOryn8+NDV5n9K2YLe4ezbAGcYfCXXghgtYjYJZa8X4Z0sGJclCLak/Q00etposWPzq13OlvO0rz8OvOh2f405h9HRSJql+G0KfqQmFxRWR/6bzgDU61MqlG4i6n7VjHQVsfolTv/LFcbMkEwD/1rHxCRodc/WU0O8JjOXI1nFuG/Y0RfN6NiwOO2CdqhOW8ohAz3OIEfAA6ud+CxstUuWjxtJxkqPvfU2zXXNpWCbUoaoi5WS69L+eZDymLy8Wogn55hYf7nI2bZjgg7tqu+Vb1iTk3G5YFlZVKvZswN/ewiGTnI66Pt79RnL/SAMHJA7E3byAFaAlaz9yO3SmJ8sV46GepswNBjSg75jrRuZggYVI2BIZYp/vSH7Q4CFyhVRJ1scoAXwE0N/CusMNnB+ad8AvKCk+42W5er84vxW5gKN7RY+/k+eEAoty913tYgbDd2NCvghcmdzICoCmGuUvqEHCiX8XMNZoTdbqUTi9jk1Vpw3IZQF3sInxdtsnHH06QDAXokLeE4nzmCwI50e2hYBMcoOI5uQmGzrrlgA6Gq1MK1ExLnE+NTpAn+PckFoXVqxr/yYCrvoozlf9u39UmkE6d4F0iUEVkVC3Gw5bWT0'
  
};

fetch(`https://checkout.azampay.co.tz/azampay/mno/checkout`, {
  method: 'POST',
  headers,
  body: JSON.stringify(data), // Ensure data is stringified for POST requests
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
