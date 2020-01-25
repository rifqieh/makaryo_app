const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from given_notiv`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const IdNotiv = req.body.IdNotiv;
    const Nik = req.body.Nik;

    const QUERY = `insert into given_notiv(IdAdmin, IdNotiv, Nik) 
    values(${IdAdmin}, ${IdNotiv}, ${Nik})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const IdNotiv = req.body.IdNotiv;
    const Nik = req.body.Nik;

    const QUERY = `update given_notiv
    set IdAdmin=${IdAdmin}, IdNotiv=${IdNotiv}, Nik=${Nik}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from given_notiv where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
