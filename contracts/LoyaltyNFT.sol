pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title LoyaltyNFT
 * @dev A contract for creating loyalty-based non-fungible tokens (NFTs) with rewards functionality.
 */
contract LoyaltyNFT is ERC721 {
    uint256 public tokenCounter; // Counter for tracking token IDs
    mapping(address => uint256) public kilometersRan; // Mapping of user addresses to kilometers ran
    mapping(address => bool) public authorizedAddresses; // Mapping of authorized addresses

    /**
     * @dev Modifier to restrict access to authorized addresses only.
     */
    modifier onlyAuthorized() {
        require(authorizedAddresses[msg.sender], "Caller is not authorized");
        _;
    }

    /**
     * @dev Constructor to initialize the contract with the name and symbol for the NFT.
     */
    constructor() ERC721("LoyaltyNFT", "LOYALTY") {
        tokenCounter = 0;
    }

    /**
     * @dev Function to mint a new token and assign it to the specified address.
     * @param _to The address to which the token will be minted.
     */
    function mintToken(address _to) external {
        _safeMint(_to, tokenCounter);
        tokenCounter++;
    }

    /**
     * @dev Function to reward a user with kilometers ran.
     * @param _user The address of the user to reward.
     */
    function rewardUser(address _user) external {
        kilometersRan[_user] += 10; // Increment kilometers ran by 10
    }

    /**
     * @dev Function to get the discount for a user based on kilometers ran.
     * @param _user The address of the user for whom to calculate the discount.
     * @return The discount amount in euros.
     */
    function getDiscount(address _user) external view returns (uint256) {
        return kilometersRan[_user] / 10; // 1 euro discount for every 10 kilometers ran
    }

    /**
     * @dev Function to add an address to the list of authorized addresses.
     * @param _addr The address to add as authorized.
     */
    function addAuthorized(address _addr) external onlyOwner {
        authorizedAddresses[_addr] = true;
    }

    /**
     * @dev Function to remove an address from the list of authorized addresses.
     * @param _addr The address to remove from authorized.
     */
    function removeAuthorized(address _addr) external onlyOwner {
        authorizedAddresses[_addr] = false;
    }

    /**
     * @dev Function to evolve the NFT for a specified user with a new reward.
     * @param _user The address of the user for whom to evolve the NFT.
     * @param _newReward The new reward to assign to the NFT.
     */
    function evolveNFT(address _user, uint256 _newReward) external onlyAuthorized {
        // Function to enhance rewards for specified consumers
        // Implementation depends on your specific requirements
    }
}


