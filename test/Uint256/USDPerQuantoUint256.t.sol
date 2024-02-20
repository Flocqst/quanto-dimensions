// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {BaseQuantoPerUSDUint256, BaseUint256, QuantoUint256, USDPerBaseUint256, USDPerQuantoUint256, USDUint256} from "src/UnitTypes.sol";

contract USDPerQuantoUint256Test is Test {
    function setUp() public {}

    function testUSDPerQuantoUint256Add() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x + y;
        assertEq(result.unwrap(), 300);
    }

    function testUSDPerQuantoUint256AddFuzz(uint256 x, uint256 y) public {
        uint z;
        assembly {
            z := add(x, y)
        }
        USDPerQuantoUint256 xW = USDPerQuantoUint256.wrap(x);
        USDPerQuantoUint256 yW = USDPerQuantoUint256.wrap(y);
        if (z < x || z < y) {
            vm.expectRevert();
            xW + yW;
        } else {
            USDPerQuantoUint256 res = xW + yW;
            assertEq(res.unwrap(), x + y);
        }
    }

    function testUSDPerQuantoUint256Sub() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 result = x - y;
        assertEq(result.unwrap(), 100);
    }

    function testUSDPerQuantoUint256SubFuzz(uint256 x, uint256 y) public {
        if (x < y) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x) - USDPerQuantoUint256.wrap(y);
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x) -
                USDPerQuantoUint256.wrap(y);
            assertEq(result.unwrap(), x - y);
        }
    }

    function testUSDPerQuantoUint256And() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(10); // 1010 in binary
        uint256 y = 12; // 1100 in binary
        USDPerQuantoUint256 result = x.and(y);
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoUint256AndFuzz(uint256 x, uint256 y) public {
        uint z = x & y;
        USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).and(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint256And2() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(10); // 1010 in binary
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(12); // 1100 in binary
        USDPerQuantoUint256 result = x & y;
        assertEq(result.unwrap(), 8); // 1000 in binary
    }

    function testUSDPerQuantoUint256And2Fuzz(uint256 x, uint256 y) public {
        uint z = x & y;
        USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x) &
            USDPerQuantoUint256.wrap(y);
        assertEq(result.unwrap(), z);
    }

    function testUSDPerQuantoUint256Eq() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x == y;
        assertTrue(result);
        result = x == USDPerQuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256EqFuzz(uint256 x, uint256 y) public {
        bool z = x == y;
        bool result = USDPerQuantoUint256.wrap(x) == USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Gt() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(50);
        bool result = x > y;
        assertTrue(result);
        result = x > USDPerQuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256GtFuzz(uint256 x, uint256 y) public {
        bool z = x > y;
        bool result = USDPerQuantoUint256.wrap(x) > USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Gte() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x >= y;
        assertTrue(result);
        result = x >= USDPerQuantoUint256.wrap(101);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256GteFuzz(uint256 x, uint256 y) public {
        bool z = x >= y;
        bool result = USDPerQuantoUint256.wrap(x) >= USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Lt() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(50);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x < y;
        assertTrue(result);
        result = x < USDPerQuantoUint256.wrap(49);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256LtFuzz(uint256 x, uint256 y) public {
        bool z = x < y;
        bool result = USDPerQuantoUint256.wrap(x) < USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Lte() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x <= y;
        assertTrue(result);
        result = x <= USDPerQuantoUint256.wrap(99);
        assertFalse(result);
    }

    function testUSDPerQuantoUint256LteFuzz(uint256 x, uint256 y) public {
        bool z = x <= y;
        bool result = USDPerQuantoUint256.wrap(x) <= USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Mod() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(30);
        USDPerQuantoUint256 result = x % y;
        assertEq(result.unwrap(), 10);
    }

    function testUSDPerQuantoUint256ModFuzz(uint256 x, uint256 y) public {
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x) % USDPerQuantoUint256.wrap(y);
        } else {
            uint z = x % y;
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x) %
                USDPerQuantoUint256.wrap(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256Neq() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(100);
        bool result = x != y;
        assertFalse(result);
        result = x != USDPerQuantoUint256.wrap(101);
        assertTrue(result);
    }

    function testUSDPerQuantoUint256NeqFuzz(uint256 x, uint256 y) public {
        bool z = x != y;
        bool result = USDPerQuantoUint256.wrap(x) != USDPerQuantoUint256.wrap(y);
        assertEq(result, z);
    }

    function testUSDPerQuantoUint256Not() public {
        uint hundred = 100;
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(hundred);
        USDPerQuantoUint256 result = ~x;
        uint256 expected = ~hundred;
        assertEq(result.unwrap(), expected);
    }

    function testUSDPerQuantoUint256NotFuzz(uint256 x) public {
        USDPerQuantoUint256 result = ~USDPerQuantoUint256.wrap(x);
        assertEq(result.unwrap(), ~x);
    }

    function testUSDPerQuantoUint256Or() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x | y;
        assertEq(result.unwrap(), 100 | 200);
    }

    function testUSDPerQuantoUint256OrFuzz(uint256 x, uint256 y) public {
        USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x) |
            USDPerQuantoUint256.wrap(y);
        assertEq(result.unwrap(), x | y);
    }

    function testUSDPerQuantoUint256Xor() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 y = USDPerQuantoUint256.wrap(200);
        USDPerQuantoUint256 result = x ^ y;
        assertEq(result.unwrap(), 100 ^ 200);
    }

    function testUSDPerQuantoUint256XorFuzz(uint256 x, uint256 y) public {
        USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x) ^
            USDPerQuantoUint256.wrap(y);
        assertEq(result.unwrap(), x ^ y);
    }

    function testUSDPerQuantoUint256Increment() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        USDPerQuantoUint256 result = x.increment();
        assertEq(result.unwrap(), 101);
    }

    function testUSDPerQuantoUint256IncrementFuzz(uint256 x) public {
        uint z;
        assembly {
            z := add(x, 1)
        }
        if (z < x) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).increment();
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).increment();
            assertEq(result.unwrap(), x + 1);
        }
    }

    function testUSDPerQuantoUint256Mul() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100);
        uint256 y = 200;
        USDPerQuantoUint256 result = x.mul(y);
        assertEq(result.unwrap(), 20000);
    }

    function testUSDPerQuantoUint256MulFuzz(uint256 x, uint256 y) public {
        uint z;
        assembly {
            z := mul(x, y)
        }
        if ((x != 0 && y != 0) && (z / y != x || z / x != y)) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).mul(y);
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).mul(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256MulDecimal() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100 ether);
        uint256 y = 200 ether;
        USDPerQuantoUint256 result = x.mulDecimal(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testUSDPerQuantoUint256MulDecimalFuzz(uint256 x, uint256 y) public {
        uint z;
        assembly {
            z := div(
                mul(x, y),
                // 1 ether
                0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
            )
        }
        if (
            (x != 0 && y != 0) &&
            (z / y != (x / 1 ether) || z / x != (y / 1 ether))
        ) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).mulDecimal(y);
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).mulDecimal(y);
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256MulDecimalToUSD() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(100 ether);
        BaseUint256 y = BaseUint256.wrap(200 ether);
        USDUint256 result = x.mulDecimalToUSD(y);
        assertEq(result.unwrap(), 20000 ether);
    }

    function testUSDPerQuantoUint256MulDecimalToQuantoFuzz(
        uint256 x,
        uint256 y
    ) public {
        uint z;
        assembly {
            z := div(
                mul(x, y),
                // 1 ether
                0x0000000000000000000000000000000000000000000000000de0b6b3a7640000
            )
        }
        if (
            (x != 0 && y != 0) &&
            (z / y != (x / 1 ether) || z / x != (y / 1 ether))
        ) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).mulDecimalToUSD(BaseUint256.wrap(y));
        } else {
            USDUint256 result = USDPerQuantoUint256.wrap(x).mulDecimalToUSD(
                BaseUint256.wrap(y)
            );
            assertEq(result.unwrap(), z);
        }
    }

    function testUSDPerQuantoUint256Div() public {
        USDPerQuantoUint256 x = USDPerQuantoUint256.wrap(500);
        uint256 y = 2;
        USDPerQuantoUint256 result = x.div(y);
        assertEq(result.unwrap(), 250);
    }

    function testUSDPerQuantoUint256DivFuzz(uint256 x, uint256 y) public {
        uint z;
        assembly {
            z := div(x, y)
        }
        if (y == 0) {
            vm.expectRevert();
            USDPerQuantoUint256.wrap(x).div(y);
        } else {
            USDPerQuantoUint256 result = USDPerQuantoUint256.wrap(x).div(y);
            assertEq(result.unwrap(), z);
        }
    }
}