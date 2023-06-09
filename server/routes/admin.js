const express = require('express');
const admin = require('../middlewares/admin');
const Product = require('../models/product');

const adminRouter = express.Router();

//create an admin middleware
adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;
        let product = new Product({
            name, description, images, quantity, price, category
        })
        product = await product.save();
        res.json(product);
    } catch (error) {
        res.status(500).json({ error: e.message });
    }
});

adminRouter.get('/admin/get-products',admin,async(req,res)=>{
    try {
        const products =await Product.find({});
        res.json(products);
        
    } catch (error) {
        res.status(500).json({error:error.message})
    }
})

module.export = adminRouter;