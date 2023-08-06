import React, { useState, createContext, useEffect } from "react";
import contr from "./abi.json"
import { ethers as eth } from "ethers"

export const AppConfig = createContext();

export const AppProvider = ({ children }) => {
    const [providerConnected, setproviderConnected] = useState(false);
    const [currentUser, setcurrentUser] = useState();

    const ABI = contr.abi;
    const contractAddress = "0x9a1ebaa48297229195302a998afb9e60ac0f77fd"

    const requestAccount = async () => {
        const accns = await window.ethereum.request({
            method: "eth_requestAccounts",
        }); // prompt the user to connect one of their metamask accounts if they haven't  already connected
        setproviderConnected(true);
        setcurrentUser(accns[0]);
    };

    const connectWallet = async () => {
        if (window.ethereum) {
            await requestAccount();
            const provider = new eth.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const newsignedContract = new eth.Contract(
                contractAddress,
                ABI,
                signer
            );
            console.log("connected");
            return true;
        } return false
    };

    const addAsset = async (name, symbol, address, ratio) => {
        try {
            const provider = new eth.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const signedContract = new eth.Contract(
                contractAddress,
                ABI,
                signer
            );
            await signedContract.addAsset(name, symbol, address, ratio);
            alert(`Asset - ${name} Address - ${address} added successfully`)
        } catch (error) {
            console.log("An error occured at the AddAsset method")
        }
    }

    const rebalance = async () => {
        try {
            const provider = new eth.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const signedContract = new eth.Contract(
                contractAddress,
                ABI,
                signer
            );
            await signedContract.rebalance();
            alert(`Portfolio Rebalanced successfully`)
        } catch (error) {
            console.log("An error occured at the AddAsset method")
        }
    }

    const returnAssets = async () => {
        try {
            const provider = new eth.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const signedContract = new eth.Contract(
                contractAddress,
                ABI,
                signer
            );

            const assetIndex = await signedContract.assetIndex();

            let assetList = [];
            for (let i = 0; i < assetIndex; i++) {
                try {
                    const asset = await signedContract.assets(i);
                    const assetData = {
                        name: asset.name,
                        value: asset.value.toString(), 
                        symbol: asset.symbol,
                        address: asset.assetAddress.toString(),
                        ratio: asset.ratio.toString(),
                    };
                    assetList[i] = assetData;
                    console.log(assetData);
                } catch (error) {
                    console.error(`Error fetching asset ${i}:`, error.message);
                }
            }
            return assetList;
        } catch (error) {
            console.error('Error in returnAssets:', error.message);
        }
    };

    const configure = async (slippage, swapTimeLimit, routerAddress) => {
        try {
            const provider = new eth.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const signedContract = new eth.Contract(
                contractAddress,
                ABI,
                signer
            );
            await signedContract.configure(slippage, swapTimeLimit, routerAddress)
        } catch (error) {
            console.log("An error occured at the configure method:", error.message)
        }
    }

    const deposit = async (amount) => {
        try {
            const provider = new eth.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const signedContract = new eth.Contract(
                contractAddress,
                ABI,
                signer
            );
            await signedContract.deposit(amount)
            alert("Deposited and Rebalanced")
        } catch (error) {
            console.log("Ann error occured at the deposit method:", error.message)
        }
    }



    return (
        <AppConfig.Provider
            value={{ connectWallet, providerConnected, currentUser, addAsset,rebalance, returnAssets, configure, deposit }}
        >
            {children}
        </AppConfig.Provider >
    );
};