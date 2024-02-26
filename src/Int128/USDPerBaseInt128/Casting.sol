// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {USDPerBaseInt128} from "./ValueType.sol";
import {USDPerBaseUint128} from "src/Uint128/USDPerBaseUint128/ValueType.sol";
import {SafeCastI128} from "src/utils/SafeCast.sol";

using SafeCastI128 for int128;

/// @notice Wraps a int128 number into the USDPerBaseInt128 value type.
function wrap(int128 x) pure returns (USDPerBaseInt128 result) {
    result = USDPerBaseInt128.wrap(x);
}

/// @notice Unwraps a USDPerBaseInt128 number into int128.
function unwrap(USDPerBaseInt128 x) pure returns (int128 result) {
    result = USDPerBaseInt128.unwrap(x);
}

/// @notice Converts a USDPerBaseInt128 number into USDPerBaseUint128.
function toUint(USDPerBaseInt128 x) pure returns (USDPerBaseUint128 result) {
    result = USDPerBaseUint128.wrap(unwrap(x).toUint());
}
