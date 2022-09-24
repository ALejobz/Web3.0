// Desarrollo de Tarea 3 de Tecnologias Emergentes
// Victor Manchola
// Licensia del programa:
//   SPDX-License-Identifier: MIT


// Pragma, Imports
pragma solidity ^0.8.4;
import "@openzeppelin/contracts@4.7.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.7.3/security/Pausable.sol";
import "@openzeppelin/contracts@4.7.3/access/Ownable.sol";

// Contrato
contract VCoin is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("VCoin", "VAM") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}