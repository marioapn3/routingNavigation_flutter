import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & Routing'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondScreen');
                },
                child: const Text(
                  'Go To Second Screen',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondScreenWithData',
                      arguments: 'Helo from first Screen!');
                },
                child: const Text(
                  'Navigation with Data',
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'Return Data from Another Screen',
                ),
                onPressed: () async {
                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                  final result =
                      await Navigator.pushNamed(context, '/returnDataScreen');
                  SnackBar snackBar = SnackBar(content: Text('$result'));
                  scaffoldMessenger.showSnackBar(snackBar);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/replacementScreen');
                },
                child: const Text(
                  'Replace Screen',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
