//creae object to store Product details such as pid,pname,unitprice
//car bike language flower friends

console.log("using new keyword");
const product = new Object();
product.pid = 123;
product.pname = "xxx";
product.unitprice = 3000;

product.details = function() {
    return "pid:"+this.pid + ", pname:" + this.pname + ", price:" + this.unitprice;
}

console.log(product.details());


console.log("---------------------------------------------------------");
console.log("using new constructor");

function Product(pId,pName,unitPrice)
{
    this.pid = pId;
    this.pname = pName;
    this.unitprice = unitPrice;

    this.details = () =>
    {
        // return this.pid + ":"
        // + this.pname + ":"
        // + this.unitprice;

        return pId + ":"
        + pName + ":"
        + unitPrice;
    }
}

const p1 = new Product(1002, "Demo Product", 230);
console.log(p1.details());

console.log("---------------------------------------------------------");

//using json
const p2 = {"pid": 1003, "pname": "Demo Product", "unitPrice": 230, "details": function(){ return this.pid + " " + this.pname + " " + this.unitPrice}};
console.log(p2.details());