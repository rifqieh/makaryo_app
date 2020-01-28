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
    const Icon = req.body.Icon;

    const QUERY = `insert into kategori(IdKategori, KategoriUsaha, Icon) 
    values(null, "${KategoriUsaha}", ${Icon})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:IdKategori").post((req, res) => {
    const IdKategori = req.body.IdKategori;
    const KategoriUsaha = req.body.KategoriUsaha;

    const QUERY = `update kategori 
    set KategoriUsaha=${KategoriUsaha}
    where IdKategori=${IdKategori}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:IdKategori").delete((req, res) => {
    const IdKategori = req.body.IdKategori;
    const QUERY = `delete from pembelajaran where IdKategori=${IdKategori};
    delete from kategori where IdKategori=${IdKategori}`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //prosentase belajar pengguna per kategori
  router.route("/proges/:Nik").get((req, res) => {
    const Nik = req.body.Nik;
    const QUERY = `select cat.IdKategori, cat.KategoriUsaha, concat(CONVERT((
      select cast((
          select count(cc.IdKonten)
            from belajar as cc
            where cc.Nik = ${Nik} AND cc.IdKonten in(
            	SELECT s.IdKonten
                FROM pembelajaran as s
                WHERE s.IdKategori = cat.IdKategori
            )
        )*100/count(s.IdKonten) as double(10,0))
        from pembelajaran as s
        where s.IdKategori = cat.IdKategori
    ), char), '%') as proges
    from kategori as cat;`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

module.exports = router;
