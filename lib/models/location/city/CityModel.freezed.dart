// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CityModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  int get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get arName => throw _privateConstructorUsedError;
  String get enName => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get offers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res, CityModel>;
  @useResult
  $Res call(
      {int id,
      String key,
      String arName,
      String enName,
      dynamic country,
      dynamic offers});
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res, $Val extends CityModel>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

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
    Object? country = freezed,
    Object? offers = freezed,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      offers: freezed == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$$_CityModelCopyWith(
          _$_CityModel value, $Res Function(_$_CityModel) then) =
      __$$_CityModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String key,
      String arName,
      String enName,
      dynamic country,
      dynamic offers});
}

/// @nodoc
class __$$_CityModelCopyWithImpl<$Res>
    extends _$CityModelCopyWithImpl<$Res, _$_CityModel>
    implements _$$_CityModelCopyWith<$Res> {
  __$$_CityModelCopyWithImpl(
      _$_CityModel _value, $Res Function(_$_CityModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? arName = null,
    Object? enName = null,
    Object? country = freezed,
    Object? offers = freezed,
  }) {
    return _then(_$_CityModel(
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      offers: freezed == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CityModel implements _CityModel {
  _$_CityModel(
      {required this.id,
      required this.key,
      required this.arName,
      required this.enName,
      this.country,
      this.offers});

  factory _$_CityModel.fromJson(Map<String, dynamic> json) =>
      _$$_CityModelFromJson(json);

  @override
  final int id;
  @override
  final String key;
  @override
  final String arName;
  @override
  final String enName;
  @override
  final dynamic country;
  @override
  final dynamic offers;

  @override
  String toString() {
    return 'CityModel(id: $id, key: $key, arName: $arName, enName: $enName, country: $country, offers: $offers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.arName, arName) || other.arName == arName) &&
            (identical(other.enName, enName) || other.enName == enName) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.offers, offers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      key,
      arName,
      enName,
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(offers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityModelCopyWith<_$_CityModel> get copyWith =>
      __$$_CityModelCopyWithImpl<_$_CityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityModelToJson(
      this,
    );
  }
}

abstract class _CityModel implements CityModel {
  factory _CityModel(
      {required final int id,
      required final String key,
      required final String arName,
      required final String enName,
      final dynamic country,
      final dynamic offers}) = _$_CityModel;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$_CityModel.fromJson;

  @override
  int get id;
  @override
  String get key;
  @override
  String get arName;
  @override
  String get enName;
  @override
  dynamic get country;
  @override
  dynamic get offers;
  @override
  @JsonKey(ignore: true)
  _$$_CityModelCopyWith<_$_CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
