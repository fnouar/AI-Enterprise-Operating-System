plugins {
  id("org.jetbrains.kotlin.jvm") version "1.9.22" apply false
  id("org.springframework.boot") version "3.4.0" apply false
  id("io.spring.dependency-management") version "1.1.0" apply false
}

allprojects {
  repositories {
    mavenCentral()
  }
}
