// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
    address public owner = msg.sender; //Take the adress ex:F30e8Db3A33500b4F480206c402096a610747537
    uint256 public last_completed_migration; //Track the last completed migraction

    /**
put a limit on; keep under control.
 */
    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _; //cantinues running function
    }

    function setCompleted(uint256 completed) public restricted {
        last_completed_migration = completed;
    }

    //next id
    //Write The Upgrade Smart Contract Migration Function
    function updgrade(address new_address) public restricted {
        Migrations upgrade = Migrations(new_address); //new address
        upgrade.setCompleted(last_completed_migration); //function update last completed migraction
    }
}
