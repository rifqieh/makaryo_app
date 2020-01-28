const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from pembelajaran`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

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
  
  router.route("/delete/:IdKonten").delete((req, res) => {
    const IdKonten = req.body.IdKonten;
    const QUERY = `delete from belajar where IdKonten=${IdKonten}
    delete from pembelajaran where IdKonten=${IdKonten}`;
 
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

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

  router.route("/list/mark").get((req, res) => {
    const IdKategori = req.body.IdKategori;
    const QUERY = `select Thumbail, Judul, Bookmark, Url, StatusDibaca 
    from pembelajaran
    where pemebelajaran.IdKategori=${IdKategori} and
    pembelajaran.Bookmark = 1`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

  router.route("/seen").get((req, res) => {
    const IdKonten = req.body.IdKonten;
    const QUERY = `update pembelajaran
    set pemebelajaran.StatusDibaca = 1
    where pemebelajaran.IdKonten = ${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({result});
    });
  });

  router.route("/mark").get((req, res) => {
    const IdKonten = req.body.IdKonten;
    const QUERY = `update pembelajaran
    set pemebelajaran.Bookmark = 1
    where pemebelajaran.IdKonten = ${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({result});
    });
  });

module.exports = router;
