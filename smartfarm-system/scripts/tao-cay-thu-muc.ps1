# tao-cay-thu-muc.ps1 - Chuc nang 1: khoi tao "can cu so"
# Chay tu thu muc CHA cua smartfarm-system, vi du:
#   powershell -ExecutionPolicy Bypass -File .\smartfarm-system\scripts\tao-cay-thu-muc.ps1
# Moi lenh dung duong dan tuong doi, khong dung duong dan tuyet doi theo o dia

# Buoc 1: MOT dong lenh duy nhat tao thu muc goc + 4 thu muc con
New-Item -ItemType Directory -Force -Path smartfarm-system\docs, smartfarm-system\scripts, smartfarm-system\data, smartfarm-system\backup | Out-Null

# Buoc 2: dung trong data\ , tao .env o thu muc goc bang duong dan tuong doi (..)
Set-Location smartfarm-system\data
Set-Content -Path ..\.env -Value "DB_PASSWORD=demo_123456"

# Buoc 3: dat thuoc tinh Hidden cho .env
(Get-Item ..\.env -Force).Attributes = 'Hidden'

# Kiem tra (-Force de thay ca tep an)
Get-ChildItem .. -Force
Set-Location ..\..
