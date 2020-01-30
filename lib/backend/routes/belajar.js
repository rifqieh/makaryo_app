const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan data beajar
  + tambah - menambahkan belajar
  + hapus - menghapus belajar
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from belajar`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add").post((req, res) => {
    const Nik = req.body.Nik;
    const IdKonten	= req.body.IdKonten;

    const QUERY = `insert into belajar(Nik, IdKonten, Bookmark, StatusDibaca) 
    values(${Nik}, ${IdKonten}, 0, 0)`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

//hapus
router.route("/delete").delete((req, res) => {
  const Nik = req.body.Nik;
  const IdKonten	= req.body.IdKonten;
  
  const QUERY = `delete from belajar 
  where IdKonten=${IdKonten} and Nik = ${Nik}`;

  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json(result);
  });
});

/*
  @user
  + bookmark - pengguna menandai suatu materi/pembelajaran
  + lihat - menandai materi yang telah dilihat pengguna
*/

//bookmark
router.route("/mark").get((req, res) => {
  const IdKonten = req.body.IdKonten;
  const Nik = req.body.Nik;

  const QUERY = `update belajar as b
  set b.Bookmark = (b.Bookmark + 1)%2
  where b.Nik = ${Nik} and b.IdKonten = ${IdKonten}`;

  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({result});
  });
});

//lihat
router.route("/seen").get((req, res) => {
  const IdKonten = req.body.IdKonten;
  const Nik = req.body.Nik;

  const QUERY = `update belajar as b
  set b.StatusDibaca = 1
  where b.Nik = ${Nik} and b.IdKonten = ${IdKonten}`;

  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({result});
  });
});

module.exports = router;
