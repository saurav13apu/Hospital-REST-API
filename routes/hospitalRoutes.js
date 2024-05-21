const express = require("express");
const Controllers = require("../Controllers/hospitalController");

//router object
const router = express.Router();

router.post("/register", Controllers.registerPatientController);
router.get("/:hospital_id", Controllers.getPatientController);

module.exports = router;
