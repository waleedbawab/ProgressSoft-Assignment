#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y curl wget tar

# Install Java 8 (Eclipse Temurin)
mkdir -p /opt/java8
wget -q -O /tmp/temurin8.tar.gz \
  "https://api.adoptium.net/v3/binary/latest/8/ga/linux/x64/jdk/hotspot/normal/eclipse"

tar -xzf /tmp/temurin8.tar.gz -C /opt/java8 --strip-components=1

# Configure Java environment
cat > /etc/profile.d/java8.sh <<'EOF'
export JAVA_HOME=/opt/java8
export PATH=$JAVA_HOME/bin:$PATH
EOF

export JAVA_HOME=/opt/java8
export PATH=$JAVA_HOME/bin:$PATH

# Create Tomcat user
useradd --system --home /opt/tomcat --shell /usr/sbin/nologin tomcat || true

# Install Apache Tomcat 9
TOMCAT_VERSION=9.0.108
wget -q -O /tmp/tomcat.tar.gz \
  "https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz"

mkdir -p /opt/tomcat
tar -xzf /tmp/tomcat.tar.gz -C /opt/tomcat --strip-components=1

chown -R tomcat:tomcat /opt/tomcat
chmod +x /opt/tomcat/bin/*.sh

# Change Tomcat port to 7070
sed -i 's/port="8080"/port="7070"/' /opt/tomcat/conf/server.xml

# Create systemd service
cat > /etc/systemd/system/tomcat.service <<'EOF'
[Unit]
Description=Apache Tomcat 9
After=network.target

[Service]
Type=forking
Environment=JAVA_HOME=/opt/java8
Environment=CATALINA_HOME=/opt/tomcat
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
User=tomcat
Group=tomcat
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable tomcat
systemctl start tomcat

echo "Java 8 and Apache Tomcat 9 installation completed."