require('dotenv').config();
const express = require('express')
const app = express()
const port = 3000;

let startTime = Date.now();

app.listen(port);
console.log(`Aplicação teste executando em http://localhost: ${port}`);
app.get('/', (req, res) => {
  const name = process.env.NAME || 'candidato';
  res.send(`Olá ${name}!`);
});

app.get('/health', (req, res) => {
  const uptime = Math.floor((Date.now() - startTime) / 1000);
  if (uptime < 10) {
    res.status(500).send(`Unhealthy - uptime: ${uptime}s`);
  } else {
    res.status(200).send(`OK - uptime: ${uptime}s`);
  }

});