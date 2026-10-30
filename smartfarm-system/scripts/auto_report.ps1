# auto_report.ps1 - Robot loc log tu dong SmartFarm
# Chay tu thu muc scripts:  .\auto_report.ps1
# Neu bi chan ExecutionPolicy:
#   powershell -ExecutionPolicy Bypass -File .\auto_report.ps1
# AUDIT: xac nhan da tham dinh script, khong chua lenh xoa hang loat

# Duong dan TUONG DOI (tu thu muc scripts di len .. roi vao data / backup)
$Log = "..\data\log-he-thong.log"
$Report = "..\backup\bao-cao-su-co.txt"

# 1. Tieu de bao cao (khong dau de tranh loi font), ngay gio lay bang Get-Date
Write-Output "===== BAO CAO SU CO SMARTFARM =====" >> $Report
Write-Output "Thoi gian chay: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')" >> $Report

# 2. Pipeline: Get-Content | Select-String, noi them (>>) vao bao cao
Get-Content $Log | Select-String -Pattern "CRITICAL|ERROR" >> $Report

# 3. Pipeline dem so dong loi bang Measure-Object, ghi duoi dong TONG SO SU CO:
Write-Output "TONG SO SU CO:" >> $Report
(Get-Content $Log | Select-String -Pattern "CRITICAL|ERROR" | Measure-Object).Count >> $Report

Write-Output "Hoan tat loc log. Bao cao: $Report"
