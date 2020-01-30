const router = require("express").Router();
const connection = require("../db");

/*
  @admin
  + data - menampilkan semua data admin
  + tambah - menambah admin
  + ubah - meengubah data admin
  + hapus - menghapus admin [seluruh data yang diunggah oleh admin tersebut akan ikut terhapus]
  + login - mendapatkan IdAdmin
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from admin`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add").post((req, res) => {
    const Username = req.body.Username;
    const Password = req.body.Password;

    const QUERY = `insert into admin(IdAdmin, Username, Password) 
    values(null, "${Username}", "${Password}")`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //ubah
  router.route("/edit/:IdAdmin").post((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const Username = req.body.Username;
    const Password = req.body.Password;

    const QUERY = `update admin
    set Username="${Username}", Password="${Password} 
    where IdAdmin=${IdAdmin}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //hapus
  router.route("/delete/:IdAdmin").delete((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const QUERY = `delete from belajar where IdKonten=(
      select a.IdKonten
      from konten as a
      where a.IdAdmin=${IdAdmin}
    );
    delete from pembelajaran where IdKonten=(
      select a.IdKonten
      from konten as a
      where a.IdAdmin=${IdAdmin}
    );
    delete from daftar where IdKonten=(
      select a.IdKonten
      from konten as a
      where a.IdAdmin=${IdAdmin}
    );
    delete from acara where IdKonten=(
      select a.IdKonten
      from konten as a
      where a.IdAdmin=${IdAdmin}
    );
    delete from konten where IdKonten=(
      select a.IdKonten
      from konten as a
      where a.IdAdmin=${IdAdmin}
    );
    delete from tahu where IdNotiv=(
      select p.IdNotiv
      from pemberitahuan as p
      where p.IdAdmin=${IdAdmin}
    );
    delete from pemberitahuan where IdNotiv=(
      select p.IdNotiv
      from pemberitahuan as p
      where p.IdAdmin=${IdAdmin}
    );
    delete from admin where IdAdmin=${IdAdmin}`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

//login
router.route("/get/:IdAdmin").get((req, res) => {
  const Username = req.body.Username;
  const Password = req.body.Password;
  const QUERY = `select IdAdmin from admin 
    where admin.Username="${Username} and admin.Password="${Password}"`;

  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ result });
  });
});
  
module.exports = router;
