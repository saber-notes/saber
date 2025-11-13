import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/navbar/horizontal_navbar.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/flavor_config.dart';

void main() {
  testGoldens('GlassyContainer', (tester) async {
    final cols = Brightness.values.length * _Background.values.length;
    final rows = TargetPlatform.values.length;
    FlavorConfig.setup();
    await tester.pumpWidget(
      Directionality(
        textDirection: .ltr,
        child: FittedBox(
          child: RepaintBoundary(
            child: SizedBox(
              width: cols * 200,
              height: rows * 200,
              child: GridView.count(
                crossAxisCount: cols,
                children: [
                  for (final platform in TargetPlatform.values)
                    for (final brightness in Brightness.values.reversed)
                      for (final background in _Background.values)
                        _TestTile(
                          platform: platform,
                          brightness: brightness,
                          background: background,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.loadAssets();
    await tester.pump();

    await expectLater(
      find.byType(GridView),
      matchesGoldenFile('goldens/glassy_container.png'),
    );
  });
}

class _TestTile extends StatelessWidget {
  const _TestTile({
    required this.platform,
    required this.brightness,
    required this.background,
  });
  final TargetPlatform platform;
  final Brightness brightness;
  final _Background background;

  @override
  Widget build(BuildContext context) {
    final theme = SaberTheme.createThemeFromSeed(
      Colors.yellow,
      brightness,
      platform,
    );
    return Theme(
      data: theme,
      child: DefaultTextStyle(
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 32,
          fontWeight: .w600,
        ),
        // ignore: use_decorated_box // Container applies padding automatically
        child: Container(
          decoration: BoxDecoration(
            gradient: switch (background) {
              .lightGradient => const LinearGradient(
                colors: [Color(0xFFFFFFFF), Color(0xFFCCCCCC)],
                begin: .topLeft,
                end: .bottomRight,
              ),
              .darkGradient => const LinearGradient(
                colors: [Color(0xFF333333), Color(0xFF000000)],
                begin: .topLeft,
                end: .bottomRight,
              ),
              .saturatedGradient => const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: .topLeft,
                end: .bottomRight,
              ),
            },
            border: Border.all(
              color: brightness == .light ? Colors.white : Colors.black,
              width: 8,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Text(
                  '${platform.name} - ${background.name}\n${brightness.name}\n' *
                      7,
                  softWrap: false,
                  style: TextStyle(
                    color: switch (background) {
                      .lightGradient => Colors.black,
                      .darkGradient => Colors.white,
                      .saturatedGradient => Colors.white,
                    },
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Transform.scale(
                    scale: 2,
                    child: GlassyContainer(
                      child: AspectRatio(
                        aspectRatio: 1.2,
                        child: Icon(
                          switch (platform) {
                            .iOS || .macOS => Icons.apple,
                            .android || .fuchsia => Icons.android,
                            .linux => FontAwesomeIcons.linux,
                            .windows => FontAwesomeIcons.windows,
                          },
                          size: 24,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _Background { lightGradient, darkGradient, saturatedGradient }
