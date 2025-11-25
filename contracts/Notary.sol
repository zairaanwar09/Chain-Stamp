// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Notary (aka "ChainStamp")
 * @dev This contract allows users to notarize files by storing their
 * SHA-256 hash on the blockchain. This creates an immutable,
 * timestamped proof of existence.
 */
contract Notary {

    // --- Data Structures ---
    
    struct Proof {
        address owner;      // The wallet address of the file's owner.
        uint256 timestamp;  // The block timestamp (in seconds) when it was notarized.
    }
    
    // This is the "database" of our DApp.
    // It's a "mapping" (like a dictionary) that links a
    // file hash (bytes32) to its Proof struct.
    mapping(bytes32 => Proof) public proofs;

    // --- Event ---
    
    // This event broadcasts to the world when a file is successfully notarized.
    event FileNotarized(
        address indexed owner,
        bytes32 indexed fileHash,
        uint256 timestamp
    );

    // --- Functions ---

    /**
     * @dev Notarizes a file by storing its SHA-256 hash.
     * @param _fileHash The SHA-256 hash of the file to be notarized.
     */
    function notarize(bytes32 _fileHash) public {
        // Check if the file has already been notarized
        require(
            proofs[_fileHash].timestamp == 0,
            "This file hash has already been notarized."
        );

        // Store the proof
        proofs[_fileHash] = Proof(msg.sender, block.timestamp);

        // Emit the event
        emit FileNotarized(msg.sender, _fileHash, block.timestamp);
    }

    /**
     * @dev Verifies a file hash and returns its proof details.
     * @param _fileHash The SHA-256 hash of the file to verify.
     */
    function verify(bytes32 _fileHash)
        public
        view
        returns (address owner, uint256 timestamp)
    {
        return (proofs[_fileHash].owner, proofs[_fileHash].timestamp);
    }
}