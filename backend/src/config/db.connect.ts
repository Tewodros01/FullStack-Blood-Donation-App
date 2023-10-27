import mongoose from "mongoose";
import MONGO_DB_CONFIG from "./database.js";

const connectToDatabase = async () => {
  try {
    mongoose.set("strictQuery", true);
    await mongoose.connect(MONGO_DB_CONFIG.DB);
    console.log(`Successfully connected to the database.`);
  } catch (error) {
    console.error("Error connecting to the database:", error);
  }
};

export default connectToDatabase;
