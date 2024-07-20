import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_product_order_flutter/main.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.product.title}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 320,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.product.imgUrl ?? "",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          switch (widget.product.isSale) {
                            true => Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                child: Text(
                                  "On Sale",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            _ => Container(),
                          }
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.title ?? "Empty Name",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                            PopupMenuButton(itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text("Review"),
                                  onTap: () {
                                    int reviewScore = 0;
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        TextEditingController reviewTEC =
                                            TextEditingController();
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return AlertDialog(
                                            title: Text("Review"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: reviewTEC,
                                                ),
                                                Row(
                                                  children: List.generate(
                                                    5,
                                                    (index) => IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          reviewScore = index;
                                                        });
                                                      },
                                                      icon: Icon(Icons.star,
                                                          color: index <=
                                                                  reviewScore
                                                              ? Colors
                                                                  .amberAccent
                                                              : Colors.grey),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text("Submit")),
                                            ],
                                          );
                                        });
                                      },
                                    );
                                  },
                                ),
                              ];
                            })
                          ],
                        ),
                        Text("Product infos"),
                        Text("${widget.product.description}"),
                        Row(
                          children: [
                            Text(
                              "${widget.product.price} €",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                            ),
                            Text("4.5")
                          ],
                        )
                      ],
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(tabs: [
                          Tab(
                            text: "Detail",
                          ),
                          Tab(
                            text: "Reviews",
                          ),
                        ]),
                        Container(
                          height: 500,
                          child: TabBarView(
                            children: [
                              Container(
                                child: Text("Product detail"),
                              ),
                              Container(
                                child: Text("Reviews"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final db = FirebaseFirestore.instance;
              final duplicatedItems = await db
                  .collection("cart")
                  .where("uid", isEqualTo: userCredential?.user?.uid ?? "")
                  .where("product.docId", isEqualTo: widget.product.docId)
                  .get();
              if (duplicatedItems.docs.isNotEmpty) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text("Already in cart"),
                    ),
                  );
                }
                return;
              }
              // add to cart
              await db.collection("cart").add({
                "uid" : userCredential?.user?.uid ?? "",
                "email" : userCredential?.user?.email ?? "",
                "timestamp" : DateTime.now().millisecondsSinceEpoch,
                "product" : widget.product.toJson(),
                "count" : 1
              },);
              if(context.mounted){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text("Added to cart"),
                  ),
                );
              }
            },
            child: Container(
              height: 72,
              color: Colors.red[100],
              child: Center(
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
