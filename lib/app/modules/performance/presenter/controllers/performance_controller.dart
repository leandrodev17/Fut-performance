import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/utils/process_state.dart';
import '../../domain/entities/match_entity.dart';
import '../../domain/usecases/performance_usecases.dart';

part 'performance_controller.g.dart';

class PerformanceController = PerformanceControllerBase with _$PerformanceController;

abstract class PerformanceControllerBase with Store {
  PerformanceUsecases performanceUsecases;

  PerformanceControllerBase({
    required this.performanceUsecases,
  });

  // ======= PEGAR PARTIDAS ==========

  @observable
  ProcessState getAllGavedGamesStade = InitialState();

  @observable
  int totalGols = 0;

  @observable
  int totalAssists = 0;
  

  List<MatchEntity> matches = [];

  Future<void> getAllGavedGames() async {
    getAllGavedGamesStade = LoadingState();
    totalAssists = 0;
    totalGols = 0;

    var result = await performanceUsecases.getAllMatches();
    result.fold((failure) {
      getAllGavedGamesStade = ErrorState(error: failure, message: failure.message);
    }, (listMatches) {
      matches = listMatches;
      for (var element in listMatches) {
        totalAssists = totalAssists + element.assists;
        totalGols = totalGols + element.goals;
      }

      getAllGavedGamesStade = SuccessState();
    });
  }

  // ======= SALVAR PARTIDA ==========

  @observable
  String inicioPartida = '';

  @observable
  String fimPartida = '';

  Future<void> saveMatch(context, MatchEntity matches) async {
    var result = await performanceUsecases.saveMatch(matches);
    result.fold((failure) {
      const snackBar = SnackBar(
        content: Text('Erro ao salvar, tente novamente!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }, (data) {
      const snackBar = SnackBar(
        content: Text('Partida Salva com sucesso!'),
      );
      getAllGavedGames();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
