
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:saber/components/navbar/responsive_navbar.dart';

class RecentNotes extends StatelessWidget {
  const RecentNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ResponsiveNavbar(
        body: Scaffold(
            appBar: AppBar(
              toolbarHeight: kToolbarHeight,
              title: const Text("Recent notes"),
            ),
            body: SingleChildScrollView(
              child: MasonryGridView.count(
                itemCount: 20,
                crossAxisCount: 2,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      height: (100.0 * index) % 500 + 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          Text("Note $index"),
                          const SizedBox(height: 10),
                          Text("This is an example note"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
        )
    );
  }
}
