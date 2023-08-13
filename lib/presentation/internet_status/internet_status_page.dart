import 'package:flutter/material.dart';

class InternetStatusPage extends StatelessWidget {
  const InternetStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(child: Text('No internet connection')),
          ],
        ),
      ),
    );
  }
}
