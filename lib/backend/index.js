const express = require("express");
const cors = require("cors");
const bodyParses = require("body-parser");

const app = express();

app.use(cors());
app.use(bodyParses.urlencoded({ extended: false }));
app.use(bodyParses.json());

app.listen(4000, () => {
  console.log("server berjalan pada port 4000");
});

//ROUTER

//USE
