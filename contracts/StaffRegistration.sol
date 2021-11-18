// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract StaffRegistration {
    address public owner;
    mapping (address=>employee)employees;

  constructor() public {
    owner=msg.sender;
  }

   /*a modifier onlyOwner is created to limit the access to function register to contract deployer*/
    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }



    struct employee{
      address employeeId;
      string  name;
      string  lastName;
      string project;
      uint256 age;
      uint256 NationalId;
      bool isExist;  
    }
   /**
    function workWithUsers(address owner, bool isExist) public onlyOwner {
      employees[employeeId].isExist = isExist;
    }
  */
  function register(address employeeId,string memory name,string memory lastName,string memory project,uint256 age,uint256 NationalId) public onlyOwner {
      require(employees[employeeId].isExist==false,"Employee details already registered and cannot be altered");
      /**
      assigning the student details to a key (employeeId)
      */
      employees[employeeId]=employee(employeeId,name,lastName,project,age,NationalId,true);
  }

  /**
    function to get the details of a employee when employeeId is given
     */
            
  function getEmployeeDetails(address employeeId) public view returns (address,string memory,string memory,string memory,uint256,uint256){

      return(employees[employeeId].employeeId,employees[employeeId].name,employees[employeeId].lastName,employees[employeeId].project,employees[employeeId].age,employees[employeeId].NationalId);
    }


}
