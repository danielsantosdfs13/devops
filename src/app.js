// copy this into your app.js
const express = require('express');
const path = require('path');
const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.get('/api', function(req, res, next) {
    res.render('index', { title: 'Hello World! - DevOps' });
});

module.exports = app;