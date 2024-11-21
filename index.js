const express = require('express');
const app = express();
const port = process.env.PORT || 8100;

app.get('/', (req, res) => {
  res.send('Sonic o ouriço não é um meme');
});

app.listen(port, () => {
  console.log(`App is running on 201.23.3.86:${port}`);
});
