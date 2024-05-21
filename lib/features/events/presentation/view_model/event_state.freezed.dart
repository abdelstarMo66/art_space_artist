// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createEventLoading,
    required TResult Function(T event) createEventSuccess,
    required TResult Function(String message) createEventFailure,
    required TResult Function() addEventCoverImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createEventLoading,
    TResult? Function(T event)? createEventSuccess,
    TResult? Function(String message)? createEventFailure,
    TResult? Function()? addEventCoverImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createEventLoading,
    TResult Function(T event)? createEventSuccess,
    TResult Function(String message)? createEventFailure,
    TResult Function()? addEventCoverImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CreateEventLoading<T> value) createEventLoading,
    required TResult Function(CreateEventSuccess<T> value) createEventSuccess,
    required TResult Function(CreateEventFailure<T> value) createEventFailure,
    required TResult Function(AddEventCoverImage<T> value) addEventCoverImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CreateEventLoading<T> value)? createEventLoading,
    TResult? Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult? Function(CreateEventFailure<T> value)? createEventFailure,
    TResult? Function(AddEventCoverImage<T> value)? addEventCoverImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CreateEventLoading<T> value)? createEventLoading,
    TResult Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult Function(CreateEventFailure<T> value)? createEventFailure,
    TResult Function(AddEventCoverImage<T> value)? addEventCoverImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<T, $Res> {
  factory $EventStateCopyWith(
          EventState<T> value, $Res Function(EventState<T>) then) =
      _$EventStateCopyWithImpl<T, $Res, EventState<T>>;
}

/// @nodoc
class _$EventStateCopyWithImpl<T, $Res, $Val extends EventState<T>>
    implements $EventStateCopyWith<T, $Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$EventStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EventState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createEventLoading,
    required TResult Function(T event) createEventSuccess,
    required TResult Function(String message) createEventFailure,
    required TResult Function() addEventCoverImage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createEventLoading,
    TResult? Function(T event)? createEventSuccess,
    TResult? Function(String message)? createEventFailure,
    TResult? Function()? addEventCoverImage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createEventLoading,
    TResult Function(T event)? createEventSuccess,
    TResult Function(String message)? createEventFailure,
    TResult Function()? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CreateEventLoading<T> value) createEventLoading,
    required TResult Function(CreateEventSuccess<T> value) createEventSuccess,
    required TResult Function(CreateEventFailure<T> value) createEventFailure,
    required TResult Function(AddEventCoverImage<T> value) addEventCoverImage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CreateEventLoading<T> value)? createEventLoading,
    TResult? Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult? Function(CreateEventFailure<T> value)? createEventFailure,
    TResult? Function(AddEventCoverImage<T> value)? addEventCoverImage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CreateEventLoading<T> value)? createEventLoading,
    TResult Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult Function(CreateEventFailure<T> value)? createEventFailure,
    TResult Function(AddEventCoverImage<T> value)? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements EventState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$CreateEventLoadingImplCopyWith<T, $Res> {
  factory _$$CreateEventLoadingImplCopyWith(_$CreateEventLoadingImpl<T> value,
          $Res Function(_$CreateEventLoadingImpl<T>) then) =
      __$$CreateEventLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CreateEventLoadingImplCopyWithImpl<T, $Res>
    extends _$EventStateCopyWithImpl<T, $Res, _$CreateEventLoadingImpl<T>>
    implements _$$CreateEventLoadingImplCopyWith<T, $Res> {
  __$$CreateEventLoadingImplCopyWithImpl(_$CreateEventLoadingImpl<T> _value,
      $Res Function(_$CreateEventLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateEventLoadingImpl<T> implements CreateEventLoading<T> {
  const _$CreateEventLoadingImpl();

  @override
  String toString() {
    return 'EventState<$T>.createEventLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createEventLoading,
    required TResult Function(T event) createEventSuccess,
    required TResult Function(String message) createEventFailure,
    required TResult Function() addEventCoverImage,
  }) {
    return createEventLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createEventLoading,
    TResult? Function(T event)? createEventSuccess,
    TResult? Function(String message)? createEventFailure,
    TResult? Function()? addEventCoverImage,
  }) {
    return createEventLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createEventLoading,
    TResult Function(T event)? createEventSuccess,
    TResult Function(String message)? createEventFailure,
    TResult Function()? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (createEventLoading != null) {
      return createEventLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CreateEventLoading<T> value) createEventLoading,
    required TResult Function(CreateEventSuccess<T> value) createEventSuccess,
    required TResult Function(CreateEventFailure<T> value) createEventFailure,
    required TResult Function(AddEventCoverImage<T> value) addEventCoverImage,
  }) {
    return createEventLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CreateEventLoading<T> value)? createEventLoading,
    TResult? Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult? Function(CreateEventFailure<T> value)? createEventFailure,
    TResult? Function(AddEventCoverImage<T> value)? addEventCoverImage,
  }) {
    return createEventLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CreateEventLoading<T> value)? createEventLoading,
    TResult Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult Function(CreateEventFailure<T> value)? createEventFailure,
    TResult Function(AddEventCoverImage<T> value)? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (createEventLoading != null) {
      return createEventLoading(this);
    }
    return orElse();
  }
}

