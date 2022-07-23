
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  const Editor({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: TextEditingController(
            text: path ?? "New note",
          ),
          onChanged: (text) {
            // todo: update note name
            print("Note name changed to: $text");
          },
        ),
      ),
      body: const Center(
        child: Text("Editor"),
      ),
    );
  }
}
