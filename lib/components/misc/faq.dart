
import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({
    super.key,
    required this.items,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  final List<FaqItem> items;
  final ScrollPhysics physics;

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      shrinkWrap: true,
      physics: widget.physics,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text(widget.items[index].question),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: SelectableText(widget.items[index].answer),
            ),
          ],
        );
      },
    );
  }
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem(this.question, this.answer);
}
