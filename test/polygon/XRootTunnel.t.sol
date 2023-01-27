// SPDX-License-Identifier: UNLICENSED
import {Test} from "forge-std/Test.sol";
import {stdJson} from "forge-std/StdJson.sol";
import {XERC677} from "../../contracts/polygon/tokens/XERC677.sol";
import {XRootTunnel} from "../../contracts/polygon/XRootTunnel.sol";
import {XChildTunnel} from "../../contracts/polygon/XChildTunnel.sol";

contract XRootTunnelTest is Test {
    using stdJson for string;

    address admin;
    XERC677 xerc677;
    XRootTunnel xRootTunnel;
    XChildTunnel xChildTunnel;
    address checkPointManager;
    address fxRoot;
    address fxChild;

    struct Config {
        address contractAddress;
    }

    function setUp() public {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/config/network.config.json");
        string memory json = vm.readFile(path);
        bytes memory checkPointManagerBytes = json.parseRaw(".testnet.checkpointManager");
        bytes memory fxRootbytes = json.parseRaw(".testnet.fxRoot");
        bytes memory fxChildbytes = json.parseRaw(".testnet.fxChild");
        checkPointManager = abi.decode(checkPointManagerBytes, (Config)).contractAddress;
        fxRoot = abi.decode(fxRootbytes, (Config)).contractAddress;
        fxChild = abi.decode(fxChildbytes, (Config)).contractAddress;

        admin = makeAddr("admin");
        vm.startPrank(admin);
        xerc677 = new XERC677();
        xRootTunnel = new XRootTunnel(checkPointManager, admin, address(xerc677));
        xChildTunnel = new XChildTunnel(admin, address(xerc677));
        xChildTunnel.setFxRootTunnel(address(xRootTunnel));
    }

    function testProcessMessageFromRoot() public {
        xChildTunnel.processMessageFromRoot(
            1,
            address(xRootTunnel),
            bytes(
                "0x87A7811F4BFEDEA3D341AD165680AE306B01AAEACC205D227629CF157DD9F821000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000E00000000000000000000000008A26C63177B4AAD7507389864457DCE2489B03E10000000000000000000000004FDD54A50623A7C7B5B3055700EB4872356BD5B30000000000000000000000004FDD54A50623A7C7B5B3055700EB4872356BD5B30000000000000000000000000000000000000000000000008AC7230489E8000000000000000000000000000000000000000000000000000000000000000000A000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000"
            )
        );
    }
}
