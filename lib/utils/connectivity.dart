import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class TpConnectivity {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? subscription;

  Future<bool> isOnline() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    return connectivityResult != ConnectivityResult.none;
  }

  void onConnectChanged(Function(TpConnectResult) callback) {
    subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult event) {
      switch(event) {
        case ConnectivityResult.wifi:
          callback(TpConnectResult.wifi);
          break;
        case ConnectivityResult.ethernet:
          callback(TpConnectResult.ethernet);
          break;
        case ConnectivityResult.mobile:
          callback(TpConnectResult.mobile);
          break;
        case ConnectivityResult.none:
          callback(TpConnectResult.none);
          break;
      }
    });
  }

  void cancel() {
    subscription?.cancel();
  }
}

enum TpConnectResult {
  /// WiFi: Device connected via Wi-Fi
  wifi,

  /// Ethernet: Device connected to ethernet network
  ethernet,

  /// Mobile: Device connected to cellular network
  mobile,

  /// None: Device not connected to any network
  none
}