abstract class CreateEventLoading<T> implements EventState<T> {
  const factory CreateEventLoading() = _$CreateEventLoadingImpl<T>;
}

/// @nodoc
abstract class _$$CreateEventSuccessImplCopyWith<T, $Res> {
  factory _$$CreateEventSuccessImplCopyWith(_$CreateEventSuccessImpl<T> value,
          $Res Function(_$CreateEventSuccessImpl<T>) then) =
      __$$CreateEventSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T event});
}

/// @nodoc
class __$$CreateEventSuccessImplCopyWithImpl<T, $Res>
    extends _$EventStateCopyWithImpl<T, $Res, _$CreateEventSuccessImpl<T>>
    implements _$$CreateEventSuccessImplCopyWith<T, $Res> {
  __$$CreateEventSuccessImplCopyWithImpl(_$CreateEventSuccessImpl<T> _value,
      $Res Function(_$CreateEventSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(_$CreateEventSuccessImpl<T>(
      freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CreateEventSuccessImpl<T> implements CreateEventSuccess<T> {
  const _$CreateEventSuccessImpl(this.event);

  @override
  final T event;

  @override
  String toString() {
    return 'EventState<$T>.createEventSuccess(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.event, event));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(event));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventSuccessImplCopyWith<T, _$CreateEventSuccessImpl<T>>
      get copyWith => __$$CreateEventSuccessImplCopyWithImpl<T,
          _$CreateEventSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createEventLoading,
    required TResult Function(T event) createEventSuccess,
    required TResult Function(String message) createEventFailure,
    required TResult Function() addEventCoverImage,
  }) {
    return createEventSuccess(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createEventLoading,
    TResult? Function(T event)? createEventSuccess,
    TResult? Function(String message)? createEventFailure,
    TResult? Function()? addEventCoverImage,
  }) {
    return createEventSuccess?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createEventLoading,
    TResult Function(T event)? createEventSuccess,
    TResult Function(String message)? createEventFailure,
    TResult Function()? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (createEventSuccess != null) {
      return createEventSuccess(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CreateEventLoading<T> value) createEventLoading,
    required TResult Function(CreateEventSuccess<T> value) createEventSuccess,
    required TResult Function(CreateEventFailure<T> value) createEventFailure,
    required TResult Function(AddEventCoverImage<T> value) addEventCoverImage,
  }) {
    return createEventSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CreateEventLoading<T> value)? createEventLoading,
    TResult? Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult? Function(CreateEventFailure<T> value)? createEventFailure,
    TResult? Function(AddEventCoverImage<T> value)? addEventCoverImage,
  }) {
    return createEventSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CreateEventLoading<T> value)? createEventLoading,
    TResult Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult Function(CreateEventFailure<T> value)? createEventFailure,
    TResult Function(AddEventCoverImage<T> value)? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (createEventSuccess != null) {
      return createEventSuccess(this);
    }
    return orElse();
  }
}

abstract class CreateEventSuccess<T> implements EventState<T> {
  const factory CreateEventSuccess(final T event) = _$CreateEventSuccessImpl<T>;

  T get event;
  @JsonKey(ignore: true)
  _$$CreateEventSuccessImplCopyWith<T, _$CreateEventSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateEventFailureImplCopyWith<T, $Res> {
  factory _$$CreateEventFailureImplCopyWith(_$CreateEventFailureImpl<T> value,
          $Res Function(_$CreateEventFailureImpl<T>) then) =
      __$$CreateEventFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CreateEventFailureImplCopyWithImpl<T, $Res>
    extends _$EventStateCopyWithImpl<T, $Res, _$CreateEventFailureImpl<T>>
    implements _$$CreateEventFailureImplCopyWith<T, $Res> {
  __$$CreateEventFailureImplCopyWithImpl(_$CreateEventFailureImpl<T> _value,
      $Res Function(_$CreateEventFailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CreateEventFailureImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateEventFailureImpl<T> implements CreateEventFailure<T> {
  const _$CreateEventFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EventState<$T>.createEventFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventFailureImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventFailureImplCopyWith<T, _$CreateEventFailureImpl<T>>
      get copyWith => __$$CreateEventFailureImplCopyWithImpl<T,
          _$CreateEventFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createEventLoading,
    required TResult Function(T event) createEventSuccess,
    required TResult Function(String message) createEventFailure,
    required TResult Function() addEventCoverImage,
  }) {
    return createEventFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createEventLoading,
    TResult? Function(T event)? createEventSuccess,
    TResult? Function(String message)? createEventFailure,
    TResult? Function()? addEventCoverImage,
  }) {
    return createEventFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createEventLoading,
    TResult Function(T event)? createEventSuccess,
    TResult Function(String message)? createEventFailure,
    TResult Function()? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (createEventFailure != null) {
      return createEventFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CreateEventLoading<T> value) createEventLoading,
    required TResult Function(CreateEventSuccess<T> value) createEventSuccess,
    required TResult Function(CreateEventFailure<T> value) createEventFailure,
    required TResult Function(AddEventCoverImage<T> value) addEventCoverImage,
  }) {
    return createEventFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CreateEventLoading<T> value)? createEventLoading,
    TResult? Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult? Function(CreateEventFailure<T> value)? createEventFailure,
    TResult? Function(AddEventCoverImage<T> value)? addEventCoverImage,
  }) {
    return createEventFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CreateEventLoading<T> value)? createEventLoading,
    TResult Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult Function(CreateEventFailure<T> value)? createEventFailure,
    TResult Function(AddEventCoverImage<T> value)? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (createEventFailure != null) {
      return createEventFailure(this);
    }
    return orElse();
  }
}

