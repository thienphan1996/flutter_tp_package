import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TpBannerAd extends StatefulWidget {
  const TpBannerAd(this.unitId, {Key? key}) : super(key: key);

  final String unitId;

  @override
  _TpBannerAdState createState() => _TpBannerAdState();
}

class _TpBannerAdState extends State<TpBannerAd> {
  BannerAd? _bannerAd;
  bool _loadAdFailed = false;

  Future<AdWidget> initBannerAds() async {
    AnchoredAdaptiveBannerAdSize? adaptiveSize =
        await anchoredAdaptiveBannerAdSize(context);
    int width = adaptiveSize?.width ?? 320;
    int height = adaptiveSize?.height ?? 50;

    _bannerAd = BannerAd(
      adUnitId: widget.unitId,
      size: AdSize(height: height, width: width),
      request: const AdRequest(),
      listener: BannerAdListener(onAdFailedToLoad: (Ad ad, LoadAdError err) {
        setState(() {
          _loadAdFailed = true;
        });
      }),
    );

    _bannerAd?.load();

    return Future<AdWidget>.value(AdWidget(ad: _bannerAd!));
  }

  Future<AnchoredAdaptiveBannerAdSize?> anchoredAdaptiveBannerAdSize(
      BuildContext context) async {
    return await AdSize.getAnchoredAdaptiveBannerAdSize(
      MediaQuery.of(context).orientation == Orientation.portrait
          ? Orientation.portrait
          : Orientation.landscape,
      MediaQuery.of(context).size.width.toInt(),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !_loadAdFailed
        ? FutureBuilder<AdWidget>(
            future: initBannerAds(),
            builder: (BuildContext ctx, AsyncSnapshot<AdWidget> snapshot) {
              return snapshot.hasData
                  ? Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: snapshot.data,
                      width: _bannerAd?.size.width.toDouble(),
                      height: _bannerAd?.size.height.toDouble(),
                    )
                  : Container();
            },
          )
        : Container();
  }
}
