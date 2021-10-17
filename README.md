<p align="center"><img src="https://play-lh.googleusercontent.com/EMJV8qRIQEaTEOEAdhreMmjyP2qmE5yX4KzxKfkutJdkzHrLb5aUTKl_IAO6KURcZxd0=w4494-h2528-rw" alt="TP MEDIA"></p>
<p align="center">
  <a href="https://pub.dev/packages/convex_bottom_bar"><img src="https://img.shields.io/pub/v/convex_bottom_bar.svg" alt="pub.dev"></a>
  <a href="https://pub.dev/packages/convex_bottom_bar/versions/3.0.0-nullsafety.0"><img src="https://img.shields.io/badge/nullsafety-3.0.0-blue.svg" alt="pub.dev"></a>
  <a href="https://github.com/hacktons/convex_bottom_bar"><img src="https://img.shields.io/badge/platform-flutter-ff69b4.svg" alt="github"></a>
  <a href="https://pub.dev/packages/convex_bottom_bar/score"><img src="https://badges.bar/convex_bottom_bar/likes" alt="likes"></a>
</p>
## TP package:
- Load banner ad faster.
- Optimize load interstitial ad singleton.
- Make utils toast, connectivity, alert dialog, text field, tile row.
- Make flutter share, send mail, compose call in a single package.

## Features

- Implement admob advertising faster
- Make some common packages in a single package

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
TpInterstitialAd.load('interstitial ad unit id', onLoadFailed: yourFunction);
```

Show interstitial ad:

```dart
TpInterstitialAd.show(onDismissAd: yourFunction);
```

Dispose interstitial ad:

```dart
TpInterstitialAd.dispose();
```

Init material app with responsive for tablet, pc:

```dart
MaterialApp(
    builder: TpMaterialApp.builder,
);
```