abstract class CreateEventFailure<T> implements EventState<T> {
  const factory CreateEventFailure(final String message) =
      _$CreateEventFailureImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$CreateEventFailureImplCopyWith<T, _$CreateEventFailureImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddEventCoverImageImplCopyWith<T, $Res> {
  factory _$$AddEventCoverImageImplCopyWith(_$AddEventCoverImageImpl<T> value,
          $Res Function(_$AddEventCoverImageImpl<T>) then) =
      __$$AddEventCoverImageImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AddEventCoverImageImplCopyWithImpl<T, $Res>
    extends _$EventStateCopyWithImpl<T, $Res, _$AddEventCoverImageImpl<T>>
    implements _$$AddEventCoverImageImplCopyWith<T, $Res> {
  __$$AddEventCoverImageImplCopyWithImpl(_$AddEventCoverImageImpl<T> _value,
      $Res Function(_$AddEventCoverImageImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddEventCoverImageImpl<T> implements AddEventCoverImage<T> {
  const _$AddEventCoverImageImpl();

  @override
  String toString() {
    return 'EventState<$T>.addEventCoverImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddEventCoverImageImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() createEventLoading,
    required TResult Function(T event) createEventSuccess,
    required TResult Function(String message) createEventFailure,
    required TResult Function() addEventCoverImage,
  }) {
    return addEventCoverImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? createEventLoading,
    TResult? Function(T event)? createEventSuccess,
    TResult? Function(String message)? createEventFailure,
    TResult? Function()? addEventCoverImage,
  }) {
    return addEventCoverImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? createEventLoading,
    TResult Function(T event)? createEventSuccess,
    TResult Function(String message)? createEventFailure,
    TResult Function()? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (addEventCoverImage != null) {
      return addEventCoverImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CreateEventLoading<T> value) createEventLoading,
    required TResult Function(CreateEventSuccess<T> value) createEventSuccess,
    required TResult Function(CreateEventFailure<T> value) createEventFailure,
    required TResult Function(AddEventCoverImage<T> value) addEventCoverImage,
  }) {
    return addEventCoverImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CreateEventLoading<T> value)? createEventLoading,
    TResult? Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult? Function(CreateEventFailure<T> value)? createEventFailure,
    TResult? Function(AddEventCoverImage<T> value)? addEventCoverImage,
  }) {
    return addEventCoverImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CreateEventLoading<T> value)? createEventLoading,
    TResult Function(CreateEventSuccess<T> value)? createEventSuccess,
    TResult Function(CreateEventFailure<T> value)? createEventFailure,
    TResult Function(AddEventCoverImage<T> value)? addEventCoverImage,
    required TResult orElse(),
  }) {
    if (addEventCoverImage != null) {
      return addEventCoverImage(this);
    }
    return orElse();
  }
}

abstract class AddEventCoverImage<T> implements EventState<T> {
  const factory AddEventCoverImage() = _$AddEventCoverImageImpl<T>;
}
