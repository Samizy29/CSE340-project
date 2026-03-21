const invModel = require("../models/inventory-model")

async function buildInventory(req, res) {
    const data = await invModel.getInventory()
    res.send(data.rows)
}

module.exports = { buildInventory }
