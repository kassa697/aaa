import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';

class ItemRegistrationScreen extends StatefulWidget {
  @override
  _ItemRegistrationScreenState createState() => _ItemRegistrationScreenState();
}

class _ItemRegistrationScreenState extends State<ItemRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _shelfNumberController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _specificationController = TextEditingController(); // 追加: 仕様
  final _detailsController = TextEditingController(); // 追加: 詳細
  final _manufacturerController = TextEditingController(); // 追加: メーカー名

  String _selectedImagePath = '';

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef =
          FirebaseStorage.instance.ref().child('images').child(fileName);

      try {
        final uploadTask = storageRef.putFile(pickedImageFile);
        final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

        final imageUrl = await taskSnapshot.ref.getDownloadURL();

        setState(() {
          _selectedImagePath = imageUrl;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('画像が正常にアップロードされました')),
        );
      } catch (e) {
        print('画像のアップロードに失敗しました: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('画像のアップロードに失敗しました')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規部品登録'),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 230, 80, 228),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '品名',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _typeController,
                  decoration: const InputDecoration(
                    labelText: '型式',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a type';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _shelfNumberController,
                  decoration: const InputDecoration(
                    labelText: '棚番号',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a shelf number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _barcodeController,
                  decoration: const InputDecoration(
                    labelText: 'バーコード番号',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a barcode number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    labelText: '数量',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a quantity';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _specificationController, // 追加: 仕様
                  decoration: const InputDecoration(
                    labelText: '仕様',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a specification';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _detailsController, // 追加: 詳細
                  decoration: const InputDecoration(
                    labelText: '詳細',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter details';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _manufacturerController, // 追加: メーカー名
                  decoration: const InputDecoration(
                    labelText: 'メーカー名',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a manufacturer name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('送信'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _selectImage();
                  },
                  child: const Text('画像選択'),
                ),
                _selectedImagePath.isNotEmpty
                    ? Image.network(_selectedImagePath)
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'マップ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '検索履歴',
          ),
        ],
        backgroundColor: Color.fromARGB(255, 230, 80, 228),
        selectedItemColor: Colors.white,
      ),
    );
  }

  void _selectImage() {
    _uploadImage();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final type = _typeController.text;
      final shelfNumber = _shelfNumberController.text;
      final barcode = _barcodeController.text;
      final quantity = _quantityController.text;
      final specification = _specificationController.text; // 追加: 仕様
      final details = _detailsController.text; // 追加: 詳細
      final manufacturer = _manufacturerController.text; // 追加: メーカー名

      CollectionReference items =
          FirebaseFirestore.instance.collection('items');
      await items.add({
        'name': name,
        'type': type,
        'shelfNumber': shelfNumber,
        'barcode': barcode,
        'quantity': quantity,
        'specification': specification, // 画像のURLをFirestoreに保存
        'details': details, // 追加: 詳細
        'manufacturer': manufacturer, // 追加: メーカー名
        'imageUrl': _selectedImagePath,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item successfully added')),
      );

      _nameController.clear();
      _typeController.clear();
      _shelfNumberController.clear();
      _barcodeController.clear();
      _quantityController.clear();
      _specificationController.clear(); // 追加: 仕様
      _detailsController.clear(); // 追加: 詳細
      _manufacturerController.clear(); // 追加: メーカー名
      setState(() {
        _selectedImagePath = '';
      });
    }
  }
}
