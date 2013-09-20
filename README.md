# Eideticker CI

Continuous integration for the
[Eideticker](https://github.com/mozilla/eideticker) project.

## Setup

You will need to have a fully functioning Eideticker setup as covered in that
project's
[README](https://github.com/mozilla/eideticker/blob/master/README.md).

## Startup

    git clone git://github.com/davehunt/eideticker-ci.git
    cd eideticker-ci
    ./start.sh

## Configuration

Once Jenkins has been fully started, you will have configure it.

### Environment

Open http://localhost:8080/configure via your web browser. In the section
"Global properties" update the following entries:

* `ADB_PATH` - path to Android Debug Bridge (ADB)
* `NDK_PATH` - path to Android NDK
* `WIFI_OPTIONS` - Optional arguments for connecting to an available WiFi network
* `WIFI_SSID` - SSID for the WiFi network to connect to

The `WIFI_OPTIONS` variable is used by the
[Gaia Command Line Interface](https://github.com/davehunt/gcli)
tool, and accepts the format:
`[--security {WPA-PSK,WEP}] [--password PASSWORD]`

### Credentials

For any download jobs to succeed a username and password must be added to the
job's configuration. Open each download job and click "Configuration" then
do the following:

1. Enter the username in the "Properties Content" area in the format
   `USERNAME=<username>`
2. In the "Build Triggers" section, click the "Advanced" button under
   "[URLTrigger]" and enter the username and password under "Basic Authentication"
3. In the "Build Environment" section, enter the password under in "Job 
   passwords"
