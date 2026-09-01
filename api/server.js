const express = require("express");

const app = express();

const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
    res.json({
        message: "Hello from full stack hari API .....api version 2.0",
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