import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TpPermission {
  static Future<PermissionResult> request(
    Permission permission,
    BuildContext context,
  ) async {
    if (Platform.isAndroid) {
      PermissionStatus status = await permission.status;

      if (!status.isGranted) {
        PermissionStatus requestStatus = await permission.request();

        if (requestStatus == PermissionStatus.permanentlyDenied) {
          return Future.value(PermissionResult.permanentlyDenied);
        } else if (!requestStatus.isGranted) {
          return Future.value(PermissionResult.denied);
        }
      }
    }

    return Future.value(PermissionResult.success);
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
      PermissionResult result = await request(Permission.storage, context);

      if (result == PermissionResult.success) {
        directory = await getExternalStorageDirectory();
      }

      return Future.value(StorageStatus(directory, result));
    }
    else {
      directory = await getApplicationDocumentsDirectory();

      return Future.value(StorageStatus(directory, PermissionResult.success));
    }
  }
}

class StorageStatus {
  StorageStatus(
    this.directory,
    this.permissionResult,
  );

  final PermissionResult permissionResult;
  final Directory? directory;
}

enum PermissionResult { success, denied, permanentlyDenied }
