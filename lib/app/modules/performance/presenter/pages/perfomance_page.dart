import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/utils/process_state.dart';
import '../controllers/performance_controller.dart';

// ignore: must_be_immutable
class PerformancePage extends StatefulWidget {
  PerformanceController performanceController;
  PerformancePage({Key? key, required this.performanceController}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PerformancePageState createState() => _PerformancePageState();
}

// ignore: deprecated_member_use
class _PerformancePageState extends State<PerformancePage> {
  @override
  void initState() {
    super.initState();
    widget.performanceController.getAllGavedGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Counter'),
      // ),
      backgroundColor: const Color.fromARGB(115, 14, 14, 14),
      body: Observer(builder: (context) {
        if (widget.performanceController.getAllGavedGamesStade is InitialState) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.orange),
          );
        }

        if (widget.performanceController.getAllGavedGamesStade is ErrorState) {
          return Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error_outline, color: Colors.orange),
                  SizedBox(height: 12),
                  Text('Infelizmente ocorreu um erro ao carregar!', style: TextStyle(fontSize: 18)),
                  Text('Tente recarregar a pagina!', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: 500,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 26, 25, 25),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    margin: const EdgeInsets.only(
                      left: 0,
                    ),
                    child: const Text(
                      'Total de Partidas jogadas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Text(
                      '${widget.performanceController.matches.length} Partidas',
                      style: const TextStyle(fontSize: 50),
                    ))
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 190,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 26, 25, 25),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: const Text('Total de Gols feitos',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:  Text(
                         '${widget.performanceController.totalGols} Gols',
                          style: const TextStyle(fontSize: 20),
                        )),
                  ]),
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 180,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 26, 25, 25),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: const Text('Total de Assistêcias',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:  Text(
                          '${widget.performanceController.totalAssists} Assistêcias',
                          style: const TextStyle(fontSize: 20),
                        )),
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 10,
                ),
                child: const Text('Historico de partidas', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              child: ListView.builder(
                  itemCount: widget.performanceController.matches.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.sports_baseball_sharp),
                        trailing: Text(
                          widget.performanceController.matches[index].date,
                          style: const TextStyle(color: Colors.orange, fontSize: 15),
                        ),
                        subtitle:Text('Incio: ${widget.performanceController.matches[index].startTime} - Final: ${widget.performanceController.matches[index].endTime}'),
                        title: Text('${widget.performanceController.matches[index].goals} Gols - ${widget.performanceController.matches[index].assists} Assistências'));
                  }),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Modular.to.pushNamed('/save_match');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
