import { React, useContext, useEffect } from "react";
import { AppConfig } from "../context/AppConfig";
import { useNavigate } from "react-router-dom";
function Landing() {
  const { providerConnected, connectWallet } = useContext(AppConfig);

  const navigate = useNavigate();

  useEffect(() => {
    if (providerConnected) {
      navigate("/homepage");
    }
  }, [providerConnected]);

  return (
    <div>
      <section className="container flex h-screen justify-center items-center flex-col ">
        <h1 className="text-4xl font-bold p-3 shadow-lg rounded-md">
          Portfolio Rebalancer
        </h1>
        <button
          onClick={() => connectWallet()}
          className="connectwallet px-4 py-2 rounded-xl hover:scale-105 hover:shadow-lg bg-sky-500 text-white font-semibold transition-all ease-in-out mt-32"
        >
          Connect to Web3
        </button>
      </section>
    </div>
  );
}

export default Landing;
