import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageFromGallery() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return pickedFile;
  } else {
    return null;
  }
}

Future<XFile?> pickImageFromCamera() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedFile != null) {
    return pickedFile;
  } else {
    return null;
  }
}
