FROM maven:3.9-eclipse-temurin-17 AS  builder
WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTest
FROM tomcat:9-jdk17-temurin
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh","run"]
