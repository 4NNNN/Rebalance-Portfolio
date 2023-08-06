// SPDX-License-Identifier: MIT
// File: @uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol

pragma solidity >=0.5.0;

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}

// File: @uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router01.sol

pragma solidity >=0.6.2;

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

// File: @uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol

pragma solidity >=0.6.2;


interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

// File: @uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol

pragma solidity >=0.5.0;

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

// File: contracts/2_Owner.sol


// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol



// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.20;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}


// File: contracts/1_main.sol

pragma solidity ^0.8.21;



contract Portfolio {
    address public owner;
    string public name;
    uint public assetIndex;
    mapping(uint => Asset) public assets;
    Config config;

    bool configured;
    bool rebalancing;

    IUniswapV2Router02 iUniswapRouter = IUniswapV2Router02(config.uniswapRouterAddress);

    struct Asset {
        string name;
        string symbol;
        address tokenAddress;
        uint ratio;
    }

    struct Config {
        uint slippage; 
        uint swapTimeLimit;
        address uniswapRouterAddress;
    }
    address immutable USDC = 0x8c803734e66EAeE8DCF1c9BE9c18747A4b302480;

    constructor(address _owner, string memory _name) {
        owner = _owner;
        name = _name;
        assetIndex = 0;
        configured = false;
        rebalancing = false;
        
    }
    
    IERC20 erc20Token = IERC20(USDC);
   
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function addAsset(string memory _name, string memory _symbol, address _address, uint _ratio) onlyOwner public {
        //create Asset
        Asset memory asset = Asset(_name, _symbol, _address, _ratio);
        assets[assetIndex] = asset;
        assetIndex++;
    }
    
    function changeAssetRatio(uint _assetIndex, uint _assetRatio) onlyOwner public {
        assets[_assetIndex].ratio = _assetRatio;
    }

    function spreadToAssets() internal {
        uint totalAmount = erc20Token.balanceOf(address(this));
        uint currentAmount = totalAmount;

        //forlooping assets
        for (uint i=0; i<assetIndex; i++) {
            if (currentAmount == 0) {
                break;
            }

            Asset memory asset = assets[i];
            uint assetRatio = asset.ratio;

            if (assetRatio == 0) {
                break;
            }
            
            //calculate amountPerAsset
            uint amountPerAsset = totalAmount * assetRatio / 10000;
            if (amountPerAsset <= currentAmount) {
                buyAsset(i, amountPerAsset);

                if (amountPerAsset == currentAmount) {
                    currentAmount = 0;
                }
                else {
                    currentAmount -= amountPerAsset;
                }
            }
            else {
                buyAsset(i, currentAmount);
                currentAmount = 0;
            }
        }
        
    }

    function buyAsset(uint currentIndex, uint amountIn) public {
        Asset memory asset = assets[currentIndex];
        address buyingAddress = asset.tokenAddress;
        address usdcAddress = USDC;
        

        require(amountIn <= IERC20(USDC).balanceOf(address(this)), "Can't send more than current balance");

            uint slippage = config.slippage;
            uint swapTimeLimit = config.swapTimeLimit;

            address[] memory path = new address[](2);
            path[0] = usdcAddress;
            path[1] = buyingAddress;

 
            uint[] memory amountsOut = iUniswapRouter.getAmountsOut(amountIn, path);
            uint tokenOutput = amountsOut[1];

            uint amountOutMin =  tokenOutput * (10000 - slippage) / 10000;
            
            uint deadline = block.timestamp + swapTimeLimit;

            IUniswapV2Pair pair = IUniswapV2Pair(usdcAddress);
            pair.approve(address(iUniswapRouter), amountIn);

            if(hasSufficientLiquidity(usdcAddress,buyingAddress,amountIn))
            {
                iUniswapRouter.swapExactTokensForTokens(amountIn, amountOutMin, path, address(this), deadline); 
            }
            else{
                revert ("LOW");
            }
            

    }

    function rebalance() onlyOwner public {
        //set rebalancing true 
        rebalancing = true;
        spreadToAssets();    
        rebalancing = false;  
    }


    function configure(uint _slippage, uint _swapTimeLimit, address _uniswapRouterAddress) onlyOwner public {
        config = Config({
            slippage: _slippage,
            swapTimeLimit: _swapTimeLimit,
            uniswapRouterAddress: _uniswapRouterAddress
        });

        iUniswapRouter = IUniswapV2Router02(config.uniswapRouterAddress);
        configured = true;
    }

    function deposit(uint amount) public payable {
        require(configured, "Configure portfolio");

       
        bool approvalSuccess = IERC20(USDC).approve(address(this), type(uint256).max);

        require(approvalSuccess, "Approval failed. Make sure you have enough balance to approve.");
        IERC20(USDC).transferFrom(msg.sender, address(this), amount);
    
        if (!rebalancing) {
            spreadToAssets();
        }
    }

    function getAssetIndex() public view returns (uint) {
        return assetIndex;
    }

    function hasSufficientLiquidity(address tokenA, address tokenB, uint amountIn) internal view returns (bool) {
        address[] memory path = new address[](2);
        path[0] = tokenA;
        path[1] = tokenB;
        uint[] memory amountsOut = IUniswapV2Router02(iUniswapRouter).getAmountsOut(amountIn, path); //Returns the reserves of token0 and token1 used to price trades and distribute liquidity. Also returns the block.timestamp
        uint tokenBOutput = amountsOut[1];
        address pairAddress = IUniswapV2Factory(iUniswapRouter.factory()).getPair(tokenA, tokenB);
        uint liquidity = IERC20(tokenB).balanceOf(pairAddress);
        if(tokenBOutput <=liquidity){
                return true;
        }
        else{
            revert("low liquidity");
        }
    }

   function getTokenPrice(address tokenA, address tokenB) external view returns (uint256,uint256) {

        address pairAddress = IUniswapV2Factory(iUniswapRouter.factory()).getPair(tokenA, tokenB);
        require(pairAddress != address(0), "Pair does not exist");
    
        IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);
        (uint112 reserve0, uint112 reserve1, ) = pair.getReserves();
    
        require(reserve0 > 0 && reserve1 > 0, "Invalid reserves");

        uint256 tokenAPrice = (reserve1 * 1e18) / reserve0;
        uint256 tokenBPrice = (reserve0 * 1e18) / reserve1;
        
        return (tokenAPrice,tokenBPrice);
    }

    function getAssetDetails(uint i) public view returns (string memory, string memory, address, uint) {
        return (assets[i].name, assets[i].symbol, assets[i].tokenAddress, assets[i].ratio);
    }

    
}