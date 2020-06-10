## Sūrya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| contracts/Migrations.sol | a4fed62524d2737a0d03a309ace925874e6c6f7c |
| contracts/Owner.sol | ab6e119d0e1089b6ff56263c434fe98ec91b9bf0 |
| contracts/QVContract/QVContract.sol | 0c8d16ad8e8a402ce029fab80880e93ac9a9986b |
| contracts/QVContract/QVContract_ds.sol | 74cf5e7fc21e8f782daee602d1a9216ccfb8a312 |
| contracts/QVFactroy/QVFactory.sol | 72ed9cf4ac1b502151b83d261ebc169318267cee |
| contracts/QVFactroy/QVFactory_ds.sol | b64956e8486eafb16b9b06d207d9c1a27ca6ae37 |
| contracts/SafeMath.sol | e3d197714d84062c528968d3e777bfb4916a1df5 |
| contracts/token/TokenContract.sol | 9af75e9c2ee6c7fa8af807e1f0d3ff82fb49fd65 |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **Migrations** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | setCompleted | Public ❗️ | 🛑  | restricted |
| └ | upgrade | Public ❗️ | 🛑  | restricted |
||||||
| **Owner** | Implementation |  |||
| └ | changeOwner | Public ❗️ | 🛑  | isOwner |
||||||
| **QVContract** | Implementation | QVContract_ds |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | setProposal | Public ❗️ | 🛑  | isHasValidTokens isNotProposer isProposingtime |
| └ | calculateTokens | Public ❗️ |   |NO❗️ |
| └ | castVote | Public ❗️ | 🛑  | isNotVoted isVotingTime |
| └ | transferTokens | Internal 🔒 | 🛑  | |
| └ | FindWinner | Public ❗️ | 🛑  | isOwner |
| └ | claim | Public ❗️ | 🛑  | isWinner isWinnerDeclared |
||||||
| **QVContract_ds** | Implementation | Owner |||
||||||
| **QVFactory** | Implementation | QVFactory_ds |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | createQV | Public ❗️ | 🛑  |NO❗️ |
||||||
| **QVFactory_ds** | Implementation | Owner |||
||||||
| **SafeMath** | Library |  |||
| └ | add | Internal 🔒 |   | |
| └ | sub | Internal 🔒 |   | |
| └ | mul | Internal 🔒 |   | |
| └ | div | Internal 🔒 |   | |
| └ | mod | Internal 🔒 |   | |
||||||
| **TokenContract** | Implementation | ERC20, Owner |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | totalSupply | Public ❗️ |   |NO❗️ |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | mint | Public ❗️ | 🛑  | isOwner |
| └ | transfer | Public ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | Public ❗️ | 🛑  |NO❗️ |
| └ | allowance | Public ❗️ |   |NO❗️ |
| └ | approve | Public ❗️ | 🛑  |NO❗️ |
| └ | increaseAllowance | Public ❗️ | 🛑  |NO❗️ |
| └ | decreaseAllowance | Public ❗️ | 🛑  |NO❗️ |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
