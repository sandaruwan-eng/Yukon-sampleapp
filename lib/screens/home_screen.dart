import 'dart:io';
import 'package:flutter/material.dart';

import 'package:sampleapp/constant/url_constant.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/services/api_services.dart';
import 'package:sampleapp/services/local_services.dart';
import 'package:sampleapp/services/store_data_service.dart';
import 'package:sampleapp/styleguide/colors.dart';
import 'package:sampleapp/styleguide/text_styles.dart';
import 'package:sampleapp/utility/read_pdf.dart';
import 'package:sampleapp/widgets/dialog_box.dart';
import 'package:sampleapp/widgets/pdf_view_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _allowWriteFile = false;
  String extension = "";
  bool isFileExsist = false;
  String primaryAccountNumber = "";

  @override
  void initState() {
    super.initState();
    extension =
        UrlConstant.PDF_URL.substring(UrlConstant.PDF_URL.lastIndexOf("/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            primaryAccountNumber.isEmpty
                ? ""
                : "Primary Account Number: $primaryAccountNumber",
            style: primaryAccountNumberTextstyle,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 8.0 * WidgetsConstant.width,
                right: 8.0 * WidgetsConstant.width,
                top: 50.0 * WidgetsConstant.height),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0 * WidgetsConstant.width),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: homeScreenButton,
                      onPressed: () async {
                        String path = await getDirectoryPath();
                        File pdfFile = File(path + "$extension");
                        isFileExsist = pdfFile.existsSync();

                        if (isFileExsist) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PdfViewScreen(pdfFile.path);
                          }));
                          return;
                        } else {
                          if (!_allowWriteFile) {
                            requestWritePermission();
                            _allowWriteFile = true;
                          }
                          await downloadFile(
                              UrlConstant.PDF_URL, "$path/$extension", context);
                          setState(() {
                            isFileExsist = true;
                          });
                        }
                      },
                      child: Text(
                        isFileExsist ? "View pdf" : "Downlod pdf",
                        style: buttonsTextstyle,
                      ),
                    ),
                    RaisedButton(
                      color: homeScreenButton,
                      onPressed: () async {
                        String result = await readPdf(extension, context);
                        if (result != "") {
                          setState(() {
                            primaryAccountNumber = result;
                          });

                          // save primary account number to local memory
                          await savePrimaryAccountNumber(result);
                        } else {
                          showMsgDialog(context, 'Warning',
                              'Please Downlod Pdf file First.');
                        }
                      },
                      child: Text(
                        "Account Number",
                        style: buttonsTextstyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
