const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const mongoose = require('mongoose');

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const PORT = process.env.PORT || 3000;

// MongoDB connection settings
// const username = encodeURIComponent("herman");
// const password = encodeURIComponent("Kilimanjaro1927");
// const cluster = "Cluster0";

// const uri = `mongodb+srv://${username}:${password}@${cluster}.n6mhdlx.mongodb.net/websockets?retryWrites=true&w=majority`;

// mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: false })
//   .then(() => {
//     console.log("Connected to MongoDB Atlas");
//   })
//   .catch((error) => {
//     console.error("Error connecting to MongoDB Atlas:", error);
//   });

// Define a MongoDB schema for chat rooms
// const roomSchema = new mongoose.Schema({
//   participant1_id: String,
//   participant2_id: String
// });

// const ChatRoom = mongoose.model('ChatRoom', roomSchema);

server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

// Dictionary to store user-room associations
const userRooms = {};

io.on('connection', (socket) => {
  console.log(`User connected: ${socket.id}`);

  // When a user joins a room
  socket.on('join', async (participants) => {
    console.log("Joining users:", participants);
    const room = `${participants.participant1_id}_${participants.participant2_id}`;

    // Check if the room exists in MongoDB
    let existingRoom = await ChatRoom.findOne(participants);

    if (!existingRoom) {
      // If it doesn't, create it
      const newRoom = new ChatRoom(participants);
      await newRoom.save();
    }

    socket.join(room);

    // Store the user's current room in the dictionary
    if (!userRooms[socket.id]) {
      userRooms[socket.id] = room;
    }
  });

  // When a user sends a message
  socket.on('chat_message', async (message) => {
    console.log(message);
    io.emit('message', message)
    const { participants } = message;
    const room = `${participants.participant1_id}_${participants.participant2_id}`;

    // Check if the room exists in MongoDB before emitting the message
    let existingRoom = await ChatRoom.findOne(participants);

    if (existingRoom) {
      // Emit the message only to the participants' room
      socket.to(room).emit('message', message);
    } else {
      console.log(`Room does not exist: ${room}`);
    }
  });

  // When a user disconnects
  socket.on('disconnect', () => {
    console.log(`User disconnected: ${socket.id}`);

    // Remove the user from their joined room and delete the user's current room
    const room = userRooms[socket.id];
    if (room) {
      socket.leave(room);
      delete userRooms[socket.id];
    }
  });

  socket.on('updateLastMessageInConversation', (lastMessage) => {
    console.log(lastMessage);
    io.emit('updateLastMessageInConversation', lastMessage);
  });



});
