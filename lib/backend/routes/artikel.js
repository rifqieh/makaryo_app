const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from artikel`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const JudulArtikel = req.body.JudulArtikel;
    const Url = req.body.Url;
    const Bookmark = req.body.Bookmark;
    const IdKategori = req.body.IdKategori;

    const QUERY = `insert into artikel(IdKonten, JudulArtikel, Url, Bookmark, IdKategori) 
    values(${IdKonten}, "${JudulArtikel}", "${Url}", ${Bookmark}, ${IdKategori})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const JudulArtikel = req.body.JudulArtikel;
    const Url = req.body.Url;
    const Bookmark = req.body.Bookmark;
    const IdKategori = req.body.IdKategori;
    const QUERY = `update artikel
    set JudulArtikel="${JudulArtikel}", Url="${Url}", Bookmark=${Bookmark}, IdKategori=${IdKategori} where IdKonten=${IdArtikel}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const IdKonten = req.body.IdKonten;
    const QUERY = `delete from artikel where IdKonten=${IdKonten}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
