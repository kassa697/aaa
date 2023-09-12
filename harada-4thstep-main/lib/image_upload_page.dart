import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  // PickedFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画像アップロード'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (_pickedImage != null)
            //   Image.file(
            //     File(_pickedImage!.path),
            //     width: 200,
            //     height: 200,
            //   ),
            // ElevatedButton(
            //   onPressed: _pickImage,
            //   child: const Text('画像を選択'),
            // ),
            // ElevatedButton(
            //   onPressed: _uploadImage,
            //   child: const Text('アップロード'),
            // ),
          ],
        ),
      ),
    );
  }

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _pickedImage = pickedImage;
  //   });
  // }

  // Future<void> _uploadImage() async {
  //   if (_pickedImage == null) {
  //     return;
  //   }

  //   final storageRef = FirebaseStorage.instance.ref().child('images/image.jpg');
  //   final uploadTask = storageRef.putFile(File(_pickedImage!.path));
  //   await uploadTask.whenComplete(() {
  //     // アップロード完了後の処理
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('画像がアップロードされました')),
  //     );
  //   });
  // }
}
