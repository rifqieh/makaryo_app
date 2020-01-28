const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from pemberitahuan`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const Deskripsi	= req.body.Deskripsi;
    const TanggalPemberitahuan = req.body.TanggalPemberitahuan;

    const QUERY = `insert into pemberitahuan(IdNotiv, IdAdmin, Deskripsi, TanggalPemberitahuan) 
    values(null, ${IdAdmin}, "${Deskripsi}", "${TanggalPemberitahuan}")`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:IdNotiv").post((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const IdAdmin = req.body.IdAdmin;
    const Deskripsi	= req.body.Deskripsi;
    const TanggalPemberitahuan = req.body.TanggalPemberitahuan;

    const QUERY = `update pemberitahuan
    set IdAdmin=${IdAdmin}, Deskripsi="${Deskripsi}", TanggalPemberitahuan="${TanggalPemberitahuan}"
    where IdNotiv=${IdNotiv}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:IdNotiv").delete((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const QUERY = `delete from tahu where IdNotiv=${IdNotiv};
    delete from pemberitahuan where IdNotiv=${IdNotiv};`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
