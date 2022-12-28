abstract class Failure implements Exception {
  String get message;
}

class FailureError implements Failure {
  @override
  final String message;
  FailureError({this.message = 'Um erro ocorreu!'}) : super();
}

class DataSourceError implements Failure {
   @override
  final String message;
  DataSourceError({this.message = 'Um erro ocorreu!'}) : super();
}

class RepositoryError implements Failure {
   @override
  final String message;
  RepositoryError({this.message = 'Um erro ocorreu!'}) : super();
}

class UseCaseError implements Failure {
   @override
  final String message;
  UseCaseError({this.message = 'Um erro ocorreu!'}) : super();
}

class NoPermissionError implements Failure {
   @override
  final String message;
  NoPermissionError({
    this.message = 'Você não tem permissão para acessar essa informação!',
  }) : super();
}

class NoChangesWereMadeError implements Failure {
   @override
  final String message;
  NoChangesWereMadeError({
    this.message = 'Nenhuma alteração foi feita!',
  }) : super();
}

class EmptyError implements Failure {
   @override
  final String message;
  EmptyError({
    this.message = 'Esta informação está vazia!',
  }) : super();
}

class AlreadyExistError implements Failure {
   @override
  final String message;
  AlreadyExistError({
    this.message = 'Esta informação está vazia!',
  }) : super();
}

class NotFoundError implements Failure {
   @override
  final String message;
  NotFoundError({
    this.message = 'Esta informação está vazia!',
  }) : super();
}