import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _launch(BuildContext context) async {
    /// if you want to try open a browser and google
    ///
    /// uncomment these
    /// String url = 'https://www.google.com';
    ///
    /// then comment these
    String url = 'customdeeplink://whatever?token=abc+token2=123';
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        handleError(context);
      }
    } catch (error) {
      log(error.toString());
    }
  }

  handleError(BuildContext context) {
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Alert'),
            content: const Text('No supported app found to open the link'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('No supported app found to open the link'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => _launch(context),
          child: const Text('Press'),
        ),
      ),
    );
  }
}
