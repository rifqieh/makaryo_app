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
    const IdStatus = req.body.IdStatus;

    const QUERY = `insert into daftar(Nik, IdKonten, IdStatus)
    values(${Nik}, ${IdKonten}, ${IdStatus})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/list-status").post((req, res) => {
    const Nik = req.body.Nik;
    const IdKonten = req.body.IdKonten;
    const IdStatus = req.body.IdStatus;
    
    const QUERY = `update daftar
      set IdStatus=${IdStatus}
      where Nik=${Nik} and IdKonten=${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:IdStatus").delete((req, res) => {
    const Nik = req.body.Nik;
    const IdKonten = req.body.IdKonten;
    
    const QUERY = `delete from daftar 
    where Nik=${Nik} and IdKonten=${IdKonten}`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
module.exports = router;
