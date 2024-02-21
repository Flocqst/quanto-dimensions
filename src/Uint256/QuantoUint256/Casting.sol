// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { QuantoUint256 } from "./ValueType.sol";
import { QuantoUint128 } from "src/Uint128/QuantoUint128/ValueType.sol";
import { SafeCastU256 } from "lib/synthetix-v3/utils/core-contracts/contracts/utils/SafeCast.sol";

using SafeCastU256 for uint256;

/// @notice Wraps a uint256 number into the QuantoUint256 value type.
function wrap(uint256 x) pure returns (QuantoUint256 result) {
    result = QuantoUint256.wrap(x);
}

/// @notice Unwraps a QuantoUint256 number into uint256.
function unwrap(QuantoUint256 x) pure returns (uint256 result) {
    result = QuantoUint256.unwrap(x);
}

/// @notice Converts a QuantoUint256 number into QuantoUint128.
function to128(QuantoUint256 x) pure returns (QuantoUint128 result) {
    result = QuantoUint128.wrap(unwrap(x).to128());
}
