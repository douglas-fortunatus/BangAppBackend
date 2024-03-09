import express from 'express';
import http from 'http';
import { Server } from 'socket.io';
import mysql from 'mysql';

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'social',
});

db.connect((err) => {
  if (err) {
    console.error('Database connection failed:', err.message);
  } else {
    console.log('Connected to the database');
  }
});

io.on('connection', (socket) => {
  console.log('A client connected');

  socket.on('disconnect', () => {
    console.log('Client disconnected');
  });
});

const notifyNewPayment = (transactionId) => {
  io.emit('newPayment', { transactionId });
};

const checkForNewPayments = (referenceId) => {
  const query = `SELECT * FROM azampays WHERE reference = ${referenceId}`;

  db.query(query, (err, results) => {
    if (err) {
      console.error('Error querying the database:', err.message);
    } else {
      results.forEach((payment) => {
        notifyNewPayment(payment.transid);
        // Optionally update the status in the database to mark it as notified
        // Example: db.query('UPDATE payments SET status = "notified" WHERE id = ?', [payment.id]);
      });
    }
  });
};

setInterval(() => checkForNewPayments('your_reference_id'), 60000);

server.listen(3001, () => {
  console.log('WebSocket server listening on *:3001');
});
