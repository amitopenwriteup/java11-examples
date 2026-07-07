# Use official Maven image with Java 17 JDK and Maven 3.6.3
FROM maven:3.9-eclipse-temurin-11

# Set working directory
WORKDIR /app

# Copy pom.xml
COPY pom.xml .

# Copy source code
COPY src ./src

# Build the project
RUN mvn clean package

# Run the application
CMD ["java", "-jar", "target/*.jar"]



