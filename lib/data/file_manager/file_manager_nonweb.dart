
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future fmExportFile(String fileName, List<int> bytes, {bool useShareDialogOnMobile = true}) async {
  final String tempFolder = (await getTemporaryDirectory()).path;
  final File file = File("$tempFolder/$fileName");
  final Future fileWriteFuture = file.writeAsBytes(bytes);
  bool needToDeleteTempFile = true;

  if (useShareDialogOnMobile && (Platform.isAndroid || Platform.isIOS)) { // mobile, open share dialog
    await fileWriteFuture;
    await Share.shareXFiles([XFile(file.path)]);
  } else { // desktop, open save-as dialog
    String? outputFile = await FilePicker.platform.saveFile(
      fileName: fileName,
      initialDirectory: (await getDownloadsDirectory())?.path,
      allowedExtensions: [fileName.split(".").last],
    );
    if (outputFile != null) {
      await fileWriteFuture;
      await file.rename(outputFile);
      needToDeleteTempFile = false;
    }
  }

  if (needToDeleteTempFile) await file.delete();
}
