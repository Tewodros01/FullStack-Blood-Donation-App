import React from "react";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import RegisterGym from "./pages/register/Register";
import LogIn from "./pages/login/Login";
import { UserProvider } from "./context/UserContext";
import Users from "./pages/users/Users";
import "./styles/global.scss";

const App: React.FC = () => {
  const router = createBrowserRouter([
    {
      path: "/",
      element: <LogIn />,
    },

    {
      path: "/users",
      element: <Users />,
    },

    {
      path: "/register",
      element: <RegisterGym />,
    },
  ]);

  return (
    <UserProvider>
      <RouterProvider router={router} />
    </UserProvider>
  );
};

export default App;
