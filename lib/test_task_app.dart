import 'package:flutter/material.dart';
import 'package:test_task/presentation/navigation/route_generator.dart';

class TestTaskApp extends StatelessWidget {
  const TestTaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
