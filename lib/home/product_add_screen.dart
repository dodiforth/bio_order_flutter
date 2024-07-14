import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_product_order_flutter/home/camera_vo.dart';
import 'package:e_product_order_flutter/model/category.dart';
import 'package:e_product_order_flutter/model/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isSale = false;

  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  Uint8List? imageData;
  XFile? image;

  Category? selectedCategory;

  // TEC = Text Editing Controller
  TextEditingController titleTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();
  TextEditingController priceTEC = TextEditingController();
  TextEditingController stockTEC = TextEditingController();
  TextEditingController salePercentTEC = TextEditingController();

  List<Category> categoryItems = [];

  Future<List<Category>> _fetchCategories() async {
    final resp = await db.collection("category").get();
    for (var doc in resp.docs) {
      categoryItems.add(
        Category(
          docId: doc.id,
          title: doc.data()["title"],
        ),
      );
    }
    setState(() {
      selectedCategory = categoryItems.first;
    });
    return categoryItems;
  }

  Future<Uint8List> imageCompressList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 300,
      minWidth: 300,
      quality: 50,
    );
    return result;
  }

  Future addProduct() async {
    if (imageData != null) {
      final storageRef = storage.ref().child(
          "${DateTime.now().millisecondsSinceEpoch}_${image?.name ?? "???"}.jpg");
      final compressedImageData = await imageCompressList(imageData!);
      await storageRef.putData(compressedImageData!);
      final downloadLink = await storageRef.getDownloadURL();
      final sampleData = Product(
        title: titleTEC.text,
        description: descriptionTEC.text,
        price: int.parse(priceTEC.text),
        stock: int.parse(stockTEC.text),
        isSale: isSale,
        saleRate: salePercentTEC.text.isNotEmpty
            ? double.parse(salePercentTEC.text)
            : 0,
        imgUrl: downloadLink,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      );
      final doc = await db.collection("products").add(sampleData.toJson());
      await doc.collection("category").add(selectedCategory?.toJson() ?? {});
      final categoRef = db.collection("category").doc(selectedCategory?.docId);
      await categoRef.collection("products").add({"docId": doc.id});
    }
  }

  Future addProducts() async {
    if (imageData != null) {
      final storageRef = storage.ref().child(
          "${DateTime.now().millisecondsSinceEpoch}_${image?.name ?? "???"}.jpg");
      final compressedImageData = await imageCompressList(imageData!);
      await storageRef.putData(compressedImageData!);
      final downloadLink = await storageRef.getDownloadURL();

      for(var i = 0; i < 10; i++) {
        final sampleData = Product(
          title: "${titleTEC.text}$i",
          description: descriptionTEC.text,
          price: int.parse(priceTEC.text),
          stock: int.parse(stockTEC.text),
          isSale: isSale,
          saleRate: salePercentTEC.text.isNotEmpty
              ? double.parse(salePercentTEC.text)
              : 0,
          imgUrl: downloadLink,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        );
        final doc = await db.collection("products").add(sampleData.toJson());
        await doc.collection("category").add(selectedCategory?.toJson() ?? {});
        final categoRef = db.collection("category").doc(selectedCategory?.docId);
        await categoRef.collection("products").add({"docId": doc.id});
      }

    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Add",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const CameraValueObject();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.camera)),
          IconButton(
              onPressed: () {
                addProducts();
              }, icon: const Icon(Icons.batch_prediction)),
          IconButton(
              onPressed: () {
                addProduct();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  image = await picker.pickImage(source: ImageSource.gallery);
                  print("${image?.name},${image?.path}");
                  imageData = await image!.readAsBytes();
                  setState(() {});
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: imageData == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              Text("Add product image"),
                            ],
                          )
                        : Image.memory(
                            imageData!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              // Product Info form
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Product Infos",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "DraftingMono",
                        fontWeight: FontWeight.w700),
                  )),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleTEC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Product Title',
                        hintText: "Type product name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter product title";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: descriptionTEC,
                      maxLines: null,
                      maxLength: 254,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Product Description',
                        hintText: "Type product description",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter product description";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: priceTEC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Price(Unit)",
                        hintText: "Type product\'s Unit price",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter product price";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: stockTEC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Stock",
                        hintText: "Type product\'s stock",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter product stock";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SwitchListTile.adaptive(
                      value: isSale,
                      onChanged: (v) {
                        setState(() {
                          isSale = v;
                        });
                      },
                      title: Text("Sale"),
                    ),
                    if (isSale)
                      TextFormField(
                        controller: salePercentTEC,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Sale\'s Percent",
                          hintText: "Type product\'s sale percent",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return null;
                        },
                      ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Choose Category",
                      style:
                          TextStyle(fontFamily: "DraftingMono", fontSize: 20),
                    ),
                    categoryItems.isNotEmpty
                        ? DropdownButton<Category>(
                            isExpanded: true,
                            value: selectedCategory,
                            items: categoryItems
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text("${e.title}"),
                                  ),
                                )
                                .toList(),
                            onChanged: (s) {
                              setState(() {
                                selectedCategory = s;
                              });
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
