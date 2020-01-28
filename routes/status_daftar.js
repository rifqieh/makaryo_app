const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from status_daftar`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const IdStatus = req.body.IdStatus;
    const Deskripsi = req.body.Deskripsi;

    const QUERY = `insert into status_daftar(IdStatus,  Deskripsi)
    values(${IdStatus}, "${Deskripsi}")`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:IdStatus").post((req, res) => {
    const IdStatus = req.body.IdStatus;
    const Deskripsi = req.body.Deskripsi;
    
    const QUERY = `update status_daftar
      set Deskripsi="${Deskripsi}"
      where IdStatus=${IdStatus}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:IdStatus").delete((req, res) => {
    const IdStatus = req.body.IdStatus;
    
    const QUERY = `delete from daftar where IdStatus=${IdStatus}
    delete from status_daftar where IdStatus=${IdStatus};`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
module.exports = router;
