// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { USDPerBaseUint256 } from "./ValueType.sol";
import { USDPerBaseUint128 } from "src/Uint128/USDPerBaseUint128/ValueType.sol";
import { SafeCastU256 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastU256 for uint256;

/// @notice Wraps a uint256 number into the USDPerBaseUint256 value type.
function wrap(uint256 x) pure returns (USDPerBaseUint256 result) {
    result = USDPerBaseUint256.wrap(x);
}

/// @notice Unwraps a USDPerBaseUint256 number into uint256.
function unwrap(USDPerBaseUint256 x) pure returns (uint256 result) {
    result = USDPerBaseUint256.unwrap(x);
}

/// @notice Converts a USDPerBaseUint256 number into USDPerBaseUint128.
function to128(USDPerBaseUint256 x) pure returns (USDPerBaseUint128 result) {
    result = USDPerBaseUint128.wrap(unwrap(x).to128());
}
