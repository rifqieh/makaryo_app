const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan semua pemberitahuan
  + tambah - menambahkan pemberitahuan
  + ubah - mengubah pemberitahuan
  + hapus - menghapus pemberitahuan
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from pemberitahuan`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add/:IdNotiv").post((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const IdAdmin = req.body.IdAdmin;
    const Deskripsi = req.body.Deskripsi;
    const TanggalPemberitahuan = req.body.TanggalPemberitahuan;

    const QUERY = `insert into pemberitahuan(IdNotiv, IdAdmin, Deskripsi, TanggalPemberitahuan) 
    values(${IdNotiv}, ${IdAdmin}, "${Deskripsi}", "${TanggalPemberitahuan}")`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

//tambah sebar
router.route("/add/all").post((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const IdAdmin = req.body.IdAdmin;
    const Deskripsi = req.body.Deskripsi;
    const TanggalPemberitahuan = req.body.TanggalPemberitahuan;

    const QUERY = `insert into pemberitahuan(IdNotiv, IdAdmin, Deskripsi, TanggalPemberitahuan) 
    values(${IdNotiv}, ${IdAdmin}, "${Deskripsi}", "${TanggalPemberitahuan}");
    insert into(IdNotiv, Nik, StatusDibaca)
        select ${IdNotiv}, Nik, 0
        from user;`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //ubah
  router.route("/edit/:IdNotiv").post((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const IdAdmin = req.body.IdAdmin;
    const Deskripsi = req.body.Deskripsi;
    const TanggalPemberitahuan = req.body.TanggalPemberitahuan;

    const QUERY = `update pemberitahuan
    set IdAdmin=${IdAdmin}, Deskripsi="${Deskripsi}", TanggalPemberitahuan="${TanggalPemberitahuan}"
    where IdNotiv=${IdNotiv}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //hapus
  router.route("/delete/:IdNotiv").delete((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const QUERY = `delete from tahu where IdNotiv=${IdNotiv};
    delete from pemberitahuan where IdNotiv=${IdNotiv};`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

  //hapus tertentu
  router.route("/delete/:Nik").delete((req, res) => {
    const IdNotiv = req.body.IdNotiv;
    const Nik = req.body.Nik;
    
    const QUERY = `delete from tahu 
    where IdNotiv=${IdNotiv} and Nik=${Nik}`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

/*
  @user
  + list - daftar nontivikasi yang diterima pengguna 
*/

  //list
  router.route("/list").delete((req, res) => {
    const Nik = req.body.Nik;
    
    const QUERY = `select p.Deskripsi, p.TanggalPemberitahuan
    from pemberitahuan as p
    right join tahu as t on t.IdNotiv = p.IdNotiv
    where t.Nik = ${Nik}
    ordey by p.TanggalPemberitahuan desc`;

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
