// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SeaSeries Interface Caller
/// @notice 用户专用：授权、存款、绑定、提现接口，连接合约地址
interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);
}

interface ISeaSeries {
    function deposit(uint256 amount) external;
    function bind(address referrer) external;
    function withdraw(uint256 amount, string calldata password) external;
    function withdrawInterestAndReward(string calldata password) external;
    function tokenAddress() external view returns (address);
    function isStop() external view returns (bool);
    function MAX_BIND_DEPTH() external view returns (uint256);
    function R2AiSmartContract() external view returns (address);
    function poolAddress() external view returns (address);
    function limitAllInvestAmount() external view returns (uint256);
    function minInvestAmount() external view returns (uint256);
    function withdrawRate() external view returns (uint256);
    function allInvestAmount() external view returns (uint256);
}

contract SeaSeriesInterfaceCaller {
    // 合约地址(请替换为实际地址)
    address public constant seaSeries =
        0x0E7218669029b8223b4497252e5DCBdE2c25cCfb;

    // 查询合约状态（是否停止）
    function isStop() external view returns (bool) {
        return ISeaSeries(seaSeries).isStop();
    }
    // 查询合约交易深度
    function MAX_BIND_DEPTH() external view returns (uint256) {
        return ISeaSeries(seaSeries).MAX_BIND_DEPTH();
    }
    // 查询R2AI授权地址
    function R2AiSmartContract() external view returns (address) {
        return ISeaSeries(seaSeries).R2AiSmartContract();
    }
    // 查询AAVE pool地址
    function poolAddress() external view returns (address) {
        return ISeaSeries(seaSeries).poolAddress();
    }
    // 查询存入资产（如：USDT-BSC链地址）
    function tokenAddress() public view returns (address) {
        return ISeaSeries(seaSeries).tokenAddress();
    }
    // 查询合约最大投资额上限
    function limitAllInvestAmount() external view returns (uint256) {
        return ISeaSeries(seaSeries).limitAllInvestAmount();
    }
    // 查询合约最小投资额
    function minInvestAmount() external view returns (uint256) {
        return ISeaSeries(seaSeries).minInvestAmount();
    }
    // 查询合约提现手续费
    function withdrawRate() external view returns (uint256) {
        return ISeaSeries(seaSeries).withdrawRate();
    }
    // 查询合约总投资额
    function allInvestAmount() external view returns (uint256) {
        return ISeaSeries(seaSeries).allInvestAmount();
    }

    // === 用户功能 ===

    /// 授权 USDT 给主合约使用
    function approveToken(uint256 amount) external {
        address usdt = tokenAddress();
        IERC20(usdt).approve(seaSeries, amount);
    }

    /// 存款
    function deposit(uint256 amount) external {
        ISeaSeries(seaSeries).deposit(amount);
    }

    /// 绑定推荐关系
    function bind(address referrer) external {
        ISeaSeries(seaSeries).bind(referrer);
    }

    /// 提款
    function withdraw(uint256 amount, string calldata password) external {
        ISeaSeries(seaSeries).withdraw(amount, password);
    }

    /// 提取利息与奖励
    function withdrawInterestAndReward(string calldata password) external {
        ISeaSeries(seaSeries).withdrawInterestAndReward(password);
    }
}
