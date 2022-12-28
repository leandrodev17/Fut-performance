// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerformanceController on PerformanceControllerBase, Store {
  late final _$getAllGavedGamesStadeAtom = Atom(
      name: 'PerformanceControllerBase.getAllGavedGamesStade',
      context: context);

  @override
  ProcessState get getAllGavedGamesStade {
    _$getAllGavedGamesStadeAtom.reportRead();
    return super.getAllGavedGamesStade;
  }

  @override
  set getAllGavedGamesStade(ProcessState value) {
    _$getAllGavedGamesStadeAtom.reportWrite(value, super.getAllGavedGamesStade,
        () {
      super.getAllGavedGamesStade = value;
    });
  }

  late final _$totalGolsAtom =
      Atom(name: 'PerformanceControllerBase.totalGols', context: context);

  @override
  int get totalGols {
    _$totalGolsAtom.reportRead();
    return super.totalGols;
  }

  @override
  set totalGols(int value) {
    _$totalGolsAtom.reportWrite(value, super.totalGols, () {
      super.totalGols = value;
    });
  }

  late final _$totalAssistsAtom =
      Atom(name: 'PerformanceControllerBase.totalAssists', context: context);

  @override
  int get totalAssists {
    _$totalAssistsAtom.reportRead();
    return super.totalAssists;
  }

  @override
  set totalAssists(int value) {
    _$totalAssistsAtom.reportWrite(value, super.totalAssists, () {
      super.totalAssists = value;
    });
  }

  late final _$inicioPartidaAtom =
      Atom(name: 'PerformanceControllerBase.inicioPartida', context: context);

  @override
  String get inicioPartida {
    _$inicioPartidaAtom.reportRead();
    return super.inicioPartida;
  }

  @override
  set inicioPartida(String value) {
    _$inicioPartidaAtom.reportWrite(value, super.inicioPartida, () {
      super.inicioPartida = value;
    });
  }

  late final _$fimPartidaAtom =
      Atom(name: 'PerformanceControllerBase.fimPartida', context: context);

  @override
  String get fimPartida {
    _$fimPartidaAtom.reportRead();
    return super.fimPartida;
  }

  @override
  set fimPartida(String value) {
    _$fimPartidaAtom.reportWrite(value, super.fimPartida, () {
      super.fimPartida = value;
    });
  }

  @override
  String toString() {
    return '''
getAllGavedGamesStade: ${getAllGavedGamesStade},
totalGols: ${totalGols},
totalAssists: ${totalAssists},
inicioPartida: ${inicioPartida},
fimPartida: ${fimPartida}
    ''';
  }
}
