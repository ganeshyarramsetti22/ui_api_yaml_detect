const express = require("express");

const app = express();

const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
    res.json({
        message: "Hello from Full Stack API .....api version",
        version: "2.0.0"
    });
});

app.get("/api/health", (req, res) => {
    res.json({
        status: "healthy"
    });
});

app.listen(PORT, () => {
    console.log(`API running on port ${PORT}`);
});