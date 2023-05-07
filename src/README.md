# ERC721 utility to check NFT sales

When posting a token collection for sale on OpenSea or Blur, you can check whether it is a token **sale** or **transfer**.

```solidity
import '@rockart/marketsale/MarketSale.sol';

contract TestNFT is MarketSale {
    // ...
}
```

```solidity
/**
* @dev Returns the address of the marketplace where the sale is tracked.
*/
function getMarket(uint256 id) external view returns (address);

/**
* @dev Adding a new marketplace address to track the sale.
*/
function addMarket(address[] memory markets) external;

/**
* @dev Removing the marketplace from sales tracking.
*/
function delMarket(address[] memory markets) external;

/**
* @dev Returns a logical value,
* `true` if the NFT is sale and
* `false` if it is a transfer.
*/
function isSale() external view returns (bool sale);
```

## Do not use in production!

- Do not test multiple sales;
- Do not test multiple transfers;
