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

### Security

You may want to enable security for your Jenkins instance. This can be done by
visiting http://localhost:8080/configureSecurity

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

### Publish dashboard over SSH

In order to publish the dashboard over SSH your private key will need to be
added to the configuration. The jobs are configured to push to a
people.mozilla.org account. For this to work you will need to do the following:

1. Open http://localhost:8080/configure via your web browser.
2. In the section "Publish over SSH" locate the people.mozilla.org server and
enter the username.
3. Click "Advanced" and enter the appropriate username, passphrase, and key.

You can also set these details globally, or change the name/hostname to publish
to an alternate server.
