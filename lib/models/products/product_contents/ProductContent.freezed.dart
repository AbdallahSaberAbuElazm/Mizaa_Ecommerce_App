// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ProductContent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductContent _$ProductContentFromJson(Map<String, dynamic> json) {
  return _ProductContent.fromJson(json);
}

/// @nodoc
mixin _$ProductContent {
  String get title => throw _privateConstructorUsedError;
  List<String> get contains => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get discount => throw _privateConstructorUsedError;
  String get discountPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductContentCopyWith<ProductContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductContentCopyWith<$Res> {
  factory $ProductContentCopyWith(
          ProductContent value, $Res Function(ProductContent) then) =
      _$ProductContentCopyWithImpl<$Res, ProductContent>;
  @useResult
  $Res call(
      {String title,
      List<String> contains,
      String price,
      String discount,
      String discountPrice});
}

/// @nodoc
class _$ProductContentCopyWithImpl<$Res, $Val extends ProductContent>
    implements $ProductContentCopyWith<$Res> {
  _$ProductContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? contains = null,
    Object? price = null,
    Object? discount = null,
    Object? discountPrice = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contains: null == contains
          ? _value.contains
          : contains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductContentCopyWith<$Res>
    implements $ProductContentCopyWith<$Res> {
  factory _$$_ProductContentCopyWith(
          _$_ProductContent value, $Res Function(_$_ProductContent) then) =
      __$$_ProductContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      List<String> contains,
      String price,
      String discount,
      String discountPrice});
}

/// @nodoc
class __$$_ProductContentCopyWithImpl<$Res>
    extends _$ProductContentCopyWithImpl<$Res, _$_ProductContent>
    implements _$$_ProductContentCopyWith<$Res> {
  __$$_ProductContentCopyWithImpl(
      _$_ProductContent _value, $Res Function(_$_ProductContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? contains = null,
    Object? price = null,
    Object? discount = null,
    Object? discountPrice = null,
  }) {
    return _then(_$_ProductContent(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contains: null == contains
          ? _value._contains
          : contains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductContent implements _ProductContent {
  _$_ProductContent(
      {required this.title,
      required final List<String> contains,
      required this.price,
      required this.discount,
      required this.discountPrice})
      : _contains = contains;

  factory _$_ProductContent.fromJson(Map<String, dynamic> json) =>
      _$$_ProductContentFromJson(json);

  @override
  final String title;
  final List<String> _contains;
  @override
  List<String> get contains {
    if (_contains is EqualUnmodifiableListView) return _contains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contains);
  }

  @override
  final String price;
  @override
  final String discount;
  @override
  final String discountPrice;

  @override
  String toString() {
    return 'ProductContent(title: $title, contains: $contains, price: $price, discount: $discount, discountPrice: $discountPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductContent &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._contains, _contains) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_contains),
      price,
      discount,
      discountPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductContentCopyWith<_$_ProductContent> get copyWith =>
      __$$_ProductContentCopyWithImpl<_$_ProductContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductContentToJson(
      this,
    );
  }
}

abstract class _ProductContent implements ProductContent {
  factory _ProductContent(
      {required final String title,
      required final List<String> contains,
      required final String price,
      required final String discount,
      required final String discountPrice}) = _$_ProductContent;

  factory _ProductContent.fromJson(Map<String, dynamic> json) =
      _$_ProductContent.fromJson;

  @override
  String get title;
  @override
  List<String> get contains;
  @override
  String get price;
  @override
  String get discount;
  @override
  String get discountPrice;
  @override
  @JsonKey(ignore: true)
  _$$_ProductContentCopyWith<_$_ProductContent> get copyWith =>
      throw _privateConstructorUsedError;
}
