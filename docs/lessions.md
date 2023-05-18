## Thứ tự config flutter app

### <ins>Tạo app</ins>

`flutter create [name] --platforms android --org com.tauari`

### <ins>Thay app name</ins>

Trong file android/app/src/main/AndroidManifest.xml, thay gía trị của android:label

### <ins>Thay đổi ndk version</ins>
Trong file android/app/build.gradle, thay đổi mục ndkVersion:
```
ndkVersion "25.2.9519653"
```

### <ins>Thay gradle version
Trong file android/build.gradle, thay nội dung sau ở vị trí của nó
```
classpath 'com.android.tools.build:gradle:7.3.1'
```
Trong file android/gradle/wrapper/gradle-wrapper.properties, thay version của distribution thành
```
gradle-7.4-all.zip
```
### <ins>Thay targetSdkVersion vaf minSdkVersion</ins>
Trong android/local.properties thêm 2 hàng sau:
```
  flutter.targetSdkVersion=33
  flutter.minSdkVersion=21
```
Trong file android/app/build.gradle, thay đổi ở mục defaultConfig
```
  targetSdkVersion localProperties.getProperty('flutter.targetSdkVersion').toInteger()
  minSdkVersion localProperties.getProperty('flutter.minSdkVersion').toInteger()
```

### <ins>Thay app version va version code</ins>
Trong file pubspec.yaml, thay gía trị của version

### <ins>Giảm dung lượng appbundle</ins>
Trong file android/gradle.properties, phải chứa các nội dung sau:
```
org.gradle.jvmargs=-Xmx1536M
android.useAndroidX=true
android.enableJetifier=true
extra-gen-snapshot-options=--obfuscate
android.enableR8.fullMode=true
android.bundle.enableUncompressedNativeLibs=true
```

Thêm file android/app/proguard-rules.pro với nội dung:
```
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class com.google.firebase.** { *; }
-dontwarn io.flutter.embedding.**
-ignorewarnings
```

Trong file android/app/build.gradle thay đổi ở mục buildTypes
```
  release {
      signingConfig signingConfigs.release
      minifyEnabled true
      shrinkResources true
      proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
  }
  debug {
      signingConfig signingConfigs.release
      minifyEnabled false
      shrinkResources false
      proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
  }
```

### <ins>Ký ứng dụng</ins>

Thêm file android/keystore.properties với nội dung sau:
```
storeFile=/home/hint/Lab/keystore_sign_android_app/keystore_2021_new_format.jks
storePassword=.071587@abc123
keyAlias=key0
keyPassword=.071587@abc123
```

Thêm vào file .gitignore nội dung sau:
```
/android/keystore.properties
```

Trong file android/app/build.gradle, thêm nội dung sau vào trước (bên ngoài) phần android
```
def keystorePropertiesFile = rootProject.file("keystore.properties")
def keystoreProperties = new Properties()
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
```

Thêm nội dung sau vào phần android

```
  signingConfigs {
      release {
          storeFile file(keystoreProperties.getProperty('storeFile'))
          storePassword keystoreProperties.getProperty('storePassword')
          keyAlias keystoreProperties.getProperty('keyAlias')
          keyPassword keystoreProperties.getProperty('keyPassword')
      }
  }
```
## Build app bundle

`flutter build appbundle`

## Versions working
```
kotlin_version = '1.7.10'
classpath 'com.android.tools.build:gradle:7.3.1'
classpath 'com.google.gms:google-services:4.3.15'
gradle-7.4-all.zip
ndkVersion "25.2.9519653"
``