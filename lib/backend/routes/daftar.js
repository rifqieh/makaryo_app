const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan daftar
  + tambah - menambahkan suatu daftar
  + hapus - menghapus suatu daftar
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from daftar`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
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
  
  //hapus
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
