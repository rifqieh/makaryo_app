const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from daftar`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const Nik = req.body.Nik;
    const IdKonten = req.body.IdKonten;
    const StatusDaftar = req.body.StatusDaftar;

    const QUERY = `insert into daftar(Nik, IdKonten, StatusDaftar)
    values(${Nik}, ${IdKonten}, "${StatusDaftar}")`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const Nik = req.body.Nik;
    const IdKonten = req.body.IdKonten;
    const StatusDaftar = req.body.StatusDaftar;
    
    const QUERY = `update daftar
      set Nik=${Nik}, IdKonten=${IdKonten}, StatusDaftar="${StatusDaftar}"`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from daftar where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
module.exports = router;
