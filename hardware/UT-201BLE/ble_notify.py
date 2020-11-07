#!/usr/bin/env python3

import asyncio
from bleak import discover, BleakClient
from datetime import datetime
import struct
import math

TEMP_MEASURE_UUID = ("00002a1c-0000-1000-8000-00805f9b34fb")
DATETIME_UUID = ("00002a08-0000-1000-8000-00805f9b34fb")
CUSTOM_CHARA_UUID = ("233bf001-5a34-1b6d-975c-000d5690abe4")

def callback_discon(client):
    print("Client with address {} got disconnected!".format(client.address))

def callback_notify(sender: int, data: bytearray):
    print(f"{sender}: {data}")

    flags = data[0]
    index = 1
    result = {}

    if flags & 0x01:
        result['fahrenheit'] = readFloatLE(data, index)
        index += 4
    else:
        result['celsius'] = readFloatLE(data, index)
        index += 4
    
    if flags & 0x02:
        result['date'] = {
            'year': int.from_bytes(data[index:index+2], 'little'),
            'month': data[index+2],
            'day': data[index+3],
            'hour': data[index+4],
            'minute': data[index+5],
            'second': data[index+6],
        }
        index += 7

    if flags & 0x04:
        types = [
            "unknown",
            "Armpit",
            "Body",
            "Ear",
            "Finger",
            "Gastro-intestinal Tract",
            "Mouth",
            "Rectum",
            "Toe",
            "Tympanum",
        ]
        value = data[index]
        index+=1
        result['temperatureType'] = types[value]

    print(result)

def readFloatLE(buffer, index):
    data = int.from_bytes(buffer[index:index+4], 'little')
    mantissa = data & 0x00ffffff
    if ((mantissa & 0x00800000) > 0):
      mantissa = -1 * (~(mantissa - 0x01) & 0x00ffffff)

    # exponenxtial = (data >> 24) & 0xff
    exponential = 1
    return mantissa * math.pow(10, exponential)

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
        x = await client.is_connected()
        if not x:
            print("Connect failed.")
            return
        
        print("Device Connected")

        print("Send all data command")
        # write command 'Send all data'
        write_value = bytearray(b'\x02\x00\xe1')
        await client.write_gatt_char(CUSTOM_CHARA_UUID, write_value)
        
        print("Writing Datetime")
        # Write curernt datetime
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

        print("Starting Notify...")
        # Notify callback func
        await client.start_notify(TEMP_MEASURE_UUID, callback_notify)

        await asyncio.sleep(5.0)

        await client.disconnect()

loop = asyncio.get_event_loop()
loop.run_until_complete(run(loop))
