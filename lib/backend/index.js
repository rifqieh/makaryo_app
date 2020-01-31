const express = require("express");
const cors = require("cors");
const bodyParses = require("body-parser");

const app = express();

app.use(cors());
app.use(bodyParses.urlencoded({ extended: false }));
app.use(bodyParses.json());

app.listen(3306, () => {
  console.log("server berjalan pada port 3306");
});

const evenR = require("./routes/acara");
const adminR = require("./routes/admin");
const studyingR = require("./routes/belajar");
const joiningR = require("./routes/daftar");
const categoryR = require("./routes/kategori");
const contentR = require("./routes/konten");
const materiR = require("./routes/pembelajaran");
const notivR = require("./routes/pemberitahuan");
const joiningNotivR = require("./routes/status_daftar");
const knowingR = require("./routes/tahu");
const userR = require("./routes/user");

app.use("/acara", evenR);
app.use("/admin", adminR);
app.use("/belajar", studyingR);
app.use("/daftar", joiningR);
app.use("/kategori", categoryR);
app.use("/konten", contentR);
app.use("/pembelajaran", materiR);
app.use("/pemberitahuan", notivR);
app.use("/status_daftar", joiningNotivR);
app.use("/tahu", knowingR);
app.use("/user", userR);
