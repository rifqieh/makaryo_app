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
    values(${IdKonten}, "${NamaAcara}", "${Penyelenggara}", "${BatasPendaftaran}", "${Tanggal}", "${Jam}", "${Lokasi}", "${Deskripsi}", ${Gambar})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
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
      Tanggal="${Tanggal}", Jam="${Jam}", Lokasi="${Lokasi}", Deskripsi="${Deskripsi}", Gambar=${Gambar} where IdKonten=${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from acara where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
module.exports = router;
