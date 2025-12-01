# PowerShell Implementation

PowerShell によるアルゴリズムの実装例です。

## 実行環境
- **Shell**: PowerShell Core (pwsh) 7.x 推奨, または Windows PowerShell 5.1
- **実行ポリシー**: スクリプト実行が許可されていること (`Set-ExecutionPolicy RemoteSigned` 等)

## テスト環境
- **テストフレームワーク**: `Pester` 5.x 以上推奨

## 環境構築

Pester モジュールが必要です。

```powershell
Install-Module -Name Pester -Force -SkipPublisherCheck
```

## テスト実行

```powershell
Invoke-Pester
```
