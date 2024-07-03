const express = require('express');

const app = express();

app.get('/root', (req, res) => {
    res.send('hello world')
})

app.get('/healthz', (req, res) => {
    res.send('ok')
})

app.listen(3000)