import MONGO_DB_CONFIG from "./database.js";
import * as mongoDB from "mongodb";

// const connectDB = async () => {
//   try {
//     mongoose.set("strictQuery", true);
//     await mongoose.connect(MONGO_DB_CONFIG.DB);
//     console.log("Database is connected");
//   } catch (error) {
//     console.log(error);
//   }
// };

export async function connectToDatabase() {
  try {
    const client: mongoDB.MongoClient = new mongoDB.MongoClient(
      MONGO_DB_CONFIG.DB
    );

    await client.connect();

    console.log(`Successfully connected to database `);
  } catch (error) {
    console.log(error);
  }
}

export default connectToDatabase;
