const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan materi
  + tambah - menambah materi
  + ubah - mengubah materi
  + hapus - menghapus materi
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from pembelajaran`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const Judul = req.body.Judul;
    const Url = req.body.Url;
    const IdKategori = req.body.IdKategori;
    const Thumbnail = req.body.Thumbnail;

    const QUERY = `insert into pembelajaran(IdKonten, Judul, Url, IdKategori, Thumbnail) 
    values(${IdKonten}, "${Judul}", "${Url}", ${IdKategori}, "${Thumbnail}");
    insert into belajar(Nik, IdKonten, Bookmark)
      select Nik, ${IdKonten}, 0
      from user`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //ubah
  router.route("/edit/:IdKonten").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const Judul = req.body.Judul;
    const Url = req.body.Url;
    const IdKategori = req.body.IdKategori;
    const Thumbnail = req.body.Thumbnail;

    const QUERY = `update pembelajaran
    set Judul="${Judul}", Url="${Url}", IdKategori=${IdKategori}, Thumbnail="${Thumbnail}" 
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
    delete from pembelajaran where IdKonten=${IdKonten};`;
 
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

/*
  @user
  + list - daftar materi (materi -> selengkapnya)
  + marking list - daftar materi yang dibookmark
*/

  //list
  router.route("/list/kategori").get((req, res) => {
    const IdKategori = req.body.IdKategori;
    const QUERY = `select p.Thumbnail, p.Judul, p.Url, b.Bookmark
    from pembelajaran as p
    right join belajar as b on b.IdKonten = p.IdKonten
    where p.IdKategori=${IdKategori}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

  //marking list
  router.route("/list/mark").get((req, res) => {
    const IdKategori = req.body.IdKategori;
    const QUERY = `select p.Thumbnail, p.Judul, p.Url, b.Bookmark
    from pembelajaran as p
    right join belajar as b on b.IdKonten = p.IdKonten
    where p.IdKategori=${IdKategori} and b.Bookmark = 1`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

module.exports = router;
