
import 'package:flutter/material.dart';

class SliverFaq extends StatefulWidget {
  const SliverFaq({
    super.key,
    required this.items,
  });

  final List<FaqItem> items;

  @override
  State<SliverFaq> createState() => _SliverFaqState();
}

class _SliverFaqState extends State<SliverFaq> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.items.length,
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
