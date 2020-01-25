const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from notivikasi`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const Deskripsi	= req.body.Deskripsi;
    const StatusDibaca = req.body.StatusDibaca;

    const QUERY = `insert into notivikasi(Deskripsi, StatusDibaca) 
    values("${Deskripsi}", ${StatusDibaca})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const StatusDibaca = req.body.StatusDibaca;

    const QUERY = `update notivikasi
    set Deskripsi="${Deskripsi}", StatusDibaca=${StatusDibaca}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from notivikasi where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
