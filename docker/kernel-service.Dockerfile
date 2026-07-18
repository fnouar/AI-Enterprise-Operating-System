FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY backend/kernel-service/build/libs/kernel-service-0.1.0.jar ./kernel-service.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "kernel-service.jar"]
