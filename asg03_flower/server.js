import express from 'express';

// const express=require('express');
const server = express();
const port = 3000;
const msg = `http://localhost:${port} started`;

server.use(express.urlencoded());
server.use(express.json());

const flowers = [ {fid:101, fName:'Rose', price:200},
                 {fid:102, fName:'Lily', price:150},
                 {fid:103, fName:'Sunflower', price:120} ];

//getting all the flowers : http://localhost:3000/flowers
server.get('/flowers', (req, resp) =>{

    resp.setHeader('Content-Type', 'application/json');
    resp.send(flowers);
});

//getting flower by id : http://localhost:3000/flowers/101
server.get('/flowers/:fid', (req, resp) =>{

    resp.setHeader('Content-Type', 'application/json');
    
    const fid = parseInt(req.params.fid);
    console.log(fid);

    const flower = flowers.find(f => f.fid === fid);
    console.log(flower);

    if(flower)
    {
        resp.send(flower);
    }else{
        resp.status(404).send("Flower not found");
    }
});

//adding flower : http://localhost:3000/flowers
server.post('/flowers/add/', (req, resp) => {

    resp.setHeader('Content-Type', 'application/json');

    const newFlower = {"fid":req.body.fid, "fName": req.body.fName, "price": req.body.price};
    flowers.push(newFlower);
    resp.send("New Record Added");
});

//updating flowers : http://localhost:3000/flowers/:fid/:price

server.put('/flowers/update/:fid/:price', (req, resp) => {

    resp.setHeader('Content-Type', 'application/json');

    flowers.forEach(f=>{
        if(f.fid===parseInt(req.params.fid)){
            flower.price=req.params.price;
        }
    })
    const msg=req.body.fid+" updated";
    resp.send({message:msg});
});

//deleting flower record : http://localhost:3000/flowers

server.delete('/flowers/delete/:fid',(req,resp)=>{
    resp.setHeader('Content-Type','applicaiton/json');
    flowers.forEach(f=>{
        if(f.fid===parseInt(req.params.fid)){
            flowers.pop();
        }
    })
    const msg=req.body.fid+" deleted";   //it is deleting last id
    resp.send({message:msg});
});



server.listen(port, () => {
    console.log(msg);
});

