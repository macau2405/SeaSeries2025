📘 SeaSeries 合約操作說明

🔹 合約簡介

SeaSeriesInterfaceCaller 是一個針對用戶操作而設計的輕量版接口合約，可透過 Remix 使用，提供：
	•	💰 授權
	•	📥 存款
	•	📤 提領本金
	•	🧾 提領利息與推薦獎勵
	•	🔗 綁定推薦人
	•	📊 查詢重要參數

此合約內建主合約地址，不需要使用者輸入任何合約地址，即可與主合約交互，保證操作正確與安全。

⸻

🧰 操作前準備
	1.	安裝 MetaMask 並連接 BNB Chain 主網（BSC）
	2.	準備好一定數量的 BNB（支付 gas）與 USDT（用於投資）
	3.	開啟 Remix IDE

⸻

🚀 Remix 操作步驟

第 1 步：載入合約
	1.	在 Remix 中建立新檔案 SeaSeriesInterfaceCaller.sol
	2.	將你提供的繁體版合約程式碼貼入
	3.	點擊左側「Solidity Compiler」 → 點擊 Compile SeaSeriesInterfaceCaller.sol
	4.	前往「Deploy & Run Transactions」：
	•	Environment：選擇 Injected Provider - MetaMask
	•	在 Contract 中選擇 SeaSeriesInterfaceCaller
	•	點擊 Deploy 進行部署（部署的是介面合約，與主合約地址已綁定）

⸻

🔐 操作說明

✅ 1. USDT 授權 approveToken(uint256 amount)

功能：授權主合約扣款使用 USDT

	•	輸入 amount（單位為 wei，例如 100 USDT 輸入 100000000000000000000）
	•	點擊 approveToken 發送交易
	•	成功後可進行存款

🧠 建議初次授權較大金額（如 1000000000000000000000000）

⸻

💵 2. 存款 deposit(uint256 amount)

功能：將 USDT 存入合約參與獲利

	•	確保已授權
	•	輸入要投資的金額（單位為 wei）
	•	點擊 deposit 發送交易
	•	存款後可開始計息並參與團隊收益

⸻

🪢 3. 綁定推薦人 bind(address referrer)

功能：綁定上級推薦人，啟用團隊分潤結構

	•	僅能操作一次，無法修改
	•	輸入推薦人錢包地址（需為已投資用戶）
	•	點擊 bind 發送交易

⚠️ 若在存款前未綁定推薦人，將無法參與團隊獎勵結構（不會自動綁定）

⸻

💸 4. 提領本金 withdraw(uint256 amount, string password)

功能：從本金中提領資金

	•	輸入欲提領金額（單位為 wei）
	•	輸入已設定的提領密碼（由用戶自行設定，與地址結合成雜湊保存在鏈上）
	•	點擊 withdraw 發送交易

🚨 若密碼錯誤將直接報錯，請確保密碼正確無誤

⸻

🎁 5. 提領利息與推薦獎勵 withdrawInterestAndReward(string password)

功能：提取累積的利息與推薦/團隊獎勵

	•	輸入密碼（與提領本金使用相同）
	•	點擊 withdrawInterestAndReward 發送交易
	•	成功後利息與獎勵將轉至錢包

