# He thong quan tri SmartFarm

He thong loc nhat ky (log) may chu va doi soat thiet bi cac tram cam bien ngoai trang trai.

## Cau truc thu muc

```
smartfarm-system/
├── docs/       # Tai lieu: README.md
├── scripts/    # Xu ly: auto_report.ps1
├── data/       # Du lieu: log-he-thong.log, quan-ly-thiet-bi.xlsx
├── backup/     # Luu tru: bao-cao-su-co.txt
└── .env        # Cau hinh (tep an)
```

## Huong dan chay script

Mo PowerShell, di chuyen vao thu muc `scripts` va chay:

```powershell
cd smartfarm-system\scripts
.\auto_report.ps1
```

Neu bi chan boi ExecutionPolicy:

```powershell
powershell -ExecutionPolicy Bypass -File .\auto_report.ps1
```

Ket qua duoc noi them (`>>`) vao `backup/bao-cao-su-co.txt`.

## Checklist kiem tra thiet bi

- [x] Kiem tra ket noi cac tram cam bien
- [ ] Kiem tra pin cac tram ngoai dong
- [ ] Kiem tra dung luong RAM con trong
- [ ] Sao luu bao cao vao `backup/`

## Bang thong so phan cung

| Ten thiet bi | Don gia (VND) | Loai storage |
|--------------|--------------:|--------------|
| Raspberry Pi 4 4GB | 1.500.000 | SSD |
| Mini PC Intel N100 | 3.200.000 | SSD |
| Industrial Gateway X1 | 4.800.000 | HDD |

## Phan tich he thong

### Input - Process - Output cua chuc nang loc log

| Thanh phan | Noi dung |
|------------|----------|
| **Input** | Tep `data/log-he-thong.log` (nhat ky may chu, moi dong: ngay gio, muc do, thiet bi, noi dung) |
| **Process** | Script `auto_report.ps1`: `Get-Content` -> Pipeline (`\|`) -> `Select-String` loc dong `CRITICAL`/`ERROR` -> `Measure-Object` dem so dong loi |
| **Output** | Tep `backup/bao-cao-su-co.txt` gom tieu de, cac dong su co va dong `TONG SO SU CO:` |

### Phan loai DIKW

| Phat bieu | Tang DIKW | Ly do |
|-----------|-----------|-------|
| (a) "Quyet dinh thay modem tram sensor-03 truoc thu Sau." | **Wisdom** | La quyet dinh hanh dong dua tren hieu biet da co |
| (b) "2026-10-12 08:15:01 [ERROR] sensor-03 Connection TIMEOUT after 30s" | **Data** | Mot dong log tho, chua duoc xu ly hay giai thich |
| (c) "Hom nay he thong ghi nhan 8 su co, trong do 4 su co den tu tram sensor-03." | **Information** | Du lieu da duoc loc va thong ke, tra loi "bao nhieu, o dau" |
| (d) "Tram sensor-03 hay mat ket noi vao buoi chieu do song yeu, nen can lap them anten." | **Knowledge** | Nhan ra quy luat va nguyen nhan tu thong tin |

Thu tu tu thap len cao: Data (b) -> Information (c) -> Knowledge (d) -> Wisdom (a).

## Bay phan cung

Tai tep log 500 MB qua mang 100 Mbps mat bao lau?

- Don vi mang tinh bang **bit**, dung luong tep tinh bang **byte**; 1 byte = 8 bit.
- Quy doi Mbps sang MB/s: chia cho 8 (he so 8).
  - 100 Mbps / 8 = **12,5 MB/s**
- Thoi gian tai = dung luong / toc do:
  - 500 MB / 12,5 MB/s = **40 giay**

Ket qua: mat khoang **40 giay** (ly thuyet, chua tinh hao hut duong truyen).
