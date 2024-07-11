// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Prodcut _$ProdcutFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Prodcut {
  String? get docId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  bool? get isSale => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  double? get saleRate => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProdcutCopyWith<Prodcut> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProdcutCopyWith<$Res> {
  factory $ProdcutCopyWith(Prodcut value, $Res Function(Prodcut) then) =
      _$ProdcutCopyWithImpl<$Res, Prodcut>;
  @useResult
  $Res call(
      {String? docId,
      String? title,
      String? description,
      int? price,
      bool? isSale,
      int? stock,
      double? saleRate,
      String? imgUrl,
      int? timestamp});
}

/// @nodoc
class _$ProdcutCopyWithImpl<$Res, $Val extends Prodcut>
    implements $ProdcutCopyWith<$Res> {
  _$ProdcutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? isSale = freezed,
    Object? stock = freezed,
    Object? saleRate = freezed,
    Object? imgUrl = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      isSale: freezed == isSale
          ? _value.isSale
          : isSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      saleRate: freezed == saleRate
          ? _value.saleRate
          : saleRate // ignore: cast_nullable_to_non_nullable
              as double?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProdcutCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? docId,
      String? title,
      String? description,
      int? price,
      bool? isSale,
      int? stock,
      double? saleRate,
      String? imgUrl,
      int? timestamp});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProdcutCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? isSale = freezed,
    Object? stock = freezed,
    Object? saleRate = freezed,
    Object? imgUrl = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$ProductImpl(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      isSale: freezed == isSale
          ? _value.isSale
          : isSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      saleRate: freezed == saleRate
          ? _value.saleRate
          : saleRate // ignore: cast_nullable_to_non_nullable
              as double?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {this.docId,
      this.title,
      this.description,
      this.price,
      this.isSale,
      this.stock,
      this.saleRate,
      this.imgUrl,
      this.timestamp});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String? docId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? price;
  @override
  final bool? isSale;
  @override
  final int? stock;
  @override
  final double? saleRate;
  @override
  final String? imgUrl;
  @override
  final int? timestamp;

  @override
  String toString() {
    return 'Prodcut(docId: $docId, title: $title, description: $description, price: $price, isSale: $isSale, stock: $stock, saleRate: $saleRate, imgUrl: $imgUrl, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isSale, isSale) || other.isSale == isSale) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.saleRate, saleRate) ||
                other.saleRate == saleRate) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, docId, title, description, price,
      isSale, stock, saleRate, imgUrl, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Prodcut {
  factory _Product(
      {final String? docId,
      final String? title,
      final String? description,
      final int? price,
      final bool? isSale,
      final int? stock,
      final double? saleRate,
      final String? imgUrl,
      final int? timestamp}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String? get docId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get price;
  @override
  bool? get isSale;
  @override
  int? get stock;
  @override
  double? get saleRate;
  @override
  String? get imgUrl;
  @override
  int? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String? get cartDocId => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  Prodcut? get prodcut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {String? cartDocId,
      String? uid,
      String? email,
      int? timestamp,
      int? count,
      Prodcut? prodcut});

  $ProdcutCopyWith<$Res>? get prodcut;
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartDocId = freezed,
    Object? uid = freezed,
    Object? email = freezed,
    Object? timestamp = freezed,
    Object? count = freezed,
    Object? prodcut = freezed,
  }) {
    return _then(_value.copyWith(
      cartDocId: freezed == cartDocId
          ? _value.cartDocId
          : cartDocId // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      prodcut: freezed == prodcut
          ? _value.prodcut
          : prodcut // ignore: cast_nullable_to_non_nullable
              as Prodcut?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProdcutCopyWith<$Res>? get prodcut {
    if (_value.prodcut == null) {
      return null;
    }

    return $ProdcutCopyWith<$Res>(_value.prodcut!, (value) {
      return _then(_value.copyWith(prodcut: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cartDocId,
      String? uid,
      String? email,
      int? timestamp,
      int? count,
      Prodcut? prodcut});

  @override
  $ProdcutCopyWith<$Res>? get prodcut;
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartDocId = freezed,
    Object? uid = freezed,
    Object? email = freezed,
    Object? timestamp = freezed,
    Object? count = freezed,
    Object? prodcut = freezed,
  }) {
    return _then(_$CartImpl(
      cartDocId: freezed == cartDocId
          ? _value.cartDocId
          : cartDocId // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      prodcut: freezed == prodcut
          ? _value.prodcut
          : prodcut // ignore: cast_nullable_to_non_nullable
              as Prodcut?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  _$CartImpl(
      {this.cartDocId,
      this.uid,
      this.email,
      this.timestamp,
      this.count,
      this.prodcut});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final String? cartDocId;
  @override
  final String? uid;
  @override
  final String? email;
  @override
  final int? timestamp;
  @override
  final int? count;
  @override
  final Prodcut? prodcut;

  @override
  String toString() {
    return 'Cart(cartDocId: $cartDocId, uid: $uid, email: $email, timestamp: $timestamp, count: $count, prodcut: $prodcut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.cartDocId, cartDocId) ||
                other.cartDocId == cartDocId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.prodcut, prodcut) || other.prodcut == prodcut));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cartDocId, uid, email, timestamp, count, prodcut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  factory _Cart(
      {final String? cartDocId,
      final String? uid,
      final String? email,
      final int? timestamp,
      final int? count,
      final Prodcut? prodcut}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  String? get cartDocId;
  @override
  String? get uid;
  @override
  String? get email;
  @override
  int? get timestamp;
  @override
  int? get count;
  @override
  Prodcut? get prodcut;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}