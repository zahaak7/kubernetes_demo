FROM alpine:latest
RUN apk add --no-cache openjdk17-jre-headless
WORKDIR /app
COPY target/car-service-1.0.jar app.jar
CMD ["java", "-jar", "app.jar"]
