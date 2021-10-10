import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TpInterstitialAd {
  static InterstitialAd? _interstitialAd;
  static bool _isLoading = false;

  static Future<InitializationStatus> init(List<String> testDevices) async {
    MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: testDevices));
    return MobileAds.instance.initialize();
  }

  static void load(String unitId, {required VoidCallback onLoadFailed}) {
    if (!_isLoading && _interstitialAd == null) {
      _isLoading = true;
      InterstitialAd.load(
        adUnitId: unitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            _isLoading = false;
          },
          onAdFailedToLoad: (LoadAdError error) {
            onLoadFailed.call();
            _isLoading = false;
          },
        ),
      );
    }
  }

  static void show({required VoidCallback onDismissAd}) {
    if (_interstitialAd != null) {
      _interstitialAd?.fullScreenContentCallback =
          FullScreenContentCallback<InterstitialAd>(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          onDismissAd.call();
          dispose();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          onDismissAd.call();
          dispose();
        },
      );
      _interstitialAd?.show();
    } else {
      onDismissAd.call();
    }
  }

  static void dispose() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
  }
}
