// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reqs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reqs _$ReqsFromJson(Map<String, dynamic> json) {
  return _Reqs.fromJson(json);
}

/// @nodoc
mixin _$Reqs {
  String? get url => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  Map<String, dynamic>? get queryParameters =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  String get fileKey => throw _privateConstructorUsedError;

  /// Serializes this Reqs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReqsCopyWith<Reqs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqsCopyWith<$Res> {
  factory $ReqsCopyWith(Reqs value, $Res Function(Reqs) then) =
      _$ReqsCopyWithImpl<$Res, Reqs>;
  @useResult
  $Res call(
      {String? url,
      String? path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      String? filePath,
      String fileKey});
}

/// @nodoc
class _$ReqsCopyWithImpl<$Res, $Val extends Reqs>
    implements $ReqsCopyWith<$Res> {
  _$ReqsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? path = freezed,
    Object? queryParameters = freezed,
    Object? data = freezed,
    Object? filePath = freezed,
    Object? fileKey = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      queryParameters: freezed == queryParameters
          ? _value.queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileKey: null == fileKey
          ? _value.fileKey
          : fileKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqsImplCopyWith<$Res> implements $ReqsCopyWith<$Res> {
  factory _$$ReqsImplCopyWith(
          _$ReqsImpl value, $Res Function(_$ReqsImpl) then) =
      __$$ReqsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      String? filePath,
      String fileKey});
}

/// @nodoc
class __$$ReqsImplCopyWithImpl<$Res>
    extends _$ReqsCopyWithImpl<$Res, _$ReqsImpl>
    implements _$$ReqsImplCopyWith<$Res> {
  __$$ReqsImplCopyWithImpl(_$ReqsImpl _value, $Res Function(_$ReqsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? path = freezed,
    Object? queryParameters = freezed,
    Object? data = freezed,
    Object? filePath = freezed,
    Object? fileKey = null,
  }) {
    return _then(_$ReqsImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileKey: null == fileKey
          ? _value.fileKey
          : fileKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqsImpl implements _Reqs {
  _$ReqsImpl(
      {this.url,
      this.path,
      final Map<String, dynamic>? queryParameters,
      final Map<String, dynamic>? data,
      this.filePath,
      this.fileKey = 'userfile'})
      : _queryParameters = queryParameters,
        _data = data;

  factory _$ReqsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqsImplFromJson(json);

  @override
  final String? url;
  @override
  final String? path;
  final Map<String, dynamic>? _queryParameters;
  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? filePath;
  @override
  @JsonKey()
  final String fileKey;

  @override
  String toString() {
    return 'Reqs(url: $url, path: $path, queryParameters: $queryParameters, data: $data, filePath: $filePath, fileKey: $fileKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqsImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileKey, fileKey) || other.fileKey == fileKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      path,
      const DeepCollectionEquality().hash(_queryParameters),
      const DeepCollectionEquality().hash(_data),
      filePath,
      fileKey);

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqsImplCopyWith<_$ReqsImpl> get copyWith =>
      __$$ReqsImplCopyWithImpl<_$ReqsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqsImplToJson(
      this,
    );
  }
}

abstract class _Reqs implements Reqs {
  factory _Reqs(
      {final String? url,
      final String? path,
      final Map<String, dynamic>? queryParameters,
      final Map<String, dynamic>? data,
      final String? filePath,
      final String fileKey}) = _$ReqsImpl;

  factory _Reqs.fromJson(Map<String, dynamic> json) = _$ReqsImpl.fromJson;

  @override
  String? get url;
  @override
  String? get path;
  @override
  Map<String, dynamic>? get queryParameters;
  @override
  Map<String, dynamic>? get data;
  @override
  String? get filePath;
  @override
  String get fileKey;

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReqsImplCopyWith<_$ReqsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
