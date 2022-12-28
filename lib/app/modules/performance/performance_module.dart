import 'package:flutter_modular/flutter_modular.dart';

import 'domain/entities/match_entity.dart';
import 'domain/repositories/performace_repository.dart';
import 'domain/usecases/performance_usecases.dart';
import 'domain/usecases/performance_usecases_imp.dart';
import 'external/objectbox_database.dart';
import 'presenter/pages/perfomance_page.dart';
import 'presenter/controllers/performance_controller.dart';
import 'infra/repositories/performance_repository.dart';
import 'presenter/pages/save_match_page.dart';

class PerformanceModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<PerformanceRepository>((i) => PerfomanceRepositoryImp(database: ObjectBoxDatabase<MatchEntity>())),
    Bind.singleton<PerformanceUsecases>((i) => PerformanceUsecaseImp(i())),
    Bind.singleton<PerformanceController>((i) => PerformanceController(performanceUsecases: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PerformancePage(performanceController: Modular.get<PerformanceController>())),
    ChildRoute('/save_match', child: (_, args) => SaveMatchPage(performanceController: Modular.get<PerformanceController>())),
  ];
}
