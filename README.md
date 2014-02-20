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
* `NOTIFICATION_ADDRESS` - e-mail address to send build failure notifications
* `WIFI_SSID` - SSID for the WiFi network to connect to
* `WIFI_SECURITY` - Security type for the WiFi network (WEP or WPA-PSK)
* `WIFI_PASSWORD` - Password for the WiFi network

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

In order to publish the dashboard over SSH a private key and server will need
be added to the configuration. Open http://localhost:8080/configure via your
web browser and locate the section "Publish over SSH".

Once the server has been configured, you will also need to configure the jobs.
This is done by adding the 'Send build artifacts over SSH' action under the
'Post-build Actions' section.

For additional help configuring this feature see the plugin's
[documentation](https://wiki.jenkins-ci.org/display/JENKINS/Publish+Over+SSH+Plugin#PublishOverSSHPlugin-Configure).
