import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_product_order_flutter/common/theme/custom_colors.dart';
import 'package:e_product_order_flutter/home/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../model/product.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageController = PageController();
  int bannerIndex = 0;

  List<Category> categoryItems = [];

  // TODO: fetch the list of categories
  Stream<QuerySnapshot<Map<String, dynamic>>> streamCategories() {
    return FirebaseFirestore.instance.collection("category").snapshots();
  }

  // TODO: fetch the featured Products
  Future<List<Product>> fetchFeaturedProducts() async {
    final dbRef = FirebaseFirestore.instance.collection("products");
    final saleItems =
        await dbRef.where("isSale", isEqualTo: true).orderBy("saleRate").get();
    List<Product> prodcuts = [];
    for (var doc in saleItems.docs) {
      final item = Product.fromJson(doc.data());
      final copyItem = item.copyWith(docId: doc.id);
      prodcuts.add(copyItem);
    }
    return prodcuts;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 140,
            color: Colors.indigo,
            margin: EdgeInsets.only(bottom: 8),
            child: PageView(
              controller: pageController,
              children: [
                Container(
                  color: CustomThemeColors.logoBackground,
                  padding: EdgeInsets.all(8),
                  child: Image.asset("assets/images/logo_title.png"),
                ),
                Container(
                  color: CustomThemeColors.primary,
                  padding: EdgeInsets.all(8),
                  child: Image.asset("assets/images/logo_title.png"),
                ),
                Container(
                  color: CustomThemeColors.footer,
                  padding: EdgeInsets.all(8),
                  child: Image.asset("assets/images/logo_plain.png"),
                ),
              ],
              onPageChanged: (idx) {
                setState(() {
                  bannerIndex = idx;
                });
              },
            ),
          ),
          DotsIndicator(dotsCount: 3, position: bannerIndex),
          Container(
            color: CustomThemeColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "DraftingMono",
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(onPressed: () {}, child: Text("See All")),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                //TODO: fetch the list of categories
                Container(
                  height: 200,
                  //color: CustomThemeColors.basicBackground,
                  child: StreamBuilder(
                    stream: streamCategories(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        categoryItems.clear();
                        final docs = snapshot.data;
                        final docItems = docs?.docs ?? [];
                        for (var doc in docItems) {
                          categoryItems.add(
                            Category(title: doc.data()["title"], docId: doc.id),
                          );
                        }
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemCount: categoryItems.length,
                          itemBuilder: (context, index) {
                            final item = categoryItems[index];
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  item.title ?? "Category",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "DraftingMono",
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "DraftingMono",
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(onPressed: () {}, child: Text("See All")),
                  ],
                ),
                Container(
                  height: 240,
                  //color: CustomThemeColors.basicBackground,
                  child: FutureBuilder(
                    future: fetchFeaturedProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final items = snapshot.data ?? [];
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailScreen()),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 160,
                                      margin: EdgeInsets.only(right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:  BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(item.imgUrl ?? ""),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  ),
                                  Text(item.title ?? "Product Title"),
                                  Text("${item.price.toString()} €", style: TextStyle(decoration: TextDecoration.lineThrough),),
                                  Text("${item.price! * (item.saleRate!/100)} €"),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
