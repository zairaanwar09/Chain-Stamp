ChainStamp: Decentralized On-Chain Notary

ChainStamp is a decentralized application (DApp) built on the Ethereum blockchain (Sepolia Testnet) that provides a secure, immutable, and private way to prove the existence and ownership of digital files.

By leveraging blockchain technology, ChainStamp acts as a "digital notary," allowing users to timestamp documents without ever uploading the actual files to a server.

Key Features

Proof of Existence: Creates a permanent record that a specific file existed at a specific point in time.

100% Privacy: The file itself never leaves the user's device. Only its unique cryptographic fingerprint (SHA-256 hash) is stored on the blockchain.

Immutability: Once a record is created, it cannot be altered, deleted, or censored by anyone.

Verification: Anyone with the original file can verify its authenticity against the blockchain record instantly.

How It Works

Hash Generation: The user selects a file. The frontend calculates its SHA-256 hash locally in the browser.

Blockchain Transaction: The user signs a transaction via MetaMask to send this hash to the Notary smart contract.

Storage: The smart contract stores the hash, the user's wallet address, and the block timestamp.

Verification: To verify, the DApp re-hashes the file and queries the smart contract. If the hash exists, it returns the original timestamp and owner.

Tech Stack

Frontend: HTML5, Tailwind CSS, JavaScript (Ethers.js v6)

Blockchain: Ethereum (Sepolia Testnet)

Smart Contract: Solidity (v0.8.20)

Development Framework: Truffle Suite

Infrastructure: Alchemy (RPC Node Provider)

Wallet: MetaMask

Project Structure

contracts/Notary.sol: The Solidity smart contract governing the logic.

migrations/1_deploy_notary.js: The deployment script for the Truffle migration.

truffle-config.js: Configuration for network connections (Sepolia) and compilers.

index.html: The responsive, dark-mode enabled user interface.

Getting Started

To run this project locally:

Clone the repository.

Install dependencies: npm install

Create a .env file with your SEPOLIA_URL and PRIVATE_KEY.

Deploy the contract: truffle migrate --network sepolia

Update index.html with the new contract address.

Run the frontend: http-server .
