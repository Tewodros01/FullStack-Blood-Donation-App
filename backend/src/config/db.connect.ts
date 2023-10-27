import MONGO_DB_CONFIG from "./database.js";
import * as mongoDB from "mongodb";

export async function connectToDatabase() {
  try {
    // Create a new MongoDB client with the connection string from MONGO_DB_CONFIG.DB.
    const client: mongoDB.MongoClient = new mongoDB.MongoClient(
      MONGO_DB_CONFIG.DB
    );
    // Connect to the MongoDB server.
    await client.connect();
    // Connection successful, log a message.
    console.log(`Successfully connected to the database.`);
  } catch (error) {
    // Handle any errors that occur during the connection attempt.
    console.error("Error connecting to the database:", error);
  }
}
