import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Prodcut with _$Prodcut {
  factory Prodcut({
    String? docId,
    String? title,
    String? description,
    int? price,
    bool? isSale,
    int? stock,
    double? saleRate,
    String? imgUrl,
    int? timestamp,
  }) = _Product;

  factory Prodcut.fromJson(Map<String, dynamic> json) => _$ProdcutFromJson(json);
}


@freezed
sealed class Cart with _$Cart {
  factory Cart({
    String? cartDocId,
    String? uid,
    String? email,
    int? timestamp,
    int? count,
    Prodcut? prodcut,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}