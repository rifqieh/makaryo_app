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
  
  router.route("/delete/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from kategori where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

router.route("/proges").get((req, res) => {
    const Nik = req.body.Nik;
    const QUERY = `select cat.IdKategori, cat.KategoriUsaha, (
      select cast((
          select count(s.IdKonten)
            from s
            where s.StatusDibaca = 1
        )/count(s.IdKonten) as decimal(65,8))
        from pembelajaran as s
        where s.IdKategori = cat.IdKategori
    )
    from kategori as cat
    where cat.IdKategori in(
      select pembelajaran.IdKategori
      from pembelajaran
      where pembelajaran.IdKonten in(
        select konten.IdKonten
        from konten
        where konten.Nik = ${Nik}
      )
    );`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

module.exports = router;
