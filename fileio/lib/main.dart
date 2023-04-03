import 'package:flutter/material.dart';

// for file system access
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: FileIODemo()));
}

class FileIODemo extends StatefulWidget {
  const FileIODemo({super.key});

  @override
  _FileIODemoState createState() => _FileIODemoState();
}

class _FileIODemoState extends State<FileIODemo> {
  TextEditingController _inputController = TextEditingController();
  String _data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File IO Demo')),
      body: Column(
        children: [
          // Input field and buttons
          TextField(
            controller: _inputController,
            decoration: InputDecoration(hintText: 'Enter some text'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _writeData(_inputController.text),
                child: Text('Write'),
              ),
              ElevatedButton(
                onPressed: () => _readData(),
                child: Text('Read'),
              ),
            ],
          ),
          // Display the data read from the file
          Expanded(
            child: SingleChildScrollView(
              child: Text(_data),
            ),
          ),
        ],
      ),
    );
  }

  // Function to get the local file path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Function to get the local file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  // Function to write data to the file
  Future<File> _writeData(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  // Function to read data from the file
  Future<void> _readData() async {
    try {
      final file = await _localFile;
      String fileContents = await file.readAsString();
      setState(() {
        _data = fileContents;
      });
    } catch (e) {
      print('Error reading file: $e');
      setState(() {
        _data = 'Error: Could not read the file';
      });
    }
  }
}
