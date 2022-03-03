import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatelessWidget {
  PdfViewScreen(this.pathPDF, {Key? key}) : super(key: key);
  final String pathPDF;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("PDF"),
        centerTitle: true,
      ),
      body: SfPdfViewer.file(
        File(pathPDF),
        key: _pdfViewerKey,
      ),
    );
  }
}
