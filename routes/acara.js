const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from acara`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const NamaAcara = req.body.namaAcara;
    const Penyelenggara = req.body.Penyelenggara;
    const BatasPendaftaran = req.body.BatasPendaftaran;
    const Tanggal = req.body.Tanggal;
    const Jam = req.body.Jam;
    const Lokasi = req.body.Lokasi;
    const Deskripsi = req.body.Deskripsi;
    const Gambar = req.body.Gambar;

    const QUERY = `insert into acara(IdKonten, NamaAcara, Penyelenggara, BatasPendaftaran, Tanggal, Jam, Lokasi, Deskripsi, Gambar)
    values(${IdKonten}, "${NamaAcara}", "${Penyelenggara}", "${BatasPendaftaran}", "${Tanggal}", "${Jam}", "${Lokasi}", "${Deskripsi}", ${Gambar});
    insert into daftar(Nik, IdKonten, IdStatus)
      select Nik, ${IdKonten}, 1
      from user`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:IdKonten").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const NamaAcara = req.body.namaAcara;
    const Penyelenggara = req.body.Penyelenggara;
    const BatasPendaftaran = req.body.BatasPendaftaran;
    const Tanggal = req.body.Tanggal;
    const Jam = req.body.Jam;
    const Lokasi = req.body.Lokasi;
    const Deskripsi = req.body.Deskripsi;
    const Gambar = req.body.Gambar;
    
    const QUERY = `update acara
      set NamaAcara="${NamaAcara}", Penyelenggara="${Penyelenggara}", BatasPendaftaran="${BatasPendaftaran}", 
      Tanggal="${Tanggal}", Jam="${Jam}", Lokasi="${Lokasi}", Deskripsi="${Deskripsi}", Gambar=${Gambar} 
      where IdKonten=${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:IdKonten").delete((req, res) => {
    const IdKonten = req.body.IdKonten;
    const QUERY = `delete from daftar where IdKonten=${IdKonten};
    delete from acara where acara.IdKonten=${IdKonten};
    delete from konten where konten.IdKonten=${IdKonten}`;
    
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //user
  router.route("/:IdKonten").get((req, res) => {
    const IdKonten = req.body.IdKonten;
    const Nik = req.body.IdKonten;

    const QUERY = `select a.NamaAcara, a.Penyelenggara, a.BatasPendaftaran, a.Tanggal, a.Jam, a.Lokasi, a.Deskripsi, a.Gambar, s.Deskripsi
    from acara as a
    right join daftar as d on d.IdKonten = a.IdKonten
    left join status_daftar as s on s.IdStatus = d.IdStatus
    where a.IdKonten=${IdKonten} and a.Nik=${Nik}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });
  
  router.route("/recommed").get((req, res) => {
    const QUERY = `select top 3 * from acara
    order by Tanggal desc`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

  router.route("/list").get((req, res) => {
    const QUERY = `select Gambar, Tanggal, Jam, Lokasi from acara`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

module.exports = router;
