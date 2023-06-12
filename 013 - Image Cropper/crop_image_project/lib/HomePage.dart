import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? pickedFile;
  File? croppedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (croppedFile != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(croppedFile!),
                ),
              ),
            const SizedBox(height: 40),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                pickImage().whenComplete(() => cropImage());
              },
              child: const Text("Pick Image and Crop"),
            )
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    try {
      if (result != null) {
        PlatformFile file = result.files.first;
        var kFile = File(file.path!);
        setState(() {
          pickedFile = kFile;
        });
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  Future cropImage() async {
    CroppedFile? file = await ImageCropper().cropImage(
      sourcePath: pickedFile!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        IOSUiSettings(title: "Cropper"),
      ],
    );

    if (file != null) {
      setState(() {
        croppedFile = File(file.path);
      });
    }
  }
}
