// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.21;

import { BaseMainnetConstants } from "./BaseMainnetConstants.sol";
import { CollateralRatio } from "../../src/types/DataTypes.sol";
import { USDWadRayMath } from "../../src/libraries/math/USDWadRayMath.sol";

/// @title DeployForkConfig
/// @notice configuration and constants used on fork deployment
abstract contract DeployForkConfig is BaseMainnetConstants {

  string public constant STRATEGY_ERC20_NAME = "CbETH/WETH Seamless ILM";
  string public constant STRATEGY_ERC20_SYMBOL = "ilmCbETH";
  
  CollateralRatio public collateralRatioTargets = CollateralRatio({
    target: USDWadRayMath.usdDiv(300, 200), // 3x
    minForRebalance: USDWadRayMath.usdDiv(330, 230),  // 3.3x
    maxForRebalance: USDWadRayMath.usdDiv(270, 170),  // 2.7x
    maxForDepositRebalance: USDWadRayMath.usdDiv(299, 199), // 2.99x
    minForWithdrawRebalance: USDWadRayMath.usdDiv(301, 201)  // 3.01x 
  });

  uint256 public constant ratioMargin = 10 ** 4; // 0.01% ratio margin
  uint16 public constant maxIterations = 10;

  // wrapedCbETH reserve setup
  string public constant wrappedCbETH_aTokenName = "Seamless wrapped CbETH";
  string public constant wrappedCbETH_aTokenSymbol = "swCbETH";
  string public constant wrappedCbETH_variableDebtTokenName = "Seamless Variable Debt wrapped CbETH";
  string public constant wrappedCbETH_variableDebtTokenSymbol = "variableDebtSeamWCbETH";
  string public constant wrappedCbETH_stableDebtTokenName = "Seamless Stable Debt wrapped CbETH";
  string public constant wrappedCbETH_stableDebtTokenSymbol = "stableDebtSeamWCbETH";

  uint256 public constant wrappedCbETH_LTV = 90_00;
  uint256 public constant wrappedCbETH_LiquidationTrashold = 92_00;
  uint256 public constant wrappedCbETH_LiquidationBonus = 100_00 + 5_00;

  uint256 public constant swapperOffsetFactor = 750000; // 0.75 %
  uint256 public constant swapperOffsetDeviation = 99000000; // 99%
}
