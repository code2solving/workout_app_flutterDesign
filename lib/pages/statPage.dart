import 'package:flutter/cupertino.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Statistics',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
