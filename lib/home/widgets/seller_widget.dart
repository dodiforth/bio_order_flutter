import 'package:e_product_order_flutter/common/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class SellerWidget extends StatefulWidget {
  const SellerWidget({super.key});

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomThemeColors.basicBackground,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(),
          SizedBox(
            height: 16,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text("Add All Categories"),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text("Add Category"),
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
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            color: CustomThemeColors.footer,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Product Name",style: TextStyle(fontFamily: "DraftingMono"),),
                                  PopupMenuButton(itemBuilder: (context) => [
                                    PopupMenuItem(child: Text("Edit")),
                                    PopupMenuItem(child: Text("Delete")),
                                  ])
                                ],
                              ),
                              Text("€ 19,99"),
                              Text("On Sale"),
                              Text("In Stock",)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
