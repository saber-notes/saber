group = "com.example.onyxsdk_pen"
version = "1.0-SNAPSHOT"

buildscript {
    val kotlinVersion = "2.3.20"
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:8.9.1")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        // These need to be added to your project's android/build.gradle file.
        maven("https://jitpack.io")
        maven("http://repo.boox.com/repository/maven-public/") {
            isAllowInsecureProtocol = true
        }
    }
}

plugins {
    id("com.android.library")
}

android {
    namespace = "com.example.onyxsdk_pen"

    compileSdk = 36

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
        }
    }

    defaultConfig {
        minSdk = 24
    }

    dependencies {
        implementation("com.onyx.android.sdk:onyxsdk-device:1.3.4")
        implementation("com.onyx.android.sdk:onyxsdk-pen:1.5.4")
        implementation("org.lsposed.hiddenapibypass:hiddenapibypass:6.1")
    }

    buildTypes {
        release {
            consumerProguardFile("proguard-android.txt")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}
