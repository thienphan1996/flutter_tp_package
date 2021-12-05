import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tp_package/dialog/alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class TpUtils {
  static const String kDateFormat = 'yyyy/MM/dd hh:mm';

  static String toVnd(int value, {bool emptyToZero = true}) {
    String empty = emptyToZero ? '0' : '';

    try {
      NumberFormat formatter = NumberFormat('#,###', 'en_US');
      String currency = formatter.format(value);

      return currency != '0' ? currency : empty;
    } catch (e) {
      return empty;
    }
  }

  static String now({String format = kDateFormat}) {
    return DateFormat(format).format(DateTime.now());
  }

  static DateTime toDate(String value, {String format = kDateFormat}) {
    try {
      return DateFormat(format).parse(value);
    } catch (e) {
      return DateTime.now();
    }
  }

  static bool validatePhone(String phone) {
    String pattern = r'^(?:[+0]84)?[0-9]{9,}$';
    RegExp regex = RegExp(pattern);

    return regex.hasMatch(phone);
  }

  static void composeCall(
      String phone, BuildContext context, TpAlertDialog dialog) async {
    String url = 'tel:${phone.trim()}';

    if ((await canLaunch(url) && validatePhone(phone))) {
      showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext ctx) {
          return dialog;
        },
      );
    }
  }

  static void composeSendSms(String phone) async {
    String url = 'sms:${phone.trim()}';

    if ((await canLaunch(url) && validatePhone(phone))) {
      await launch(url);
    }
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static void composeSendMail(
      String address, String subject, String body) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: address,
      query: encodeQueryParameters(
          <String, String>{'subject': subject, 'body': body}),
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    }
  }

  static void composeOpenUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static String formatKg(String value) {
    if (value.length == 3) {
      return '${value.substring(0, 2)}.${value.substring(2)}';
    }

    return value;
  }

  static void shareFile(String title, String filePath) {
    FlutterShare.shareFile(title: title, filePath: filePath);
  }

  static void share(
    String title, {
    String? text,
    String? linkUrl,
    String? chooserTitle,
  }) {
    FlutterShare.share(
      title: title,
      text: text,
      linkUrl: linkUrl,
      chooserTitle: chooserTitle,
    );
  }

  static double roundDouble(double val, int places) {
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  static Future<PermissionStatus> _requestStoragePermission(
    BuildContext context,
  ) async {
    if (Platform.isAndroid) {
      PermissionStatus status = await Permission.storage.status;

      if (!status.isGranted) {
        status = await Permission.storage.request();
      }

      return status;
    }

    return Future.value(PermissionStatus.granted);
  }

  /// Get external storage with request permission in Android
  /// Add key to Info.plist & WRITE_EXTERNAL_STORAGE to manifest.xml
  // iOS:
  // Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:
  // NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library.
  // This is called Privacy - Photo Library Usage Description in the visual editor.
  //
  // Android:
  // android.permission.WRITE_EXTERNAL_STORAGE - Permission for usage of external storage
  static Future<StorageStatus> getStorageDirectory(BuildContext context) async {
    Directory? directory;

    if (Platform.isAndroid) {
      PermissionStatus result = await _requestStoragePermission(context);

      if (result == PermissionStatus.granted) {
        directory = await getExternalStorageDirectory();
      }

      return Future.value(StorageStatus(directory, result));
    } else {
      directory = await getApplicationDocumentsDirectory();

      return Future.value(StorageStatus(directory, PermissionStatus.granted));
    }
  }
}

class StorageStatus {
  StorageStatus(
    this.directory,
    this.permissionStatus,
  );

  final PermissionStatus permissionStatus;
  final Directory? directory;
}
