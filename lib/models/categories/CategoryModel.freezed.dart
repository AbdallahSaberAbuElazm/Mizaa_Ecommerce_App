// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CategoryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get arName => throw _privateConstructorUsedError;
  String get enName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  List<SubCategoriesModel>? get subCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {int id,
      String key,
      String arName,
      String enName,
      String imageUrl,
      String? image,
      int order,
      List<SubCategoriesModel>? subCategories});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? arName = null,
    Object? enName = null,
    Object? imageUrl = null,
    Object? image = freezed,
    Object? order = null,
    Object? subCategories = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      subCategories: freezed == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoriesModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$_CategoryModelCopyWith(
          _$_CategoryModel value, $Res Function(_$_CategoryModel) then) =
      __$$_CategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String key,
      String arName,
      String enName,
      String imageUrl,
      String? image,
      int order,
      List<SubCategoriesModel>? subCategories});
}

/// @nodoc
class __$$_CategoryModelCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$_CategoryModel>
    implements _$$_CategoryModelCopyWith<$Res> {
  __$$_CategoryModelCopyWithImpl(
      _$_CategoryModel _value, $Res Function(_$_CategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? arName = null,
    Object? enName = null,
    Object? imageUrl = null,
    Object? image = freezed,
    Object? order = null,
    Object? subCategories = freezed,
  }) {
    return _then(_$_CategoryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      subCategories: freezed == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoriesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryModel implements _CategoryModel {
  _$_CategoryModel(
      {required this.id,
      required this.key,
      required this.arName,
      required this.enName,
      required this.imageUrl,
      this.image,
      required this.order,
      final List<SubCategoriesModel>? subCategories})
      : _subCategories = subCategories;

  factory _$_CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryModelFromJson(json);

  @override
  final int id;
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
  final int order;
  final List<SubCategoriesModel>? _subCategories;
  @override
  List<SubCategoriesModel>? get subCategories {
    final value = _subCategories;
    if (value == null) return null;
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, key: $key, arName: $arName, enName: $enName, imageUrl: $imageUrl, image: $image, order: $order, subCategories: $subCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.arName, arName) || other.arName == arName) &&
            (identical(other.enName, enName) || other.enName == enName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      key,
      arName,
      enName,
      imageUrl,
      image,
      order,
      const DeepCollectionEquality().hash(_subCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryModelCopyWith<_$_CategoryModel> get copyWith =>
      __$$_CategoryModelCopyWithImpl<_$_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryModelToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  factory _CategoryModel(
      {required final int id,
      required final String key,
      required final String arName,
      required final String enName,
      required final String imageUrl,
      final String? image,
      required final int order,
      final List<SubCategoriesModel>? subCategories}) = _$_CategoryModel;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryModel.fromJson;

  @override
  int get id;
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
  int get order;
  @override
  List<SubCategoriesModel>? get subCategories;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryModelCopyWith<_$_CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
