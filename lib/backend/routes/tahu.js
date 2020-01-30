const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan daftar tahu
  + tambah - menambah nontivikasi ke salah satu pengguna
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from tahu`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add").post((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const Nik = req.body.Nik;

    const QUERY = `insert into tahu(IdNotiv, Nik, StatusDibaca) 
    values(${IdNotiv}, ${Nik}, 0)`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

/*
  @user
  + dilihat - mengubah status baca menjadi benar
*/

  //dilihat
  router.route("/edit/be-read").post((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const Nik = req.body.Nik;

    const QUERY = `update tahu
    set StatusDibaca = 1
    where Nik=${Nik} and IdNotiv=${IdNotiv}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
