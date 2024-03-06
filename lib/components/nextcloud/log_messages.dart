import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:saber/data/prefs.dart';

class NextcloudMessages extends StatefulWidget {
  /// creates widget with last Nextcloud synchronization messages
  const NextcloudMessages({
    super.key,
  });

  @override
  State<NextcloudMessages> createState() => _NextcloudMessagesState();
}

class _NextcloudMessagesState extends State<NextcloudMessages> {
  @override
  void initState() {
    Prefs.nextcloudLogMessages.addListener(messageListener);  // add listener to changes in nextcloud messages.
                  // if any new message, then messageListener will be called
    super.initState();
    messageListener(); // fill messages text
  }

  @override
  void dispose() {
    Prefs.nextcloudLogMessages.removeListener(messageListener);  // remove listener
    super.dispose();
  }

  final TextEditingController _txt = TextEditingController();  // TextField controller to enable editing of text
  void messageListener() {
    /// called when there is an update of upload/download
    setState(() {
      String text="";
      for (var msg in Prefs.nextcloudLogMessages.value) {
        text=text+msg.toString();
      }
      _txt.text=text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
        style:TextStyle(fontSize:10),
        controller: _txt,
        maxLines: 10,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
/// types of messages in nextcloud synchronization logs
enum NextcloudLogMessageType {
  info,
  successUpload,
  successDownload,
  errorDownload,
  errorUpload,
}

class NextcloudLogMessages {
  /// Nextcloud synchronization messages
  static final log = Logger('SyncMsg');

  void add(NextcloudLogMessageType type,String localFile,String remoteFile,String textError){
    /// add message to messages buffer
    final String text;
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);

    switch (type) {
      case NextcloudLogMessageType.successDownload:
        text = "↓: ✓ " + localFile;
      case NextcloudLogMessageType.errorDownload:
        text = "↓: ❌ " + localFile + " from " + remoteFile+" Error:"+textError;
      case NextcloudLogMessageType.successUpload:
        text = "↑: ✓ " + localFile;
      case NextcloudLogMessageType.errorUpload:
        text = "↑: ❌ " + localFile + " to " + remoteFile+" Error:"+textError;
      case NextcloudLogMessageType.info:
        text = textError;
    }
    while (Prefs.nextcloudLogMessages.value.length>20) {
      // more than 10 messages, remove the first one
      Prefs.nextcloudLogMessages.value.remove(Prefs.nextcloudLogMessages.value.elementAt(0));
    }
    Prefs.nextcloudLogMessages.value.add(formattedDate+" "+text+"\n");
    Prefs.nextcloudLogMessages.notifyListeners();
  }
}

///  for (var e in mySet) {
//     print(e);
//   }
