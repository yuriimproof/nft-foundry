# NFT Foundry

A blockchain project built with Foundry that implements and deploys NFT contracts to Ethereum networks. The project includes two types of NFTs:

1. **BasicNFT**: A simple ERC721 NFT with token URI functionality
2. **MoodNFT**: An interactive ERC721 NFT that allows users to flip between happy and sad moods

## Project Structure

- `src/`: Smart contract source files
  - `BasicNFT.sol`: Simple ERC721 implementation with metadata URI support
  - `MoodNFT.sol`: Interactive NFT with mood-switching functionality
- `script/`: Deployment and interaction scripts
  - `DeployBasicNFT.s.sol`: Script to deploy the BasicNFT contract
  - `DeployMoodNFT.s.sol`: Script to deploy the MoodNFT contract 
  - `Interactions.s.sol`: Scripts for minting and interacting with deployed contracts
- `test/`: Test files for the contracts
  - `unit/`: Unit tests for contract functionality
- `img/`: SVG images used for the MoodNFT (happy.svg and sad.svg)

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Ethereum wallet and RPC URL for deployment (Sepolia testnet recommended)

## Installation

1. Clone the repository
```bash
git clone <your-repo-url>
cd nft-foundry
```

2. Install dependencies
```bash
forge install
```

## Local Development

### Build

```bash
forge build
```

### Test

```bash
forge test
```

### Format

```bash
forge fmt
```

## Deployment

### Set up environment variables

Create a `.env` file with the following variables:
```
SEPOLIA_RPC_URL=<your-sepolia-rpc-url>
PRIVATE_KEY=<your-private-key>
ETHERSCAN_API_KEY=<your-etherscan-api-key>
```

Source your environment:
```bash
source .env
```

### Deploy BasicNFT

```bash
make deploy ARGS="--network sepolia"
```

### Deploy MoodNFT

```bash
make deployMood ARGS="--network sepolia"
```

## Interacting with Contracts

### Mint a BasicNFT

```bash
make mint ARGS="--network sepolia"
```

### Mint a MoodNFT

```bash
make mintMoodNft ARGS="--network sepolia"
```

### Flip Mood on a MoodNFT

```bash
make flipMoodNft ARGS="--network sepolia"
```

## Features

### BasicNFT

- ERC721 compliant token
- Customizable metadata URI
- Automatic token ID incrementation

### MoodNFT

- On-chain SVG-based NFT
- Interactive mood flipping function
- Base64 encoded metadata and images
- Only the owner can change the mood of their NFT

## License

This project is licensed under the MIT License.

## Acknowledgements

- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts) for ERC721 implementations
- [Foundry](https://book.getfoundry.sh/) for the development framework
