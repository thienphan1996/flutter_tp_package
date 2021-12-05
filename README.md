<p align="center"><img src="https://play-lh.googleusercontent.com/EMJV8qRIQEaTEOEAdhreMmjyP2qmE5yX4KzxKfkutJdkzHrLb5aUTKl_IAO6KURcZxd0=w4494-h2528-rw" alt="TP MEDIA"></p>
<p align="center">
  <a href="https://pub.dev/packages/tp_package"><img src="https://img.shields.io/pub/v/tp_package.svg" alt="pub.dev"></a>
  <a href="https://github.com/thienphan1996/flutter_tp_package"><img src="https://img.shields.io/badge/platform-flutter-ff69b4.svg" alt="github"></a>
</p>

## Features
- Load banner ad faster.
- Optimize load interstitial ad singleton.
- Make utils toast, connectivity, alert dialog, text field, tile row.
- Make flutter share, send mail, compose call in a single package.
- Get external storage directory.

## Getting started

```yaml
dependencies:
  tp_package: ^latest_version
```

## Usage

Init ad in `main` function before implement show ad:

```dart
const testDeviceIds = <String>['iOS device id to show ads'];
TpAdManager.init(testDeviceIds)
```

Show banner ad:

```dart
TpBannerAd('banner ad unit id')
```

Load interstitial ad:

```dart
TpInterstitialAd.load('interstitial ad unit id');
```

Show interstitial ad:

```dart
TpInterstitialAd.show(onDismissAd: yourFunction);
```

Dispose interstitial ad:

```dart
TpInterstitialAd.dispose();
```

Get External storage:
### iOS

Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:

* `NSPhotoLibraryUsageDescription` - describe why your app needs permission for the photo library. This is called _Privacy - Photo Library Usage Description_ in the visual editor.

### Android

* `android.permission.WRITE_EXTERNAL_STORAGE` - Permission for usage of external storage

```dart
Future<StorageStatus> TpUtils.getStorageDirectory(context);
```

Share file:
```dart
TpUtils.shareFile(String title, String filePath);
```

Open url:
```dart
TpUtils.composeOpenUrl(String url);
```

Send mail:
```dart
TpUtils.composeSendMail(String address, String subject, String body);
```

Send sms:
```dart
TpUtils.composeSendSms(String phone);
```

Toast utils:
```dart
TpToast.success(String message);
TpToast.updated(String message);
TpToast.deleted(String message);
TpToast.failed(String message);
```

Network connectivity:
```dart
TpConnectivity.isOnline();
TpConnectivity.onConnectChanged(Function(TpConnectResult) callback);
TpConnectivity.cancel();
```

Alert dialog:
```dart
TpAlertDialog({
    required this.title,
    required this.message,
    required this.cancelText,
    required this.onOkButton,
    this.color = Colors.blue,
    Key? key,
  });
```

Init material app with responsive for tablet, pc:

```dart
MaterialApp(
    builder: TpMaterialApp.builder,
);
```
