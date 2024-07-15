import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_product_order_flutter/common/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:e_product_order_flutter/model/product.dart';

Future addCategory(String title) async {
  final db = FirebaseFirestore.instance;
  final ref = db.collection("category");
  await ref.add({"title": title});
}

Future<List<Product>> fetchProducts() async {
  final db = FirebaseFirestore.instance;
  final resp = await db.collection("products").orderBy("timestamp").get();
  List<Product> items = [];
  for (var doc in resp.docs) {
    final item = Product.fromJson(doc.data());
    final realItem = item.copyWith(docId: doc.id);
    items.add(item);
  }
  return items;
}

Stream<QuerySnapshot> streamProducts(String query) {
  final db = FirebaseFirestore.instance;
  if (query.isNotEmpty) {
    return db
        .collection("products")
        .orderBy("title")
        .startAt([query]).endAt([query + "\uf8ff"]).snapshots();
  }
  return db.collection("products").orderBy("timestamp").snapshots();
}

class SellerWidget extends StatefulWidget {
  const SellerWidget({super.key});

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  TextEditingController textEditingController = TextEditingController();

  update(Product? item) async {
    final db = FirebaseFirestore.instance;
    final ref = db.collection("products");
    await ref.doc(item?.docId).update(
          item!
              .copyWith(
                title: "Updated Title mk4",
                price: 99,
                stock: 99,
                isSale: false,
              )
              .toJson(),
        );
  }

  delete(Product? item) async {
    final db = FirebaseFirestore.instance;
    await db.collection("products").doc(item?.docId).delete();
    final productCategory = await db
        .collection("products")
        .doc(item?.docId)
        .collection("category")
        .get();
    final foo = productCategory.docs.first;
    final categoryId = foo.data()["docId"];
    final bar = await db
        .collection("category")
        .doc(categoryId)
        .collection("products")
        .where("docId", isEqualTo: item?.docId)
        .get();
    bar.docs.forEach((element) {
      element.reference.delete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomThemeColors.basicBackground,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            controller: textEditingController,
            leading: Icon(Icons.search),
            onChanged: (s) {
              setState(() {});
            },
            hintText: "Search",
            onTap: () {},
          ),
          SizedBox(
            height: 16,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  List<String> categoryList = [
                    "Grocery",
                    "Fruits",
                    "Vegetables",
                    "Dairy",
                    "Meat",
                    "Seafood",
                    "Bakery",
                    "Snacks",
                  ];
                  final ref = FirebaseFirestore.instance.collection("category");
                  final tmp = await ref.get();
                  //
                  for (var element in tmp.docs) {
                    await element.reference.delete();
                  } // -> 도큐먼트에 있는모든 카테거리 삭제 코드
                  for (var element in categoryList) {
                    await ref.add({"title": element});
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text("Add All Categories"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  TextEditingController tec = TextEditingController();
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: TextField(
                        controller: tec,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            if (tec.text.isNotEmpty) {
                              await addCategory(tec.text.trim());
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text("Add"),
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Category"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "My Products",
              style: TextStyle(
                  fontFamily: "DraftingMono",
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: streamProducts(textEditingController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final items = snapshot.data?.docs
                        .map(
                          (e) =>
                              Product.fromJson(e.data() as Map<String, dynamic>)
                                  .copyWith(docId: e.id),
                        )
                        .toList();
                    return ListView.builder(
                      itemCount: items?.length,
                      itemBuilder: (context, index) {
                        final item = items?[index];
                        return GestureDetector(
                          onTap: () {
                            print(item?.docId.toString());
                          },
                          child: Container(
                            height: 120,
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: CustomThemeColors.footer,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(item?.imgUrl ??
                                          "https://pixabay.com/photos/apple-fruit-wet-food-8591539/"),
                                      // "pixabay.com" -> placeholder image link
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item?.title ?? "Product Name",
                                              style: const TextStyle(
                                                  fontFamily: "DraftingMono"),
                                            ),
                                            PopupMenuButton(
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  child: const Text("Edit"),
                                                  onTap: () => update(item),
                                                ),
                                                PopupMenuItem(
                                                  child: const Text("Delete"),
                                                  onTap: () => delete(item),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Text("${item?.price} €"),
                                        Text(switch (item?.isSale) {
                                          true => "On Sale",
                                          false => "Not On Sale",
                                          _ => "??",
                                        }),
                                        Text(
                                          "In Stock : ${item?.stock}",
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
