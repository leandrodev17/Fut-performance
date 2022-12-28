
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import '../../../../core/failure_error.dart';
import '../entities/match_entity.dart';

abstract class PerformanceRepository {

   Future<Either<Failure, List<MatchEntity>>> getAllMatches();
   Future<Either<Failure, MatchEntity>> saveMatch(MatchEntity match);
}