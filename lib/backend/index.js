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
const adminR = require("./routes/admin");
const evenR = require("./routes/acara");
const articleR = require("./routes/artikel");
const daftarR require("./routes/daftar");
const gNotivR = require("./routes/given_notiv");
const categoryR = require("./routes/kategori");
const notivR = require("./routes/notivikasi");
const contentR = require("./routes/konten");
const userR = require("./routes/user");
const videoR = require("./routes/vidio");

//USE
app.use("/admin", adminR);
app.use("/acara", evenR);
app.use("/artikel", articleR);
app.use("/daftar", daftarR):
app.use("/given_notiv", gNotivR);
app.use("/kategori", categoryR);
app.use("/notivikasi", notivR);
app.use("/konten", contentR);
app.use("/user", userR);
app.use("/vidio", videoR);
