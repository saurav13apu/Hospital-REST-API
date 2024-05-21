const { query } = require("../db");
const validator = require("email-validator");

const registerPatientController = async (req, res) => {
  try {
    const {
      name,
      address,
      country_code,
      phone,
      email,
      password,
      photo_url,
      psychiatrist_id,
    } = req.body;

    // validators
    //check valid email
    if (!validator.validate(email)) {
      return res.status(500).json({
        success: false,
        message: "Enter a valid email address",
      });
    }

    // Check valid phone number
    if (phone.length != 12) {
      return res.status(500).json({
        success: false,
        message:
          "Phone number must be of 10 digits with country code in first place",
      });
    }

    // Check Address length
    if (address.length < 10) {
      return res.status(500).json({
        success: false,
        message: "Address should be minimim 10 letters",
      });
    }

    // Check Password length
    if (password.length < 8 || password.length > 15) {
      return res.status(500).json({
        success: false,
        message: "Password length must be in between 8 and 15",
      });
    }

    // Check minimum uppercase characters in password
    const uppercaseChars = password.match(/[A-Z]/g) || [];
    if (uppercaseChars.length < 1) {
      return res.status(500).json({
        success: false,
        message: "Password must contain atleast 1 uppercase letter",
      });
    }

    // Check minimum uppercase characters in password
    const lowercaseChars = password.match(/[A-Z]/g) || [];
    if (lowercaseChars.length < 1) {
      return res.status(500).json({
        success: false,
        message: "Password must contain atleast 1 lowercase letter",
      });
    }

    //Check minimum numbers in password
    const numbers = password.match(/[0-9]/g) || [];
    if (numbers.length < 1) {
      return res.status(500).json({
        success: false,
        message: "Password must contain atleast 1 number",
      });
    }

    await query(
      "INSERT INTO Patients(name, address, phone, email, password, photo_url, psychiatrist_id) VALUES (?,?,?,?,?,?,?)",
      [name, address, phone, email, password, photo_url, psychiatrist_id]
    );

    return res.status(200).json({
      success: true,
      message: "Registered successfully",
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Error in registration",
      error,
    });
  }
};

const getPatientController = async (req, res) => {
  const { hospital_id } = req.params;

  const queryString = `
  SELECT 
      h.name AS HospitalName,
      p.id AS PsychiatristId,
      p.name AS PsychiatristName,
      (SELECT COUNT(*) FROM Patients WHERE psychiatrist_id = p.id) AS PatientsCount
  FROM 
      Hospital h
  LEFT JOIN 
      Psychiatrist p ON h.id = p.hospital_id
  LEFT JOIN 
      Patients pt ON p.id = pt.psychiatrist_id
  WHERE 
      h.id = ?
  GROUP BY 
      h.id, p.id
`;

  const rows = await query(queryString, [hospital_id]);

  const hospitalDetails = {
    HospitalName: "",
    TotalPsychiatristCount: 0,
    TotalPatientsCount: 0,
    PsychiatristDetails: [],
  };

  const psychiatristSet = new Set();

  rows.forEach((row) => {
    if (!hospitalDetails.HospitalName) {
      hospitalDetails.HospitalName = row.HospitalName;
    }
    if (!psychiatristSet.has(row.PsychiatristId)) {
      psychiatristSet.add(row.PsychiatristId);
      hospitalDetails.PsychiatristDetails.push({
        Id: row.PsychiatristId,
        Name: row.PsychiatristName,
        PatientsCount: row.PatientsCount,
      });
      hospitalDetails.TotalPsychiatristCount++;
    }
    hospitalDetails.TotalPatientsCount += row.PatientsCount;
  });

  res.status(200).json({
    success: true,
    message: "query successfull",
    hospitalDetails,
  });
};

module.exports = { registerPatientController, getPatientController };
