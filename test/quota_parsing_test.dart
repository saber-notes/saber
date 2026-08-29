import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/quota.dart';

void main() {
  group('Quota parsing', () {
    testQuota(
      'capped, 0% used',
      usedGb: 0,
      totalGb: 1,
      usedRatio: 0,
      progressIndicatorValue: 0.04,
      describe: 'You\'re using 0 B of 1.00 GB (0.0%)',
      describeConcise: '0 B / 1.00 GB',
    );
    testQuota(
      'capped, 33.3% used',
      usedGb: 1,
      totalGb: 3,
      usedRatio: 1 / 3,
      progressIndicatorValue: 1 / 3,
      describe: 'You\'re using 1.00 GB of 3.00 GB (33.3%)',
      describeConcise: '1.00 GB / 3.00 GB',
    );
    testQuota(
      'capped, 100% used',
      usedGb: 1,
      totalGb: 1,
      usedRatio: 1,
      progressIndicatorValue: 1,
      describe: 'You\'re using 1.00 GB of 1.00 GB (100.0%)',
      describeConcise: '1.00 GB / 1.00 GB',
    );
    testQuota(
      'capped, NaN used',
      usedGb: 0,
      totalGb: 0,
      usedRatio: double.nan,
      progressIndicatorValue: 1.0,
      describe: 'You\'re using 0 B of 0 B (100.0%)',
      describeConcise: '0 B / 0 B',
    );

    testQuota(
      'uncapped, 0GB used',
      usedGb: 0,
      totalGb: null,
      usedRatio: 0.0,
      progressIndicatorValue: 0.04,
      describe: 'You\'re using 0 B',
      describeConcise: '0 B',
    );
    testQuota(
      'uncapped, 2.5GB used',
      usedGb: 2.5,
      totalGb: null,
      usedRatio: 1 / 3,
      progressIndicatorValue: 1 / 3,
      describe: 'You\'re using 2.50 GB',
      describeConcise: '2.50 GB',
    );
    testQuota(
      'uncapped, 5GB used',
      usedGb: 5,
      totalGb: null,
      usedRatio: 0.5,
      progressIndicatorValue: 0.5,
      describe: 'You\'re using 5.00 GB',
      describeConcise: '5.00 GB',
    );
    testQuota(
      'uncapped, 10GB used',
      usedGb: 10,
      totalGb: null,
      usedRatio: 2 / 3,
      progressIndicatorValue: 2 / 3,
      describe: 'You\'re using 10.0 GB',
      describeConcise: '10.0 GB',
    );
    testQuota(
      'uncapped, huge amount used',
      usedGb: 999999,
      totalGb: null,
      usedRatio: 1.0,
      progressIndicatorValue: 1.0,
      describe: 'You\'re using 0.95 PB',
      describeConcise: '0.95 PB',
    );

    test('placeholders', () {
      expect(Quota.describePlaceholder(), 'You\'re using ... B');
      expect(Quota.describeConcisePlaceholder(), '... B / ... B');
    });
  });
}

const _gb = 1024 * 1024 * 1024;

void testQuota(
  String description, {
  required num usedGb,
  required num? totalGb,
  required double usedRatio,
  required double progressIndicatorValue,
  required String describe,
  required String describeConcise,
}) {
  test(description, () {
    final quota = const QuotaCodec().decode([
      (usedGb * _gb).toStringAsFixed(0),
      if (totalGb == null) '-3' else (totalGb * _gb).toStringAsFixed(0),
    ]);
    expect(
      quota.usedRatio,
      usedRatio.isNaN ? isNaN : moreOrLessEquals(usedRatio, epsilon: 0.0001),
    );
    expect(
      quota.progressIndicatorValue,
      progressIndicatorValue.isNaN
          ? isNaN
          : moreOrLessEquals(progressIndicatorValue, epsilon: 0.0001),
    );
    expect(quota.describe(), describe);
    expect(quota.describeConcise(), describeConcise);
  });
}
