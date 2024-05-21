const express = require("express");
const bodyParser = require("body-parser");
const { connection } = require("./db");

const hospitalRoutes = require("./routes/hospitalRoutes");

//rest object
const app = express();

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
app.use(bodyParser.json());

//routes
app.use("/api/v1/hospital", hospitalRoutes);

//rest api
app.get("/", (req, res) => {
  res.send("<h1>Welcome to Hospital</h1>");
});

//PORT
const PORT = 5000;

connection.connect((err) => {
  if (err) {
    console.log({ err });
    process.exit(1);
  }
  console.log("connected to database");
  app.listen(PORT, () => {
    console.log(
      `server running on devlopment mode on http://localhost:${PORT}`
    );
  });
});
