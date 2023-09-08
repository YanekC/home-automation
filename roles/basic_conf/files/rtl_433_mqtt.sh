#!/bin/bash
rtl_433 -v -F "mqtt://localhost:1883,user=$MQTT_USER_RTL_SDR,pass=$MQTT_PASSWD_RTL_SDR,devices=rtl_433[/id]" -T 5m