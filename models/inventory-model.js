const pool = require("../database/")

async function getInventory() {
    const sql = "SELECT * FROM inventoryy"
    return await pool.query(sql)
}

module.exports = { getInventory }
