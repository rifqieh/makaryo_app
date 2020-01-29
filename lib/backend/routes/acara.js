const router = require("express").Router();
const connection = require("../db");

/*
   @admin
  + data - seluruh data agenda
  + tambah - menambahkan agenda serta menyebarkannya ke pengguna
  + ubah - mengubah sebuah agenda
  + hapus - menghapus agenda [record pengguna yang mengikuti agenda tersebut akan ikut terhapus]
*/

//data
router.route("/").get((req, res) => {
  const QUERY = `select * from acara`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

//tambah
router.route("/add").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const NamaAcara = req.body.namaAcara;
    const Penyelenggara = req.body.Penyelenggara;
    const BatasPendaftaran = req.body.BatasPendaftaran;
    const Tanggal = req.body.Tanggal;
    const Jam_mulai = req.body.Jam_mulai;
    const Jam_selesai = req.body.Jam_selesai;
    const Lokasi = req.body.Lokasi;
    const Deskripsi = req.body.Deskripsi;
    const Gambar = req.body.Gambar;

    const QUERY = `insert into acara(IdKonten, NamaAcara, Penyelenggara, BatasPendaftaran, Tanggal, Jam_mulai, Jam_selesai, Lokasi, Deskripsi, Gambar)
    values(${IdKonten}, "${NamaAcara}", "${Penyelenggara}", "${BatasPendaftaran}", "${Tanggal}", "${Jam_mulai}", ${Jam_selesai}, "${Lokasi}", "${Deskripsi}", ${Gambar});
    insert into daftar(Nik, IdKonten, IdStatus)
      select Nik, ${IdKonten}, 1
      from user`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //ubah
  router.route("/edit/:IdKonten").post((req, res) => {
    const IdKonten = req.body.IdKonten;
    const NamaAcara = req.body.namaAcara;
    const Penyelenggara = req.body.Penyelenggara;
    const BatasPendaftaran = req.body.BatasPendaftaran;
    const Tanggal = req.body.Tanggal;
    const Jam_mulai = req.body.Jam_mulai;
    const Jam_selesai = req.body.Jam_selesai;
    const Lokasi = req.body.Lokasi;
    const Deskripsi = req.body.Deskripsi;
    const Gambar = req.body.Gambar;
    
    const QUERY = `update acara
      set NamaAcara="${NamaAcara}", Penyelenggara="${Penyelenggara}", BatasPendaftaran="${BatasPendaftaran}", 
      Tanggal="${Tanggal}", Jam="${Jam_mulai}", "${Jam_selesai}", Lokasi="${Lokasi}", Deskripsi="${Deskripsi}", "Gambar=${Gambar}" 
      where IdKonten=${IdKonten}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  //hapus
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
  
  /*
     @user
    + agenda pengguna - data dari sebuah agenda yang dilihat pengguna
    + beranda - tiga agenda terbaru pada tampilan beranda dimana pengguna belum terdaftar
    + beranda -> selengkapnya - seluruh agenda yang diurutkan dari tanggal pengunggahan
  */

  //agenda pengguna
  router.route("/:IdKonten").get((req, res) => {
    const IdKonten = req.body.IdKonten;
    const Nik = req.body.IdKonten;

    const QUERY = `select a.NamaAcara, a.Penyelenggara, a.BatasPendaftaran, a.Tanggal, a.Jam_mulai, a.Jam_selesai, a.Lokasi, a.Deskripsi, a.Gambar, s.Deskripsi
    from acara as a
    right join daftar as d on d.IdKonten = a.IdKonten
    left join status_daftar as s on s.IdStatus = d.IdStatus
    where a.IdKonten=${IdKonten} and a.Nik=${Nik}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });
  
  //beranda
  router.route("/list/recommed").get((req, res) => {
    const Nik = req.body.Nik;

    const QUERY = `select a.Gambar, a.Tanggal, a.Jam_mulai, a.Jam_selesai, a.Lokasi 
    from acara as a
    right join daftar as d on d.IdKonten = a.Idkonten
    where d.IdStatus = 1 and d.Nik = ${Nik}
    order by a.Tanggal desc
    limit 3`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

  //beranda -> selengkapnya
  router.route("/list/all").get((req, res) => {
    const QUERY = `select a.Gambar, a.Tanggal, a.Jam_mulai, a.Jam_selesai, a.Lokasi 
    from acara as a
    left join konten as k on k.IdKonten = a.Idkonten
    order by k.TanggalUpload desc`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

module.exports = router;
