# UT-201BLE
FlutterからのBLE実装で試行すると切り分けができないので、初めにMacOS上のPythonからBleakを使って体温計読み出しを行った。

## 使い方
1. 体温計をペアリングモードにしてから `ble_pair` でペアリング処理を行う
2. ペアリング完了後、自動的に体温計の電源が切れるので、電源を入れ直す
3. 体温計測を行い、計測完了して脇から取り出し、音が鳴ったら `ble_norify.py` で体温情報取得

## 調査結果

### Service Scan Log

|Service Name|UUID|
|-|-|
| HEALTH_SERVICE_UUID | ("00001809-0000-1000-8000-00805f9b34fb") |
| DEVICE_SERVICE_UUID | ("0000180a-0000-1000-8000-00805f9b34fb") |
| BATTERY_SERVICE_UUID | ("0000180f-0000-1000-8000-00805f9b34fb") |
| CUSTOM_SERVICE_UUID | ("233bf000-5a34-1b6d-975c-000d5690abe4") |

### Characteristics Scan Log
- 00002a1c-0000-1000-8000-00805f9b34fb: Temperature Measurement
- 00002a1d-0000-1000-8000-00805f9b34fb: Temperature Type
- 00002a08-0000-1000-8000-00805f9b34fb: Date Time
- 00002a29-0000-1000-8000-00805f9b34fb: Manufacturer Name String
- 00002a24-0000-1000-8000-00805f9b34fb: Model Number String
- 00002a25-0000-1000-8000-00805f9b34fb: Serial Number String
- 00002a27-0000-1000-8000-00805f9b34fb: Hardware Revision String
- 00002a26-0000-1000-8000-00805f9b34fb: Firmware Revision String
- 00002a28-0000-1000-8000-00805f9b34fb: Software Revision String
- 00002a23-0000-1000-8000-00805f9b34fb: System ID
- 00002a2a-0000-1000-8000-00805f9b34fb: IEEE 11073-20601 Regulatory Cert. Data List
- 00002a19-0000-1000-8000-00805f9b34fb: Battery Level
- 233bf001-5a34-1b6d-975c-000d5690abe4: Unknown
