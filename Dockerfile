FROM arm64v8/eclipse-temurin:17
EXPOSE 8080
COPY *.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]