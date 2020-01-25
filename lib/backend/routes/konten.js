const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from konten`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const Jenis = req.body.Jenis;
    const IdAdmin = req.body.IdAdmin;
    const Nik = req.body.Nik;

    const QUERY = `insert into konten(Jenis, IdAdmin, Nik) 
    values("${Jenis}", ${IdAdmin}, ${Nik})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const Jenis = req.body.Jenis;
    const IdAdmin = req.body.IdAdmin;
    const Nik = req.body.Nik;

    const QUERY = `update konten
    set Jenis="${Jenis}", IdAdmin=${IdAdmin}, Nik=${Nik}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/hapus/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from konten where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
