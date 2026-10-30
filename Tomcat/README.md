ProgressSoft Tomcat Environment

Project Overview

This project automates the setup of an Ubuntu virtual machine using Vagrant and VirtualBox, then installs and configures Java 8 and Apache Tomcat 9.

Environment

* Operating System: Ubuntu 24.04
* Virtualization: Oracle VirtualBox
* Provisioning Tool: Vagrant
* Java Version: Java 8 (Eclipse Temurin)
* Application Server: Apache Tomcat 9.0.108
* Tomcat Port: 7070
* Host Port: 9090

Project Files

* Vagrantfile: Defines the virtual machine, hostname, provider, memory, CPU, and port forwarding.
* provision.sh: Automates Java 8 and Tomcat installation and configuration.

Implementation

1. Created an Ubuntu virtual machine using Vagrant and VirtualBox.
2. Installed Java 8 (Eclipse Temurin).
3. Created a dedicated tomcat system user.
4. Installed Apache Tomcat 9.0.108.
5. Changed the Tomcat listening port from 8080 to 7070.
6. Created a systemd service to manage Tomcat.
7. Configured port forwarding from guest port 7070 to host port 9090.
8. Configured Nginx as a reverse proxy to forward HTTP requests to Tomcat.
9. Configured the local hostname tomcat.progresssoft.local.

Verification and Results

The following checks were completed successfully:

* Vagrant VM status: running (virtualbox).
* Tomcat service status: active (running).
* Tomcat service startup: enabled.
* HTTP request to http://localhost:7070: HTTP/1.1 200.
* Nginx configuration test: successful.
* HTTP request through Nginx: HTTP/1.1 200.
* Tomcat welcome page was accessible through the configured local hostname.

Run the Environment

From the project directory:

vagrant up

Connect to the virtual machine:

vagrant ssh

Check Tomcat:

sudo systemctl status tomcat --no-pager

Test Tomcat:

curl -I http://localhost:7070

Notes

The VM uses 2048 MB of memory and 1 CPU core as configured in the Vagrantfile.

The installation and configuration steps are automated through provision.sh.



ProgressSoft Tomcat Environment

Project Overview

This project sets up an Ubuntu virtual machine using Vagrant and VirtualBox, installs Java 8 and Apache Tomcat 9, and configures Tomcat to run as a systemd service.

Environment Configuration

* Base Box: Bento Ubuntu 24.04
* Hostname: progresssoft-tomcat
* Provider: VirtualBox
* Memory: 2048 MB
* CPU: 1 core

Network Configuration

Guest Port	Host Port	Purpose
22	2222	SSH
7070	9090	Apache Tomcat

Tomcat is accessible from the host machine at:

http://localhost:9090

Installed Software

* Java 8 (Eclipse Temurin)
* Apache Tomcat 9.0.108

Provisioning

The provision.sh script automates:

1. Updating Ubuntu packages.
2. Installing required utilities.
3. Downloading and configuring Java 8.
4. Creating a dedicated Tomcat user.
5. Installing Apache Tomcat 9.0.108.
6. Changing Tomcat’s port from 8080 to 7070.
7. Creating and enabling a systemd service.
8. Starting the Tomcat service.

Verification Results

* Vagrant VM status: Running.
* Tomcat systemd service: Active (running).
* Tomcat HTTP response on port 7070: HTTP/1.1 200.
* Apache Tomcat welcome page successfully displayed through the host port 9090.

Project Files

* Vagrantfile – Virtual machine configuration.
* provision.sh – Automated installation and configuration script.
* README.md – Project documentation.



Tomcat and Nginx Configuration

1. Java and Apache Tomcat Installation

* Installed Java 8 (Eclipse Temurin).
* Installed Apache Tomcat 9.0.108.
* Created a dedicated tomcat system user.
* Configured Tomcat as a systemd service and enabled automatic startup.

2. Tomcat Port Configuration

* Changed the default Tomcat port from 8080 to 7070.
* Verified that Tomcat responds successfully on port 7070 using curl.

3. Nginx Reverse Proxy

* Configured Nginx to listen on port 80.
* Configured proxy_pass to forward requests to http://127.0.0.1:7070.
* Configured the hostname tomcat.progresssoft.local.
* Verified the Nginx and Tomcat connection.

4. Verification

* Tomcat service status: Active (running).
* Tomcat HTTP response: 200 OK.
* Nginx listens on port 80 and forwards requests to Tomcat on port 7070.

Project Files

* Vagrantfile: Defines the Ubuntu 24.04 virtual machine, VirtualBox provider, memory, CPU, hostname, and forwarded ports.
* provision.sh: Automates Java 8 and Apache Tomcat 9 installation and configuration.
* README.md: Documents the project setup and implementation.