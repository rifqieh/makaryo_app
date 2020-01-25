const router = require("express").Router();
const connection = require("../db");

router.route("/").get((req, res) => {
  const QUERY = `select * from -`;
  connection.query(QUERY, (err, result) => {
    if (err) console.log(err);
    res.json({ data: result });
  });
});

router.route("/add").post((req, res) => {
    const Username = req.body.Username;
    const Password = req.body.Password;

    const QUERY = `insert into admin(IdAdmin, Username, Password) 
    values(${Username}, ${Password})`;
    
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/edit/:id").post((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const Username = req.body.Username;
    const Password = req.body.Password;

    const QUERY = `update admin
    set Username="${Username}", Password="${Password} where IdAdmin=${IdAdmin}`;
  
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });
  
  router.route("/delete/:id").delete((req, res) => {
    const IdAdmin = req.body.IdAdmin;
    const QUERY = `delete from admin where IdAdmin=${IdAdmin}`;
    connection.query(QUERY, (err, result) => {
      if (err) console.log(err);
      res.json(result);
    });
  });

module.exports = router;
