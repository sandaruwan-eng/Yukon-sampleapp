import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:permission_handler/permission_handler.dart';

Future downloadFile(String url, path, BuildContext context) async {
  late Dio dio = Dio();
  try {
    ProgressDialog progressDialog = ProgressDialog(context,
        dialogTransitionType: DialogTransitionType.Bubble,
        title: const Text("Downloading File"),
        message: null);

    progressDialog.show();

    await dio.download(url, path, onReceiveProgress: (rec, total) {
      String progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
      progressDialog.setMessage(Text("Dowloading $progress"));
    });
    progressDialog.dismiss();
  } catch (e) {
    print(e.toString());
  }
}

requestWritePermission() async {
  if (await Permission.storage.request().isGranted) {
    print("Permission is alrady enable");
  } else {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
  }
}
