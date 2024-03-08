// const axios = require('axios');
import axios from 'axios';

const transactionId = 'AZMbe391bac090d4a279f57758d67cd6c06';
const mnoName = 'Tigo';
const token = 'U2FsdGVkX1+9Mtzp18aJoXDUTvj2oTGZVynu/Dlufd0+mqB7gFh+U+xCdMEsRvDzLPl2kqz0T5UFAfX+CORsKuxfIf2/wL9mA/RkXdd0Lfa1iM7v+sUr7IUKlD2tQ95HyqBIclTzX7BI3HsWFbqegczrWbNIveD7ljK6dm7xVAW1lN8UQJR1IkYu+1X5Z7qZfRaKJy7bkS/pzimtEb0NBufDW+xu1Ve+c6ygFiGD40KB5+wjxdh/jf5VhBaceOtn/q1JGIJlnhg6vh8WDD+7oXeCe2PjFTXWgJMyPmhHmzeJljoiQGRBydHMyP0bJRIitlDbq59KnqvtQBa4Xn4Ha2124wbTqn3ZtHgOKCMmPxcuEteIcdXqcnzbh6P47jB/wT9PYhEyhcpjPVzE9HIGHO0zLsIyydchDxpa56H6Qe5i3029mRMyF6VP7DXIhSXKgMw0Tnxjd05p9FEoHWX5hyKBuUgPMV03TeBtpX4y/6NnkIfgoFDwfVs/Am3ICnMzyrRLckJTlCrj9Qucnjo9wWSjflWLJuwgd1JOrXfJTUJ7uwLocQgDp6UtUzJMAnuSrCnVOK7sO/3zUVdgo99qvxNi+hTBafqI6LcmgOVfIcGdctNN8fok2R3j1sUIwtL6xGZtOTd0vCz+n0/om/G7gSbzc2eoJL0FIXVLOWsf0ThYe6NTSm1jlZ7Ri3xDeiRFa3Gox07h0ur8gSVO1q7RttW9xpL15+hEBamLSEQntPofkRIOI758xEqJrPRL5/h0ZM2pmJg/50g9HIncFYAyUx9UeYnSo2+umMM/INpUH2Y8UY/9fmej6Tz6pojLuTxG33BLQHoV9qmmt5Acwi2TOI9iWuCcrS131VzCQj775RjVXNoiQhXuogrs+Kgryuc6hBhVuaBUUvsjU7AdqJhwonUI5H27/kz7ez/ZFV/2L+BPZrBZHOuHLRci7cYqXwmJvp59B80qe+LKxxBrO23LFlnFhEYk6A3uz+rkR0yxR6ltzQKHZKEW93uXKjPTXVf6nx6VEcRa6LUNDza8jtFgWQOy6I9M4Tj4luE81KVkA0EmMNKKfvq62hKtszs+khQO';


axios.get(`https://checkout.azampay.co.tz/api/v1/azampay/gettransactionstatus?pgReferenceId=${transactionId}&bankName=${mnoName}`, {
  headers: {
    'Authorization': `Bearer ${token}`
  }
})
.then(function (response) {
  console.log(response.data);
})
.catch(function (error) {
  console.log(error);
});