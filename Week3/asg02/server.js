import express from "express";
import Car from "./Car.js";

const port=3000;

const server = express();

const cars = [];
cars.push(new Car(1, "Car1", "Red"));
cars.push(new Car(2, "Car2", "Blue"));
cars.push(new Car(3, "Car3", "Black"));

// GET http://localhost:3001/cars

server.get("/cars",(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    resp.send(cars);
});


//Get : http://localhost:3000/cars/:cid
server.get('/cars/:cid', (req, resp) => {

    resp.setHeader('Content-Type', 'application/json');
    
    const cid = req.params.cid;
    console.log(cid);
    const car = cars.find(c => c.cid === parseInt(cid));
    console.log("Car:"+car);
   
    if(car){
        resp.send(car);
    }else {
        resp.status(404).send('Book Not Found');
    }
});

//Post: add new data :  http://localhost:3000/cars/add

server.post('/cars/add/', (req, resp) => {

    resp.setHeader('Content-Type','application/json');
    const newCar = { "cid":req.body.cid, "cname":req.body.cname, "ccolor":req.body.ccolor};
    cars.push(newCar);

    if(newCar){
        const n=product_list.push(newCar);
        if(n>0) resp.send(JSON.stringify(newCar)+" added in cars record");
        else resp.status(500).send(JSON.stringify(newCar)+" not added in record")
    }
});

server.put('/cars/:cid/:ccolor',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    const cid=req.params.cid;
    const car=cars.find(p=>p.cid===parseInt(cid));
    if(car){
            cars.ccolor=req.params.ccolor;
            resp.send(JSON.stringify(car)+" updated with new color");
    }
    else{   
            resp.status(404).send(cid+" No car found");
    }
    
    
});

        // http://localhost:3000/cars
server.delete('/cars/:cid',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    const cid=req.params.cid;
    cars.forEach(car => {
            if(car.cid === parseInt(req.params.cid)){
                cars.pop(cid);
            }
    });
});


server.listen(port,()=>{
    console.log("http://localhost:3000/cars");
})
