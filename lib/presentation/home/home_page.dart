import 'package:flutter/material.dart';

import '../../core/utils/navigation/route_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutePath.login);
              },
              child: const Text('Next login')),
        ],
      ),
    );
  }
}
