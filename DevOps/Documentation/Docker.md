Docker Implementation – ProgressSoft Assignment

1. Objective

The objective of this task was to containerize an Apache Tomcat web application using Docker, build a Docker image, run it inside a container, and publish the image to Docker Hub.

2. Environment and Tools

* GitHub Codespaces
* Docker CLI
* Apache Tomcat 9
* Java 8
* Docker Hub

3. Project Structure

DevOps/
└── Docker/
    ├── Dockerfile
    ├── sample.war
    └── sample-app/
        ├── index.html
        └── WEB-INF/

4. Dockerfile Configuration

The Dockerfile uses the tomcat:9.0-jdk8-temurin base image.

The configuration performs the following operations:

1. Removes the default Tomcat web applications.
2. Copies sample.war into Tomcat’s web applications directory as ROOT.war.
3. Exposes port 8080.
4. Starts Tomcat using catalina.sh run.

5. WAR Application

A sample static web application was created with an HTML page displaying:

ProgressSoft DevOps Assignment

The WAR package was generated using:

jar -cvf sample.war -C sample-app .

The generated WAR file was approximately 668 bytes.

6. Docker Image Build

The Docker image was built using:

docker build -t progresssoft-tomcat:1.0 .

The image was verified using:

docker images

The image was successfully created with the tag progresssoft-tomcat:1.0.

7. Running the Container

The container was started using:

docker run -d --name progresssoft-tomcat-container -p 8080:8080 progresssoft-tomcat:1.0

The running container was verified using:

docker ps

The container status showed that it was running, with port 8080 mapped between the host and container.

8. Docker Hub Integration

A Docker Hub account was created and authenticated through the Docker CLI.

Authentication command:

docker login

The image was tagged and published to Docker Hub:

docker tag progresssoft-tomcat:1.0 waleedev123/progresssoft-tomcat:1.0
docker push waleedev123/progresssoft-tomcat:1.0

The image was successfully pushed to Docker Hub.

Repository:

waleedev123/progresssoft-tomcat

9. Pull and Deployment Verification

The published image was pulled successfully:

docker pull waleedev123/progresssoft-tomcat:1.0

The previous container was removed:

docker rm -f progresssoft-tomcat-container

A new container was created using the Docker Hub image:

docker run -d --name progresssoft-tomcat-container -p 8080:8080 waleedev123/progresssoft-tomcat:1.0

10. Final Test Result

The application was accessed through the GitHub Codespaces forwarded port 8080.

The browser successfully displayed:

ProgressSoft DevOps Assignment

Tomcat WAR deployment is working successfully!

This confirms that the Docker image was built, published, pulled, and successfully used to run the web application.

11. Conclusion

The Docker containerization task was successfully implemented and tested. The application was packaged as a WAR file, deployed to Apache Tomcat inside a Docker container, and the resulting image was published to Docker Hub.

12. Nginx Reverse Proxy Configuration

Nginx was deployed in a separate Docker container to act as a reverse proxy for the Apache Tomcat application.

Nginx Configuration

* Listening port: 80
* Host port: 8081
* Backend server: Tomcat
* Backend address: http://172.17.0.2:8080

The Nginx configuration forwards incoming HTTP requests to the Tomcat container using the proxy_pass directive.

Verification

The following command was executed:

curl http://localhost:8081

Result: The request successfully returned the ProgressSoft application HTML page hosted on Tomcat.

This confirms that Nginx successfully forwarded the HTTP request to the Tomcat application.