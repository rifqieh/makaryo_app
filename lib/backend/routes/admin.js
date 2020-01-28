const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from admin`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

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
  
  router.route("/delete/:IdAdmin").delete((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const QUERY = `delete from admin 
    where IdAdmin=${IdAdmin}`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

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
