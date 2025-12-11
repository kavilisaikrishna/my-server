const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello World from Mac Terminal!');
});

app.listen(9000, () => {
  console.log('Server running on port 9000');
});

