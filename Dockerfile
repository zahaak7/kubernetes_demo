FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/car-service-1.0.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
