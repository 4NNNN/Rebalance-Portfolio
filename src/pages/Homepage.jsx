import React, { useContext, useEffect, useState } from "react";
import { AppConfig } from "../context/AppConfig";
import { useNavigate } from "react-router-dom";

function Homepage() {
  const {
    addAsset,
    returnAssets,
    providerConnected,
    configure,
    deposit,
    rebalance
  } = useContext(AppConfig);

  const [assetName, setAssetName] = useState("");
  const [assetSymbol, setAssetSymbol] = useState("");
  const [assetAddress, setAssetAddress] = useState("");
  const [assetRatio, setAssetRatio] = useState("");
  const [depositAmount, setDepositAmount] = useState("");
  // const [load, setLoad] = useState(false);

  const navigate = useNavigate();

  // const [assetList, setAssetList] = useState([
  //   { name: "", symbol: "", tokenAddress: "", ratio: 0 },
  // ]);

  const addAnAsset = async (name, symbol, address, ratio) => {
    // do any pre processing code b4 calling the actual addAsset function

    // like..
    if (!name || !symbol || !address || !ratio) {
      alert("Make sure all the Input fields are filled");
    } else {
      await addAsset(name, symbol, address, ratio);
      console.log("Added asset");
    }
  };

  // const refreshAssets = async () => {
  //   try {
  //     setLoad(true);
  //     const assets = await returnAssets(); // Call the function to get the array of assets
  //     setAssetList(assets);
  //     setLoad(false);
  //   } catch (error) {
  //     console.log("Error at refreshAssets - ", error.message);
  //   }
  // };

  const depositMethod = async (amount) => {
    try {
      if (!depositAmount) {
        alert("Make sure the input fields are not empty");
      }
      await deposit(parseInt(amount));
    } catch (error) {
      console.log("An error occured at depositMethod - ", error.message);
    }
  };

  const Rebalance = async () => {
      await rebalance();
  };


  useEffect(() => {
    // automatically redirects back to the landing page if provider not connected
    if (!providerConnected) {
      navigate("/");
    }
  }, []);

  return (
    <main className="m-10 flex flex-col gap-5">
      <section className="flex gap-4 w-full">
        <div className="w-1/5 p-10 border-4 shadow-lg rounded-xl flex flex-col items-center justify-center">
          <button
            onClick={() => configure("50", "600", "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D")}
            className="configure  px-4 py-2 rounded-xl hover:scale-105 hover:shadow-xl hover:border-4 hover:border-red-700 bg-red-400 text-white font-semibold transition-all ease-in-out mt-2 w-fit"
          >
            Configure Env - OnlyOwner
          </button>
        </div>

        <div className="balances p-10 border-4 shadow-lg rounded-xl w-4/5">
          <h1 className="font-bold text-3xl"> Assets </h1>
          <div className="flex flex-row justify-around gap-12 items-center mt-10 p-6">
            <div className="token1 flex flex-col justify-center items-center gap-2 bg-blue-300 p-3 rounded-xl">
              <p className="tokenname">USDT</p>
              <div className="tokensymbol text-2xl font-extrabold p-1 bg-gray-400 rounded-xl mt-1">
                USDT
              </div>
              <div className="tokenratio">Ratio:2000</div>
              {/* <div className="tokenamount">Amount : </div> */}
            </div>
            <div className="token2 flex flex-col justify-center items-center gap-2 bg-yellow-300 p-3 rounded-xl">
              <p className="tokenname">ARB</p>
              <div className="tokensymbol text-2xl font-extrabold p-1 bg-gray-400 rounded-xl mt-1">
                ARB
              </div>
              <div className="tokenratio">Ratio:2000</div>
              {/* <div className="tokenamount">Amount : </div> */}
            </div>
            <div className="token3 flex flex-col justify-center items-center gap-2 bg-red-300 p-3 rounded-xl">
              <p className="tokenname">LBB</p>
              <div className="tokensymbol text-2xl font-extrabold p-1 bg-gray-400 rounded-xl mt-1">
                LBB
              </div>
              <div className="tokenratio">Ratio:2000</div>
              {/* <div className="tokenamount">Amount : </div> */}
            </div>
          </div>
        </div>
      </section>

      <section className="flex gap-4 w-full">
        <div className="addasset p-10 border-4 shadow-lg rounded-xl  flex flex-col gap-4 w-2/5 ">
          <h1 className="font-bold text-3xl">Deposit</h1>
          <input
            onChange={(e) => setDepositAmount(e.target.value)}
            placeholder="Deposit USDC"
            className="rounded-xl border border-gray-400 p-2 w-2/3"
            type="text"
          />
          <button
            onClick={() => depositMethod(depositAmount)}
            className="connectwallet px-4 py-2 rounded-xl hover:scale-105 hover:shadow-lg bg-sky-400 text-white font-semibold transition-all ease-in-out mt-2 w-fit"
          >
            Deposit & Rebalance
          </button>
        </div>

        <div className="addasset p-10 border-4 shadow-lg rounded-xl  flex flex-col gap-4 w-2/5 ">
          <h1 className="font-bold text-3xl">Rebalance - Current Asset Holdings</h1>
          <button
            onClick={() => Rebalance()}
            className="connectwallet px-4 py-2 rounded-xl hover:scale-105 hover:shadow-lg bg-sky-400 text-white font-semibold transition-all ease-in-out mt-2 w-fit"
          >
           Rebalance
          </button>
        </div>

        <div className="addasset p-10 border-4 shadow-lg rounded-xl  flex flex-col gap-4 w-3/5 ">
          <h1 className="font-bold text-3xl"> Add Asset</h1>
          <input
            placeholder="Asset Name"
            className="rounded-xl border border-gray-400 p-2"
            type="text"
            onChange={(e) => setAssetName(e.target.value)}
          />
          <input
            placeholder="Asset Symbol/Tick"
            className="rounded-xl border border-gray-400 p-2"
            type="text"
            onChange={(e) => setAssetSymbol(e.target.value)}
          />
          <input
            placeholder="Asset Address"
            className="rounded-xl border border-gray-400 p-2"
            type="text"
            onChange={(e) => setAssetAddress(e.target.value)}
          />
          <input
            placeholder="Asset Ratio"
            className="rounded-xl border border-gray-400 p-2"
            type="text"
            onChange={(e) => setAssetRatio(e.target.value)}
          />
          <div className="flex justify-between">
            <button
              onClick={() =>
                addAnAsset(
                  assetName,
                  assetSymbol,
                  assetAddress,
                  parseInt(assetRatio)
                )
              }
              className="connectwallet px-4 py-2 rounded-xl hover:scale-105 hover:shadow-lg bg-sky-500 text-white font-semibold transition-all ease-in-out mt-2 w-fit"
            >
              Add Asset
            </button>
            {/* <button
              className="connectwallet px-4 py-2 rounded-xl hover:scale-105 hover:shadow-lg bg-sky-600 text-white font-semibold transition-all ease-in-out mt-2 w-fit"
              onClick={() => refreshAssets()}
            > */}
              
            {/* </button> */}
          </div>

          <div className="assetnames">
            
          </div>
        </div>
      </section>
    </main>
  );
}

export default Homepage;
