import 'dart:io';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid){
      WebView.platform = SurfaceAndroidWebView();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(AppStrings.contactUs.tr()),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
      ),
      body:
    WebView(
        initialUrl: 'https://flutter.dev',
        onProgress: (int progress){
          print('loading $progress%');
        },
      ),
    );
  }
}
