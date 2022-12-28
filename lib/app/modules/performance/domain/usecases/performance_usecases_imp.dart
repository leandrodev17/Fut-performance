
import 'package:futperformance/app/core/failure_error.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../entities/match_entity.dart';
import '../repositories/performace_repository.dart';
import 'performance_usecases.dart';

class PerformanceUsecaseImp implements  PerformanceUsecases {
  final PerformanceRepository repository;

  PerformanceUsecaseImp(this.repository);

  @override
  Future<Either<Failure, List<MatchEntity>>> getAllMatches() async {
    return await repository.getAllMatches();
  }

  @override
  Future<Either<Failure, MatchEntity>> saveMatch(MatchEntity match) async {
    return await repository.saveMatch(match);
  }
  
}