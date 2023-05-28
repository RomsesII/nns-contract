// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract NameService {
    mapping(string => address) private domainToAddress;
    mapping(address => string) private addressToDomain;

    event DomainRegistered(string domain, address owner);
    event DomainUpdated(string domain, address newOwner);

    function registerDomain(string memory domain) external {
        require(domainToAddress[domain] == address(0), "Domain already registered");
        require(bytes(domain).length > 0, "Domain name cannot be empty");

        domainToAddress[domain] = msg.sender;
        addressToDomain[msg.sender] = domain;

        emit DomainRegistered(domain, msg.sender);
    }

    function updateDomain(string memory domain, address newOwner) external {
        require(domainToAddress[domain] == msg.sender, "Only domain owner can update");
        require(bytes(domain).length > 0, "Domain name cannot be empty");

        domainToAddress[domain] = newOwner;
        addressToDomain[msg.sender] = "";

        addressToDomain[newOwner] = domain;

        emit DomainUpdated(domain, newOwner);
    }

    function getOwnerOfDomain(string memory domain) external view returns (address) {
        return domainToAddress[domain];
    }

    function getDomainOfOwner(address owner) external view returns (string memory) {
        return addressToDomain[owner];
    }
}