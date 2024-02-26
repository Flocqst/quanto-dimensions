// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {BaseUint256} from "./ValueType.sol";
import {BaseUint128} from "../../Uint128/BaseUint128/ValueType.sol";
import {SafeCastU256} from "../../utils/SafeCast.sol";

using SafeCastU256 for uint256;

/// @notice Wraps a uint256 number into the BaseUint256 value type.
function wrap(uint256 x) pure returns (BaseUint256 result) {
    result = BaseUint256.wrap(x);
}

/// @notice Unwraps a BaseUint256 number into uint256.
function unwrap(BaseUint256 x) pure returns (uint256 result) {
    result = BaseUint256.unwrap(x);
}

/// @notice Converts a BaseUint256 number into BaseUint128.
function to128(BaseUint256 x) pure returns (BaseUint128 result) {
    result = BaseUint128.wrap(unwrap(x).to128());
}

/// @notice Converts a BaseUint256 number into bytes32.
function toBytes32(BaseUint256 x) pure returns (bytes32 result) {
    result = bytes32(unwrap(x));
}
