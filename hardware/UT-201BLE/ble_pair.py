#!/usr/bin/env python3

import asyncio
from bleak import discover, BleakClient
from datetime import datetime
import struct

TEMP_MEASURE_UUID = ("00002a1c-0000-1000-8000-00805f9b34fb")
DATETIME_UUID = ("00002a08-0000-1000-8000-00805f9b34fb")
CUSTOM_CHARA_UUID = ("233bf001-5a34-1b6d-975c-000d5690abe4")

def callback_discon(client):
    print("Client with address {} got disconnected!".format(client.address))

async def run(loop):
    # discover
    devices = await discover()
    ut_201ble = [d for d in devices if "A&D_UT201BLE" in d.name]

    if len(ut_201ble) <= 0:
        print("UT-201 Not found...")
        return
    
    # First found device's address
    address = ut_201ble[0].address
    
    # pair
    async with BleakClient(address, loop=loop) as client:
        client.set_disconnected_callback(callback_discon)
        # await client.pair()
        x = await client.is_connected()
        if not x:
            print("Connect failed.")
            return
        
        print("Device Connected")

        # Write curernt datetime
        print("Writing Datetime")

        now = datetime.now()
        byte_year = struct.pack("<H", now.year)
        byte_month = struct.pack("B", now.month)
        byte_day = struct.pack("B", now.day)
        byte_hour = struct.pack("B", now.hour)
        byte_minute = struct.pack("B", now.minute)
        byte_second = struct.pack("B", now.second)
        write_value = byte_year + byte_month + byte_day + \
            byte_hour + byte_minute + byte_second
        await client.write_gatt_char(DATETIME_UUID, bytearray(write_value))

        # Disconnect
        print("Disconnect Request")
        write_value = bytearray(b'\x02\x01\x03')
        await client.write_gatt_char(CUSTOM_CHARA_UUID, write_value)

        await asyncio.sleep(5.0)


loop = asyncio.get_event_loop()
loop.run_until_complete(run(loop))
