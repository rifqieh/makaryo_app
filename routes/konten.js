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
    const TanggalUpload = req.body.TanggalUpload;

    const QUERY = `insert into konten(IdKonten, Jenis, IdAdmin, TanggalUpload) 
    values(null, "${Jenis}", ${IdAdmin}, "${TanggalUpload}")`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:IdKonten").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const Jenis = req.body.Jenis;
    const IdAdmin = req.body.IdAdmin;
    const TanggalUpload = req.body.TanggalUpload;

    const QUERY = `update konten
    set Jenis="${Jenis}", IdAdmin=${IdAdmin}, TanggalUpload="${TanggalUpload}"
    where IdKonten=${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:IdKonten").delete((req, res) => {
    const IdKonten = req.body.IdKonten;
    const QUERY = `delete from belajar where IdKonten=${IdKonten};
    delete from pembelajaran where IdKonten=${IdKonten};
    delete from daftar where IdKonten=${IdKonten};
    delete from acara where IdKonten=${IdKonten};
    delete from konten where IdKonten=${IdKonten};`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
