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
    const ProgresBelajar = req.body.ProgresBelajar;
    const SistemPemasaran = req.body.SistemPemasaran;
    const JenisProduk = req.body.JenisProduk;
    const KapasitasUsahaPerBulan = req.body.KapasitasUsahaPerBulan;	
    const Asset = req.body.Asset;
    const TenagaKerjaP = req.body.TenagaKerjaP;
    const TenagaKerjaL = req.body.TenagaKerjaL;
  
    const QUERY = `insert into user(Nik, Nama, Password, NamaUsaha, AlamatRumah, AlamatUsaha, Phone, Email, Barcode, ProgresBelajar, SistemPemasaran, JenisProduk, KapasitasUsahaPerBulan, Asset, TenagaKerjaP, TenagaKerjaL) 
    values(${Nik}, "${Nama}", "${Password}", "${NamaUsaha}", "${AlamatRumah}", "${AlamatUsaha}", ${Phone}, "${Email}", "${Barcode}", ${ProgresBelajar}, "${SistemPemasaran}", "${JenisProduk}", "${KapasitasUsahaPerBulan}", "${Asset}", ${TenagaKerjaP}, ${TenagaKerjaL})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {

    const QUERY = `update user
    set Nik=${Nik}, Nama="${Nama}", Password="${Password}", NamaUsaha="${NamaUsaha}", AlamatRumah="${AlamatRumah}", AlamatUsaha="${AlamatUsaha}", Phone=${Phone}, Email="${Email}", Barcode="${Barcode}", ProgresBelajar=${ProgresBelajar}, SistemPemasaran="${SistemPemasaran}", JenisProduk="${JenisProduk}", KapasitasUsahaPerBulan="${KapasitasUsahaPerBulan}", Asset="${Asset}", TenagaKerjaP=${TenagaKerjaP}, TenagaKerjaL=${TenagaKerjaL}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const id = req.params.id;
    const QUERY = `delete from user where id=${id}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
