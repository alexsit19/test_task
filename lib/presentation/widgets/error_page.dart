import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Function action;
  const ErrorPage({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            action();
          },
          child: const Text("Retry"),
      ),
    );
  }
}
