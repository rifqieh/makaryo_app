const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from kategori`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const KategoriUsaha = req.body.KategoriUsaha;

    const QUERY = `insert into kategori(KategoriUsaha) values(${KategoriUsaha})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const KategoriUsaha = req.body.KategoriUsaha;

    const QUERY = `update kategori set KategoriUsaha=${KategoriUsaha}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/hapus/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from kategori where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
