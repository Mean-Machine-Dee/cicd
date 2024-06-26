FROM maven:3.8.3-openjdk-17 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn clean package -DskipTests

# Package stage
FROM arm64v8/eclipse-temurin:17
COPY --from=build /home/app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
