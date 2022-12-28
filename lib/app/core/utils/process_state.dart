// ignore_for_file: annotate_overrides, overridden_fields
import '../failure_error.dart';

abstract class ProcessState {
  String message;
  Failure? error;
  ProcessState({this.message = '', this.error});
}

class InitialState extends ProcessState {
  Failure? error;
  String message;
  InitialState({this.message = '', this.error}) : super(message: message, error: error);
}

class LoadingState extends ProcessState {
  Failure? error;
  String message;
  LoadingState({this.message = '', this.error}) : super(message: message, error: error);
}

class ErrorState extends ProcessState {
  Failure? error;
  String message;
  ErrorState({this.message = '', this.error}) : super(message: message, error: error);
}

class WarningState extends ProcessState {
  Failure? error;
  String message;
  WarningState({this.message = '', this.error}) : super(message: message, error: error);
}

class SuccessState extends ProcessState {
  Failure? error;
  String message;
  SuccessState({this.message = '', this.error}) : super(message: message, error: error);
}