import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String link = 'You dont have the "link"';
  @override
  void initState() {
    handleDeepLink();
    super.initState();
  }

  handleDeepLink() async {
    String? initialUri = await getInitialLink();
    if (initialUri != null) {
      /// Handle the deeplink here
      /// you can put any function like which page
      /// or something
      /// you got the idea right?
      ///
      setState(() {
        link = initialUri;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(link),
      ),
    );
  }
}
