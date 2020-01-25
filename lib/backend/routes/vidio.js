const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from vidio`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const JudulVidio = req.body.JudulVidio;
    const Url = req.body.Url;
    const Bookmark = req.body.Bookmark;
    const IdKategori = req.body.IdKategori;

    const QUERY = `insert into vidio(IdKonten, JudulVidio, Url, Bookmark, IdKategori) 
    values(${IdKonten}, "${JudulVidio}", "${Url}", ${Bookmark}, ${IdKategori})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const JudulVidio = req.body.JudulVidio;
    const Url = req.body.Url;
    const Bookmark = req.body.Bookmark;
    const IdKategori = req.body.IdKategori;
    const QUERY = `update vidio
    set JudulVidio="${JudulVidio}", Url="${Url}", Bookmark=${Bookmark}, IdKategori=${IdKategori} where IdKonten=${Idvidio}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const IdKonten = req.body.IdKonten;
    const QUERY = `delete from vidio where IdKonten=${IdKonten}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
