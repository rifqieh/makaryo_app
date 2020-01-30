const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan semua konten
  + tambah - menambah konten
  + ubah - mengubah konten
  + hapus - mengahpus konten [record pengguna terhadap konten akan ikut terhapus]
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from konten`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add").post((req, res) => {
    const Jenis = req.body.Jenis;
    const IdAdmin = req.body.IdAdmin;

    const QUERY = `insert into konten(IdKonten, Jenis, IdAdmin, TanggalUpload) 
    values(null, "${Jenis}", ${IdAdmin}, CURDATE())`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //ubah
  router.route("/edit/:IdKonten").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const Jenis = req.body.Jenis;
    const IdAdmin = req.body.IdAdmin;

    const QUERY = `update konten
    set Jenis="${Jenis}", IdAdmin=${IdAdmin}, TanggalUpload=CURDATE()
    where IdKonten=${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //hapus
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
