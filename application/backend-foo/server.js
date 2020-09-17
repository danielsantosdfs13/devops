var express = require("express");
var app = express();app.listen(8080, () => {
 console.log("Server running on port 8080");
});

app.get("/api/", (req, res, next) => {
    res.json(["Tony","Lisa","Michael","Ginger","Food"]);
   });