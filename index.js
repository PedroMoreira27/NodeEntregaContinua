const express = require('express');
const app = express();

const PORT = 8100;

app.get('/', (req, res) => {
  res.send('Aplicação rodando no servidor 201.23.3.86 na porta 8100!');
});

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
