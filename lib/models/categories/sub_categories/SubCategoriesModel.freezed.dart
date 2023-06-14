// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SubCategoriesModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategoriesModel _$SubCategoriesModelFromJson(Map<String, dynamic> json) {
  return _SubCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$SubCategoriesModel {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get arName => throw _privateConstructorUsedError;
  String get enName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  OfferModel? get offers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoriesModelCopyWith<SubCategoriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoriesModelCopyWith<$Res> {
  factory $SubCategoriesModelCopyWith(
          SubCategoriesModel value, $Res Function(SubCategoriesModel) then) =
      _$SubCategoriesModelCopyWithImpl<$Res, SubCategoriesModel>;
  @useResult
  $Res call(
      {int id,
      int categoryId,
      String key,
      String arName,
      String enName,
      String imageUrl,
      String? image,
      CategoryModel? category,
      OfferModel? offers});

  $CategoryModelCopyWith<$Res>? get category;
  $OfferModelCopyWith<$Res>? get offers;
}

/// @nodoc
class _$SubCategoriesModelCopyWithImpl<$Res, $Val extends SubCategoriesModel>
    implements $SubCategoriesModelCopyWith<$Res> {
  _$SubCategoriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? key = null,
    Object? arName = null,
    Object? enName = null,
    Object? imageUrl = null,
    Object? image = freezed,
    Object? category = freezed,
    Object? offers = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      arName: null == arName
          ? _value.arName
          : arName // ignore: cast_nullable_to_non_nullable
              as String,
      enName: null == enName
          ? _value.enName
          : enName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      offers: freezed == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfferModelCopyWith<$Res>? get offers {
    if (_value.offers == null) {
      return null;
    }

    return $OfferModelCopyWith<$Res>(_value.offers!, (value) {
      return _then(_value.copyWith(offers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubCategoryModelCopyWith<$Res>
    implements $SubCategoriesModelCopyWith<$Res> {
  factory _$$_SubCategoryModelCopyWith(
          _$_SubCategoryModel value, $Res Function(_$_SubCategoryModel) then) =
      __$$_SubCategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int categoryId,
      String key,
      String arName,
      String enName,
      String imageUrl,
      String? image,
      CategoryModel? category,
      OfferModel? offers});

  @override
  $CategoryModelCopyWith<$Res>? get category;
  @override
  $OfferModelCopyWith<$Res>? get offers;
}

/// @nodoc
class __$$_SubCategoryModelCopyWithImpl<$Res>
    extends _$SubCategoriesModelCopyWithImpl<$Res, _$_SubCategoryModel>
    implements _$$_SubCategoryModelCopyWith<$Res> {
  __$$_SubCategoryModelCopyWithImpl(
      _$_SubCategoryModel _value, $Res Function(_$_SubCategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? key = null,
    Object? arName = null,
    Object? enName = null,
    Object? imageUrl = null,
    Object? image = freezed,
    Object? category = freezed,
    Object? offers = freezed,
  }) {
    return _then(_$_SubCategoryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      arName: null == arName
          ? _value.arName
          : arName // ignore: cast_nullable_to_non_nullable
              as String,
      enName: null == enName
          ? _value.enName
          : enName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      offers: freezed == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubCategoryModel implements _SubCategoryModel {
  _$_SubCategoryModel(
      {required this.id,
      required this.categoryId,
      required this.key,
      required this.arName,
      required this.enName,
      required this.imageUrl,
      this.image,
      this.category,
      this.offers});

  factory _$_SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubCategoryModelFromJson(json);

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final String key;
  @override
  final String arName;
  @override
  final String enName;
  @override
  final String imageUrl;
  @override
  final String? image;
  @override
  final CategoryModel? category;
  @override
  final OfferModel? offers;

  @override
  String toString() {
    return 'SubCategoriesModel(id: $id, categoryId: $categoryId, key: $key, arName: $arName, enName: $enName, imageUrl: $imageUrl, image: $image, category: $category, offers: $offers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.arName, arName) || other.arName == arName) &&
            (identical(other.enName, enName) || other.enName == enName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.offers, offers) || other.offers == offers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, key, arName,
      enName, imageUrl, image, category, offers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubCategoryModelCopyWith<_$_SubCategoryModel> get copyWith =>
      __$$_SubCategoryModelCopyWithImpl<_$_SubCategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubCategoryModelToJson(
      this,
    );
  }
}

abstract class _SubCategoryModel implements SubCategoriesModel {
  factory _SubCategoryModel(
      {required final int id,
      required final int categoryId,
      required final String key,
      required final String arName,
      required final String enName,
      required final String imageUrl,
      final String? image,
      final CategoryModel? category,
      final OfferModel? offers}) = _$_SubCategoryModel;

  factory _SubCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_SubCategoryModel.fromJson;

  @override
  int get id;
  @override
  int get categoryId;
  @override
  String get key;
  @override
  String get arName;
  @override
  String get enName;
  @override
  String get imageUrl;
  @override
  String? get image;
  @override
  CategoryModel? get category;
  @override
  OfferModel? get offers;
  @override
  @JsonKey(ignore: true)
  _$$_SubCategoryModelCopyWith<_$_SubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
