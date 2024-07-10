import 'package:flutter/material.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSale = false;

  // TEC = Text Editing Controller
  TextEditingController titleTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();
  TextEditingController priceTEC = TextEditingController();
  TextEditingController stockTEC = TextEditingController();
  TextEditingController salePercentTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Add",
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.batch_prediction)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text("Add product image"),
                    ],
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
                      decoration: InputDecoration(
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
                        decoration: InputDecoration(
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
                    DropdownButton(
                        isExpanded: true, items: [], onChanged: (s) {}),
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