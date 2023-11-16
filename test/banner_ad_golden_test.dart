import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/home/banner_ad_widget.dart';

void main() {
  testWidgets('BannerAd', (tester) async {
    AdState.init();

    await tester.pumpWidget(const MaterialApp(
      home: Center(
        child: RepaintBoundary(
          child: BannerAdWidget(
            adSize: AdSize.banner,
          ),
        ),
      ),
    ));

    await expectLater(
      find.byType(BannerAdWidget),
      matchesGoldenFile('goldens/banner_ad.png'),
    );
  });
}
