import 'package:equatable/equatable.dart';

abstract class CubitState extends Equatable {
  const CubitState._();

  factory CubitState.empty() => EmptyCubitState();
  factory CubitState.loading() => LoadingCubitState();
  factory CubitState.success({required value}) =>
      SuccessCubitState(value: value);
  factory CubitState.error({required String message, String? statusCode}) =>
      ErrorCubitState(message: message, statusCode: statusCode);
}

class EmptyCubitState extends CubitState {
  const EmptyCubitState() : super._();

  @override
  List<Object?> get props => [];
}

class LoadingCubitState extends CubitState {
  const LoadingCubitState() : super._();

  @override
  List<Object?> get props => [];
}

class SuccessCubitState<T> extends CubitState {
  final T value;

  const SuccessCubitState({required this.value}) : super._();

  @override
  List<Object?> get props => [value];
}

class ErrorCubitState extends CubitState {
  final String message;
  final String? statusCode;

  const ErrorCubitState({this.message = 'Error! \n Try again', this.statusCode})
    : super._();

  @override
  List<Object?> get props => [message, statusCode];
}
