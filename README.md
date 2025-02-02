# NFT Marketplace 🛒  
A decentralized marketplace for buying and selling NFTs using Ethereum and Polygon blockchain networks.  

## 📌 Features  
- Mint NFTs directly from the platform  
- Buy and sell NFTs using smart contracts  
- Secure transactions with escrow functionality  
- Web3 wallet integration (MetaMask, WalletConnect)  

## 🔗 Project Structure  
/smart-contract-nft-marketplace
 ├── contracts/         # Solidity smart contracts
 ├── scripts/          # Deployment and interaction scripts
 ├── frontend/         # Web-based UI for users
 ├── backend/          # API for indexing and querying blockchain data
 ├── test/             # Unit tests for smart contracts
 ├── README.md         # Setup and usage guide
 ├── hardhat.config.js # Hardhat configuration file
 ├── package.json      # Dependencies

## 🚀 How to Run  

### **1. Clone the repository:**  
```bash
git clone https://github.com/your-username/smart-contract-nft-marketplace.git
cd smart-contract-nft-marketplace

npm install

npx hardhat compile
npx hardhat run scripts/deploy.js --network polygon

cd frontend
npm run dev
