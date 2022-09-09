import express from "express";
import { config } from "dotenv";
config();

const server = express();

const test = (req,res)=>{
    return res.status(400).json({message:"Success"});
}
const router = express.Router();
router.get("/", test);
server.use(router);

server.listen(process.env.PORT, () => {
  console.log(`Running on PORT - ${process.env.PORT}`);
});
