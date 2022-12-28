import 'package:flutter/material.dart';
import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../components/form_save_match.dart';
import '../controllers/performance_controller.dart';

// ignore: must_be_immutable
class SaveMatchPage extends StatefulWidget {
  PerformanceController performanceController;
  SaveMatchPage({Key? key, required this.performanceController}) : super(key: key);

  @override
  State<SaveMatchPage> createState() => _SaveMatchPageState();
}

class _SaveMatchPageState extends State<SaveMatchPage> {
  bool stopTimer = false;
  String horas = "";
  startTimeout() {

    Timer.periodic(const Duration(seconds: 1), (timer) {
          final DateTime now = DateTime.now();
      setState(() {
        if (stopTimer == false) {
          horas = DateFormat('Hms').format(now);
        } else {
          timer.cancel();
          horas = '';
          widget.performanceController.fimPartida = DateFormat('Hms').format(now);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
                visible: !stopTimer,
                child: Column(
                  children: [
                    Text(
                      horas == '' ? 'Inicie a partida para registrar o horario' : horas,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 70,
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        ),
                        child: Text(
                          horas == '' ? 'Iniciar Partida' : 'Finalizar Partida',
                          style: const TextStyle(fontSize: 25),
                        ),
                        onPressed: () {
                          if (horas == '') {
                            final time = DateTime.now();
                            widget.performanceController.inicioPartida = DateFormat('Hms').format(time);
                            startTimeout();
                          } else {
                            setState(() {
                              stopTimer = true;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            Visibility(visible: stopTimer, child: Container(margin: const EdgeInsets.only(left: 10, right: 10), child: FormSaveMatch(performanceController: widget.performanceController,))),
            Visibility(visible: stopTimer, child: TextButton(onPressed: (){setState(() {
               stopTimer = !stopTimer;
            });}, child: const Text('Cancelar', style: TextStyle(fontSize: 18, color:Colors.white),))),

          ],
        ),
      ),
    ));
  }
}
