// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) {
  return _ErrorModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorModel {
  int? get errorCode => throw _privateConstructorUsedError;

  /// error from api response failure
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get errorCodeDescription => throw _privateConstructorUsedError;

  /// error from server common failure
  String? get error => throw _privateConstructorUsedError;
  String? get errorDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorModelCopyWith<ErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorModelCopyWith<$Res> {
  factory $ErrorModelCopyWith(
          ErrorModel value, $Res Function(ErrorModel) then) =
      _$ErrorModelCopyWithImpl<$Res>;
  $Res call(
      {int? errorCode,
      String? errorMessage,
      String? errorCodeDescription,
      String? error,
      String? errorDescription});
}

/// @nodoc
class _$ErrorModelCopyWithImpl<$Res> implements $ErrorModelCopyWith<$Res> {
  _$ErrorModelCopyWithImpl(this._value, this._then);

  final ErrorModel _value;
  // ignore: unused_field
  final $Res Function(ErrorModel) _then;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
    Object? errorCodeDescription = freezed,
    Object? error = freezed,
    Object? errorDescription = freezed,
  }) {
    return _then(_value.copyWith(
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCodeDescription: errorCodeDescription == freezed
          ? _value.errorCodeDescription
          : errorCodeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDescription: errorDescription == freezed
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ErrorModelCopyWith<$Res>
    implements $ErrorModelCopyWith<$Res> {
  factory _$$_ErrorModelCopyWith(
          _$_ErrorModel value, $Res Function(_$_ErrorModel) then) =
      __$$_ErrorModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? errorCode,
      String? errorMessage,
      String? errorCodeDescription,
      String? error,
      String? errorDescription});
}

/// @nodoc
class __$$_ErrorModelCopyWithImpl<$Res> extends _$ErrorModelCopyWithImpl<$Res>
    implements _$$_ErrorModelCopyWith<$Res> {
  __$$_ErrorModelCopyWithImpl(
      _$_ErrorModel _value, $Res Function(_$_ErrorModel) _then)
      : super(_value, (v) => _then(v as _$_ErrorModel));

  @override
  _$_ErrorModel get _value => super._value as _$_ErrorModel;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
    Object? errorCodeDescription = freezed,
    Object? error = freezed,
    Object? errorDescription = freezed,
  }) {
    return _then(_$_ErrorModel(
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCodeDescription: errorCodeDescription == freezed
          ? _value.errorCodeDescription
          : errorCodeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDescription: errorDescription == freezed
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorModel extends _ErrorModel {
  _$_ErrorModel(
      {this.errorCode,
      this.errorMessage,
      this.errorCodeDescription,
      this.error,
      this.errorDescription})
      : super._();

  factory _$_ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorModelFromJson(json);

  @override
  final int? errorCode;

  /// error from api response failure
  @override
  final String? errorMessage;
  @override
  final String? errorCodeDescription;

  /// error from server common failure
  @override
  final String? error;
  @override
  final String? errorDescription;

  @override
  String toString() {
    return 'ErrorModel(errorCode: $errorCode, errorMessage: $errorMessage, errorCodeDescription: $errorCodeDescription, error: $error, errorDescription: $errorDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorModel &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.errorCodeDescription, errorCodeDescription) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.errorDescription, errorDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(errorCodeDescription),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(errorDescription));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorModelCopyWith<_$_ErrorModel> get copyWith =>
      __$$_ErrorModelCopyWithImpl<_$_ErrorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorModelToJson(
      this,
    );
  }
}

abstract class _ErrorModel extends ErrorModel {
  factory _ErrorModel(
      {final int? errorCode,
      final String? errorMessage,
      final String? errorCodeDescription,
      final String? error,
      final String? errorDescription}) = _$_ErrorModel;
  _ErrorModel._() : super._();

  factory _ErrorModel.fromJson(Map<String, dynamic> json) =
      _$_ErrorModel.fromJson;

  @override
  int? get errorCode;
  @override

  /// error from api response failure
  String? get errorMessage;
  @override
  String? get errorCodeDescription;
  @override

  /// error from server common failure
  String? get error;
  @override
  String? get errorDescription;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorModelCopyWith<_$_ErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
