const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from user`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const Nik = req.body.Nik;
    const Nama = req.body.Nama
    const Password = req.body.Password;
    const NamaUsaha = req.body.NamaUsaha;
    const AlamatRumah = req.body.AlamatRumah;
    const AlamatUsaha = req.body.AlamatUsaha;
    const Phone = req.body.Phone;
    const Email = req.body.Email;
    const Barcode = req.body.Barcode;
    const SistemPemasaran = req.body.SistemPemasaran;
    const JenisProduk = req.body.JenisProduk;
    const KapasitasUsahaPerBulan = req.body.KapasitasUsahaPerBulan;	
    const Asset = req.body.Asset;
    const TenagaKerjaP = req.body.TenagaKerjaP;
    const TenagaKerjaL = req.body.TenagaKerjaL;
  
    const QUERY = `insert into user(Nik, Nama, Password, NamaUsaha, AlamatRumah, AlamatUsaha, Phone, Email, Barcode, SistemPemasaran, JenisProduk, KapasitasUsahaPerBulan, Asset, TenagaKerjaP, TenagaKerjaL) 
    values(${Nik}, "${Nama}", "${Password}", "${NamaUsaha}", "${AlamatRumah}", "${AlamatUsaha}", ${Phone}, "${Email}", "${Barcode}", "${SistemPemasaran}", "${JenisProduk}", "${KapasitasUsahaPerBulan}", "${Asset}", ${TenagaKerjaP}, ${TenagaKerjaL})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/data/all").post((req, res) => {
    const Nik = req.body.Nik;
    const Nama = req.body.Nama
    const NamaUsaha = req.body.NamaUsaha;
    const AlamatRumah = req.body.AlamatRumah;
    const AlamatUsaha = req.body.AlamatUsaha;
    const Phone = req.body.Phone;
    const Email = req.body.Email;
    const SistemPemasaran = req.body.SistemPemasaran;
    const JenisProduk = req.body.JenisProduk;
    const KapasitasUsahaPerBulan = req.body.KapasitasUsahaPerBulan;	
    const Asset = req.body.Asset;
    const TenagaKerjaP = req.body.TenagaKerjaP;
    const TenagaKerjaL = req.body.TenagaKerjaL;
  
    const QUERY = `update user
    set Nama="${Nama}", NamaUsaha="${NamaUsaha}", AlamatRumah="${AlamatRumah}", AlamatUsaha="${AlamatUsaha}", Phone=${Phone}, Email="${Email}", SistemPemasaran="${SistemPemasaran}", JenisProduk="${JenisProduk}", KapasitasUsahaPerBulan="${KapasitasUsahaPerBulan}", Asset="${Asset}", TenagaKerjaP=${TenagaKerjaP}, TenagaKerjaL=${TenagaKerjaL}
    where Nik=${Nik}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

  router.route("/edit/data/password").post((req, res) => {
    const Nik = req.body.Nik;
    const Password = req.body.Password;
    const NewPass = req.body.NewPass;
    const ConPass = req.body.ConPass;
    
    const QUERY = "";
    
    if(NewPass==ConPass){
      QUERY = `update user set Password="${NewPass}" 
      where Nik=${Nik} and Password="${Password}"`;
    }

    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

  router.route("/delete/:Nik").delete((req, res) => {
    const Nik = req.body.Nik;
    const QUERY = `delete from user where Nik=${Nik}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

  router.route("/get/:Nik").get((req, res) => {
    const Username = req.body.Nama;
    const Password = req.body.Password;
    const QUERY = `select Nik from user 
      where user.Nama="${Username} and user.Password="${Password}"`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ result });
    });
  });

  router.route("/profil").get((req, res) => {
    const Nik = req.body.Nik;
    const QUERY = `select * from user 
      where user.Nik="${Nik}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json({ data: result });
    });
  });

module.exports = router;
