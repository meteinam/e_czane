import 'dart:io';
import 'package:e_czane/services/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatefulWidget {
  const ImagePickerDialog(BuildContext context, {super.key});

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  XFile? image;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Stack(
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              image != null
                  ? Image.file(
                      File(image!.path),
                      width: 200,
                      height: 200,
                    )
                  : const Text("Bir Fotoğraf Seçin"),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                  onPressed: () async {
                    image = await pickAndCropImage(ImageSource.gallery);
                    setState(() {});
                  },
                  child: const Icon(Icons.image_rounded),
                ),
                ElevatedButton(
                  onPressed: () async {
                    image = await pickAndCropImage(ImageSource.camera);
                    setState(() {});
                  },
                  child: const Icon(Icons.camera_alt_rounded),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (image != null) {
                      text = await extractText(image!);
                      print(text);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context, text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Fotoğraf Seçin")));
                    }
                  },
                  child: const Icon(Icons.send),
                )
              ]),
            ],
          ),
        ),
        Positioned(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            icon: const Icon(Icons.close),
          ),
        )
      ],
    ));
  }
}

Future<String?> extractText(XFile image) async {
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final inputImage = InputImage.fromFilePath(image.path);
  final RecognizedText recognizedText =
      await textRecognizer.processImage(inputImage);
  String text = recognizedText.text;
  textRecognizer.close();
  return text;
}
