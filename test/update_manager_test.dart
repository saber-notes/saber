
import 'package:saber/components/settings/update_manager.dart';
import 'package:test/test.dart';

/// Example current build number.
/// See [buildNumber] in [lib/data/version.dart].
const int v = 5000;

void main() {
  test("Test update manager (release mode)", () {
    expect(UpdateManager.getUpdateStatus(v, v - 10, alwaysRecommendUpdates: false), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v - 1, alwaysRecommendUpdates: false), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v, alwaysRecommendUpdates: false), UpdateStatus.upToDate);

    expect(UpdateManager.getUpdateStatus(v, v + 1, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 10, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 11, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 19, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);

    expect(UpdateManager.getUpdateStatus(v, v + 20, alwaysRecommendUpdates: false), UpdateStatus.updateRecommended);
    expect(UpdateManager.getUpdateStatus(v, v + 100, alwaysRecommendUpdates: false), UpdateStatus.updateRecommended);
  });

  test("Test update manager (debug mode)", () {
    expect(UpdateManager.getUpdateStatus(v, v, alwaysRecommendUpdates: true), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v + 1, alwaysRecommendUpdates: true), UpdateStatus.updateRecommended);
    expect(UpdateManager.getUpdateStatus(v, v + 10, alwaysRecommendUpdates: true), UpdateStatus.updateRecommended);
  });
}
