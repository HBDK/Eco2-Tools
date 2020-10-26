# eco2-Tools

This is a collection of tools needed to use Danfoss's Eco 2 thermostats with home-assistant.

This project packages the work of [Keton](https://github.com/keton/etrv2mqtt) and [AdamStrojek](https://github.com/AdamStrojek/libetrv) to make it easy to use with home assistant.

Read [installing third party addons](https://www.home-assistant.io/hassio/installing_third_party_addons/) for the a description of how to add this repository to Home assistant

## Use

The etrv2mqtt is the main add-on here and it is meant to run all the time.

etrv-keytool and etrv-scan are booth tools meant to only run when you need to add a new thermostat.

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

consult the documentation each add on for more details.

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
