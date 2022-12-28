
import 'package:futperformance/app/core/failure_error.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import '../../domain/entities/match_entity.dart';
import '../../domain/repositories/performace_repository.dart';
import '../../external/database_abs.dart';

class PerfomanceRepositoryImp extends PerformanceRepository {
  Database database;

  PerfomanceRepositoryImp({required this.database});

  @override
  Future<Either<Failure, List<MatchEntity>>> getAllMatches() async {
    try {
      var matches = await database.getAll() as List<MatchEntity>;
      return Right(matches);
    } catch (e) {
      return  Left(RepositoryError(message: "Erro ao carreger performance"));
    }
  }

  @override
  Future<Either<Failure, MatchEntity>> saveMatch(MatchEntity match) async {
     try {
      await database.put(match);
      return Right(match);
    } catch (e) {
      return  Left(RepositoryError(message: "Erro ao carreger performance"));
    }
  }
}
