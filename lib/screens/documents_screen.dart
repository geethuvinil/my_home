import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  FilePickerResult? result;
  PlatformFile? file;

  void pickUpFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;

    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add more documents",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          pickUpFile();
                        },
                        icon: Icon(Icons.attach_file_rounded),
                        color: Colors.black,
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Uploaded documents",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),
            ),
            Divider(),
            uploadedDocumentDetails(docName: "PAN"),
            uploadedDocumentDetails(docName: "Driving Liscense"),

          ],
        ),
      ),
    );
  }

  uploadedDocumentDetails({String? docName}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
      
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.blue.shade100,
        title: SizedBox(child: Text(docName ?? "")),
        trailing: Row(
         mainAxisSize: MainAxisSize.min,
          children: [
IconButton(onPressed: (){
  pickUpFile();
}, icon: Icon(Icons.edit),color: Colors.green,),
IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.red,)
          ],
        ),
      ),
      
      
    );
  }
}
