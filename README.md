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
* `B2G_BUILD_USERNAME` - username for accessing B2G builds
* `DASHBOARD_REMOTE_PATH` - path to use on the remote dashboard server
* `DASHBOARD_SERVER` - dashboard server IP or hostname
* `DASHBOARD_URL` - address of the remote dashboard
* `DASHBOARD_USERNAME` - username for the remote dashboard server
* `NDK_PATH` - path to Android NDK
* `NOTIFICATION_ADDRESS` - e-mail address to send build failure notifications
* `WIFI_SSID` - SSID for the WiFi network to connect to
* `WIFI_SECURITY` - security type for the WiFi network (WEP or WPA-PSK)

### Credentials

Open http://localhost:8080/configure via your web browser. In the section
"Global passwords" add the following entries:

* `B2G_BUILD_PASSWORD` - password for accessing B2G builds
* `WIFI_PASSWORD` - password for the WiFi network

For any download jobs to succeed a username and password must be added to the
job's configuration. Open each download job and click "Configuration". In the
"Build Triggers" section, click the "Advanced" button under "[URLTrigger]" and
enter the username and password under "Basic Authentication"
