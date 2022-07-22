import 'package:flutter/material.dart';

import 'components/navbar/responsive_navbar.dart';
import 'components/theming/dynamic_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DynamicMaterialApp(
      title: 'Flutter Demo',
      defaultSwatch: Colors.deepPurple,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ResponsiveNavbar(
      body: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
          title: const Text("My notes"),
        ),
        body: const Center(
          child: Text("WIP"),
        ),
      )
    );
  }
}
