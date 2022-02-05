## Getting started

1. Use the ertv-scan tool to get the mac address of the thermostat you would like to pair.
2. paste mac adress in the setting of the etrv-keytool.
3. start the etrv-keytool and switch to the log page
4. on the log page pres refresh until you see somthing like this:
    ```
    2020-09-26 13:46:07.193 | DEBUG    | libetrv.device:connect:54 - Trying connect to 00:04:2f:95:54:5a
    ```
5. press the clock button on the thermostat and refresh the log page to see the key.
6. paste the mac address and key in the config of etrv2mqtt

## Configuration

the default config:

```yaml
thermostats:
  - topic: ''
    address: ''
    secret_key: ''
mqtt:
  server: localhost
  port: 1883
  user: ''
  password: ''
  base_topic: etrv
options:
  poll_interval: 3600
  retry_limit: 5
  stay_connected: false
  report_room_temperature: true
  setpoint_debounce_time: 3
```

### schema

thermostats:
  - topic: ''
    address: ''
    secret_key: ''
mqtt:
  server: localhost
  port: 1883
  user: ''
  password: ''
  base_topic: etrv
options:
  poll_interval: 3600
  retry_limit: 5
  stay_connected: false
  report_room_temperature: true
  setpoint_debounce_time: 3
* thermostats: `list`
    - topic: `str`
        * The desired name of the topic for this thermostat (will also be the name i home assistant)
    - address: `str`
        * Mac address of the thermostat
        * Can be obtianed with ertv-scan
    - secret_key: `str`
        * The secret key
        * Can be obtianed with ertv-keyttol
* mqtt:
    - server: `str`
        * *optional*
        * default: localhost
        * Hostname or Ip of the mqtt server
    - port: `int`
        * *required*
        * default: 1883
        * Integer between 1 and 65534
    - user: `str`
        * *optional*
        * default: `empty`
        * Username
    - password: `str`
        * *optional*
        * default: `empty`
        * Password
    - base_topic: `str`
        * *optional*
        * default: *etrv*
        * Base topic for the add-on
    - autodiscovery: `bool?`
        * *optional*
        * default: `true`
        * Automatically add thermostats to Home assistant
    - autodiscovery_topic: `str`
        * *optional*
        * default: *homeassistant*
        * Base topic for autodiscovery, this should match the topic homeassistant is watching
    - autodiscovery_retain: `bool`
        * *optional*
        * default: `true`
        * Set retain bit on autodiscover messages
    - hass_birth_topic: `str`
        * *optional*
        * default: *hass/status*
        * Home assistant birth message (program started) topic
    - hass_birth_payload: `str`
        * *optional*
        * default: *online*
        * Home assistant birth message payload
* options:
    - poll_interval: `int`
        * *optional*
        * default: `3600`
        * Integer 1 or larger
        * The time in seconds between fetching thermostat values
    - retry_limit: `int`
        * *optional*
        * default: `5`
        * Integer 0 or larger
        * Limit of BLE connect attempts
    - stay_connected: `bool`
        * *optional*
        * default: `false`
        * Set to true in order to leave BLE connection running after polling thermostat data or setting temperature. May drain battery.
    - report_room_temperature: `bool`
        * *optional*
        * default: `true`
        * Set to false to disable reporting current room temperature as a separate Home Assistant sensor in MQTT auto discovery
    - setpoint_debounce_time: `int`
        * *optional*
        * default: `3`
        * Integer 1 or larger
        * How many times to retry fetching data before skipping this thermostat until next poll


### example


```yaml
thermostats:
  - topic: Bathroom
    address: 'xx:xx:xx:xx:xx:xx'
    secret_key: 9dbf3fe...........c84575a4425ea0
  - topic: Kitchen
    address: 'xx:xx:xx:xx:xx:xx'
    secret_key: d5fffefa0...............1c2a3279
mqtt:
  server: 192.168.3.11
  port: 1883
  user: mesupersecretmqttuser
  password: mesupersecretmqttpassword
options:
  poll_interval: 3600
  retry_limit: 5
  stay_connected: false
  report_room_temperature: true
  setpoint_debounce_time: 3
```

## License

MIT License

Copyright (c) 2020 Harald Bildsøe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.