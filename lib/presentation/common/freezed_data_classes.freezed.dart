// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginObjectTearOff {
  const _$LoginObjectTearOff();

  _loginObject call(String userName, String password) {
    return _loginObject(
      userName,
      password,
    );
  }
}

/// @nodoc
const $LoginObject = _$LoginObjectTearOff();

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$loginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$loginObjectCopyWith(
          _loginObject value, $Res Function(_loginObject) then) =
      __$loginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String password});
}

/// @nodoc
class __$loginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$loginObjectCopyWith<$Res> {
  __$loginObjectCopyWithImpl(
      _loginObject _value, $Res Function(_loginObject) _then)
      : super(_value, (v) => _then(v as _loginObject));

  @override
  _loginObject get _value => super._value as _loginObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_loginObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_loginObject implements _loginObject {
  _$_loginObject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _loginObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$loginObjectCopyWith<_loginObject> get copyWith =>
      __$loginObjectCopyWithImpl<_loginObject>(this, _$identity);
}

abstract class _loginObject implements LoginObject {
  factory _loginObject(String userName, String password) = _$_loginObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$loginObjectCopyWith<_loginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RegisterObjectTearOff {
  const _$RegisterObjectTearOff();

  _registerObject call(
      String userName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture) {
    return _registerObject(
      userName,
      countryMobileCode,
      mobileNumber,
      email,
      password,
      profilePicture,
    );
  }
}

/// @nodoc
const $RegisterObject = _$RegisterObjectTearOff();

/// @nodoc
mixin _$RegisterObject {
  String get userName => throw _privateConstructorUsedError;
  String get countryMobileCode => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  final RegisterObject _value;
  // ignore: unused_field
  final $Res Function(RegisterObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? countryMobileCode = freezed,
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode: countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$registerObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$registerObjectCopyWith(
          _registerObject value, $Res Function(_registerObject) then) =
      __$registerObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture});
}

/// @nodoc
class __$registerObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res>
    implements _$registerObjectCopyWith<$Res> {
  __$registerObjectCopyWithImpl(
      _registerObject _value, $Res Function(_registerObject) _then)
      : super(_value, (v) => _then(v as _registerObject));

  @override
  _registerObject get _value => super._value as _registerObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? countryMobileCode = freezed,
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_registerObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_registerObject implements _registerObject {
  _$_registerObject(this.userName, this.countryMobileCode, this.mobileNumber,
      this.email, this.password, this.profilePicture);

  @override
  final String userName;
  @override
  final String countryMobileCode;
  @override
  final String mobileNumber;
  @override
  final String email;
  @override
  final String password;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'RegisterObject(userName: $userName, countryMobileCode: $countryMobileCode, mobileNumber: $mobileNumber, email: $email, password: $password, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _registerObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.countryMobileCode, countryMobileCode) &&
            const DeepCollectionEquality()
                .equals(other.mobileNumber, mobileNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(countryMobileCode),
      const DeepCollectionEquality().hash(mobileNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(profilePicture));

  @JsonKey(ignore: true)
  @override
  _$registerObjectCopyWith<_registerObject> get copyWith =>
      __$registerObjectCopyWithImpl<_registerObject>(this, _$identity);
}

abstract class _registerObject implements RegisterObject {
  factory _registerObject(
      String userName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture) = _$_registerObject;

  @override
  String get userName;
  @override
  String get countryMobileCode;
  @override
  String get mobileNumber;
  @override
  String get email;
  @override
  String get password;
  @override
  String get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$registerObjectCopyWith<_registerObject> get copyWith =>
      throw _privateConstructorUsedError;
}
