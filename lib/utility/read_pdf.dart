import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:sampleapp/services/local_services.dart';

Future<String> readPdf(String extension, BuildContext context) async {
  ProgressDialog progressDialog = ProgressDialog(context,
      dialogTransitionType: DialogTransitionType.Bubble,
      title: const Text("Loading"),
      message: null);

  progressDialog.show();
  String path = await getDirectoryPath();
  File pdfFile = File(path + extension);
  if (pdfFile.existsSync()) {
    PDFDoc doc = await PDFDoc.fromFile(pdfFile);
    String docText = await doc.text;

    String substring = "Primary Account Number:";
    int primaryAccountNumberIndex = docText.indexOf(substring);
    int primaryAccountNumberLength = 33;

    String result = docText.substring(
        primaryAccountNumberIndex + substring.length,
        primaryAccountNumberIndex + primaryAccountNumberLength);
    progressDialog.dismiss();
    return result;
  } else {
    progressDialog.dismiss();
    return "";
  }
}
