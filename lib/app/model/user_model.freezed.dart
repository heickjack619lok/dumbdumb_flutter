// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get id => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get icNumber => throw _privateConstructorUsedError;
  String? get fullName =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'createdDate')
  String? get createdDateString => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int? gender,
      String? email,
      String? icNumber,
      String? fullName,
      @JsonKey(name: 'createdDate') String? createdDateString,
      String? phoneNumber,
      String? accessToken,
      String? refreshToken});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? icNumber = freezed,
    Object? fullName = freezed,
    Object? createdDateString = freezed,
    Object? phoneNumber = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      icNumber: icNumber == freezed
          ? _value.icNumber
          : icNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateString: createdDateString == freezed
          ? _value.createdDateString
          : createdDateString // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int? gender,
      String? email,
      String? icNumber,
      String? fullName,
      @JsonKey(name: 'createdDate') String? createdDateString,
      String? phoneNumber,
      String? accessToken,
      String? refreshToken});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, (v) => _then(v as _$_UserModel));

  @override
  _$_UserModel get _value => super._value as _$_UserModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? icNumber = freezed,
    Object? fullName = freezed,
    Object? createdDateString = freezed,
    Object? phoneNumber = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_UserModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      icNumber: icNumber == freezed
          ? _value.icNumber
          : icNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateString: createdDateString == freezed
          ? _value.createdDateString
          : createdDateString // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel extends _UserModel {
  _$_UserModel(
      {this.id,
      this.gender,
      this.email,
      this.icNumber,
      this.fullName,
      @JsonKey(name: 'createdDate') this.createdDateString,
      this.phoneNumber,
      this.accessToken,
      this.refreshToken})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String? id;
  @override
  final int? gender;
  @override
  final String? email;
  @override
  final String? icNumber;
  @override
  final String? fullName;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'createdDate')
  final String? createdDateString;
  @override
  final String? phoneNumber;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'UserModel(id: $id, gender: $gender, email: $email, icNumber: $icNumber, fullName: $fullName, createdDateString: $createdDateString, phoneNumber: $phoneNumber, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.icNumber, icNumber) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality()
                .equals(other.createdDateString, createdDateString) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(icNumber),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(createdDateString),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  factory _UserModel(
      {final String? id,
      final int? gender,
      final String? email,
      final String? icNumber,
      final String? fullName,
      @JsonKey(name: 'createdDate') final String? createdDateString,
      final String? phoneNumber,
      final String? accessToken,
      final String? refreshToken}) = _$_UserModel;
  _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get id;
  @override
  int? get gender;
  @override
  String? get email;
  @override
  String? get icNumber;
  @override
  String? get fullName;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'createdDate')
  String? get createdDateString;
  @override
  String? get phoneNumber;
  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
