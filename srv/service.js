const cds = require("@sap/cds");
module.exports = async function(){
    let northwind = await cds.connect.to("northwind");
    this.on("READ","Products", function(req){
        return northwind.run(req.query)
    })
    this.on("READ","Employees", function(req){
        return northwind.run(req.query)
    })
}