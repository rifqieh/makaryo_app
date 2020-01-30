const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan kategori
  + tambah - menmabah sebuah kategori
  + ubah - mengubah sebuah kategori
  + hapus - menghapus sebuah kategori
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from kategori`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add").post((req, res) => {
    const KategoriUsaha = req.body.KategoriUsaha;
    const Icon = req.body.Icon;

    const QUERY = `insert into kategori(IdKategori, KategoriUsaha, Icon) 
    values(null, "${KategoriUsaha}", "${Icon}")`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //ubah
  router.route("/edit/:IdKategori").post((req, res) => {
    const IdKategori = req.body.IdKategori;
    const KategoriUsaha = req.body.KategoriUsaha;
    const Icon = req.body.Icon;

    const QUERY = `update kategori 
    set KategoriUsaha="${KategoriUsaha}", Icon="${Icon}" 
    where IdKategori=${IdKategori}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

  //hapus
  router.route("/delete/:IdKategori").delete((req, res) => {
    const IdKategori = req.body.IdKategori;
    const QUERY = `delete from pembelajaran where IdKategori=${IdKategori};
    delete from kategori where IdKategori=${IdKategori};`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
/*
  @user
  + progres - daftar data kategori beserta prosentase belajar pengguna tiap kategori
  + best proges - tiga kategori prosentase belajar terbaik pengguna
  + total progres - presentase total hasil belajar pengguna
  */

//proges
  router.route("/proges/:Nik").get((req, res) => {
    const Nik = req.body.Nik;
    const QUERY = `select cat.IdKategori, cat.Icon, cat.KategoriUsaha, (
      select cast((
          select count(cc.IdKonten)
          from belajar as cc
          where cc.Nik = ${Nik} AND cc.StatusDibaca = 1 
          AND cc.IdKonten in(
            SELECT s.IdKonten
              FROM pembelajaran as s
              WHERE s.IdKategori = cat.IdKategori
          )
        )*100/count(s.IdKonten) as double(10,0))
        from pembelajaran as s
        where s.IdKategori = cat.IdKategori
    ) as proges
    from kategori as cat;`;
   
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

  //best progres
  router.route("/proges/top3").get((req, res) => {
    const Nik = req.body.Nik;
    const QUERY = `select cat.IdKategori, cat.Icon, cat.KategoriUsaha, (
      select cast((
          select count(cc.IdKonten)
          from belajar as cc
          where cc.Nik = ${Nik} AND cc.StatusDibaca = 1 
          AND cc.IdKonten in(
            SELECT s.IdKonten
              FROM pembelajaran as s
              WHERE s.IdKategori = cat.IdKategori
          )
        )*100/count(s.IdKonten) as double(10,0))
        from pembelajaran as s
        where s.IdKategori = cat.IdKategori
    ) as proges
    from kategori as cat
    order by proges desc limit 3`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

  //total progres
  router.route("/proges/total").get((req, res) => {
    const Nik = req.body.Nik;
    const QUERY = `select Cast((
      select COUNT(b.IdKonten)
      from belajar as b
      where b.StatusDibaca = 1 and b.Nik=${Nik}
    )*100/COUNT(IdKonten) as double(10, 2)) as total
    from pembelajaran`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

module.exports = router;
