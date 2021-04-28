# 测试

## Android 端
### 1. 配置 splash 页.
    + 删除 drawable-21， values-night。 修改 drawable/launch_background 中的 drawable

    ```
     <layer-list xmlns:android="http://schemas.android.com/apk/res/android">
         <item android:drawable="@drawable/pic_splash" />
     </layer-list>
    ```

    + style 中 修改  windowBackground 标签 为 launch_background
    ```
        <!-- Base application theme. -->
        <style name="ParentTheme" parent="@android:style/Theme.Light.NoTitleBar">
        </style>

        <style name="LaunchTheme" parent="ParentTheme">
            <item name="android:windowBackground">@drawable/launch_background</item>
        </style>

        <style name="NormalTheme" parent="ParentTheme">
            <item name="android:windowBackground">@drawable/launch_background</item>
        </style>
    ```

### 2.更换APP图标
    + 将图标放置在 res 下的mipmap 各文件夹中 统一命名， AndroidManifest.xmll 中修改 icon 标签
    ```
     <application
            android:name="com.maple.my_release.app.MyApplication"
            android:label="@string/app_name"
            android:networkSecurityConfig="@xml/public_network_security_config"
            android:requestLegacyExternalStorage="true"
            android:icon="@mipmap/app_launcher"
            android:roundIcon="@mipmap/app_launcher">
    ```
### 3.配置 networkSecurityConfig 及 provider
    + res 下新建 xml 文件夹 ，新建 public_network_security_config 和 file_paths 并在 AndroidManifest.xml 中配置
    ```

       <provider
               android:name="androidx.core.content.FileProvider"
               android:authorities="${applicationId}.fileProvider"
               android:exported="false"
               android:grantUriPermissions="true">
               <meta-data
                   android:name="android.support.FILE_PROVIDER_PATHS"
                   android:resource="@xml/file_paths" />
           </provider>
        </application>


    <application
           android:name="com.maple.my_release.app.MyApplication"
           android:label="@string/app_name"
           android:networkSecurityConfig="@xml/public_network_security_config"
           android:requestLegacyExternalStorage="true"
           android:icon="@mipmap/app_launcher"
           android:roundIcon="@mipmap/app_launcher">
    ```
### 4.修改应用名称
    res/values 下新建 strings.xml  增加 app_name 标签 并在 AndroidManifest.xml 中修改 label 标签
    ```
    <resources>
        <string name="app_name">测试Android应用</string>
    </resources>


       <application
           android:name="com.maple.my_release.app.MyApplication"
           android:label="@string/app_name"
           android:networkSecurityConfig="@xml/public_network_security_config"
           android:requestLegacyExternalStorage="true"
           android:icon="@mipmap/app_launcher"
           android:roundIcon="@mipmap/app_launcher">
    ```


## Ios 端
    ### 1. 配置 splash 页.
    + ios\Runner\Assets.xcassets\LaunchImage.imageset 下 添加3张图片： SplashImage.png 、SplashImage@2x.png 、SplashImage@3x.png
    + Contents.json 中 修改为当前名字
    ```
      "images" : [
        {
          "idiom" : "universal",
          "filename" : "SplashImage.png",
          "scale" : "1x"
        },
        {
          "idiom" : "universal",
          "filename" : "SplashImage@2x.png",
          "scale" : "2x"
        },
        {
          "idiom" : "universal",
          "filename" : "SplashImage@3x.png",
          "scale" : "3x"
        }
      ],
    ```
    ### 2.更换APP图标
    ```
    https://icon.wuruihong.com/icon?utm_source=NTbtSGAN#/ios
    ```
    + ios\Runner\Assets.xcassets\AppIcon.appiconset  修改

    ### 3.修改应用名称

    修改 Info.plist 文件中
    ```
    <key>CFBundleName</key>
    <string>测试IOS应用</string>
    ```


