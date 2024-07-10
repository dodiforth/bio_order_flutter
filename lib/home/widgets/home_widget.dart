import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_product_order_flutter/common/theme/custom_colors.dart';
import 'package:e_product_order_flutter/home/product_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageController = PageController();
  int bannerIndex = 0;

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
                  color: CustomThemeColors.basicBackground,
                ),
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
                  color: CustomThemeColors.contrastPrimary,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ProductDetailScreen()),
                          );
                        },
                        child: Container(
                          width: 160,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                              color: Colors.grey
                          ),
                        ),
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
