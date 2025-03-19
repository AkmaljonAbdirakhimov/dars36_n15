import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void hello(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    hello(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
    );
  }
}
