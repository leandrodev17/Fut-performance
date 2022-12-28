import 'package:flutter/material.dart';

import '../../../../core/components/input_componet.dart';
import '../../domain/entities/match_entity.dart';
import '../controllers/performance_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class FormSaveMatch extends StatefulWidget {
  PerformanceController performanceController;
  FormSaveMatch({Key? key, required this.performanceController}) : super(key: key);

  @override
  State<FormSaveMatch> createState() => _FormSaveMatchState();
}

class _FormSaveMatchState extends State<FormSaveMatch> {
  final _formKey = GlobalKey<FormState>();
  MatchEntity match = MatchEntity();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Preencha o formulario para salvar partida',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Incio ${widget.performanceController.inicioPartida} - Fim ${widget.performanceController.fimPartida}',
            style: const TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
              cursorColor: Colors.orange,
              decoration: InputStyle().inputDecoration('Gols'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor preencha o campo';
                }

                match.goals = int.parse(value);

                return null;
              }),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
              cursorColor: Colors.orange,
              decoration: InputStyle().inputDecoration('Assistêcias'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor preencha o campo';
                }

                match.assists = int.parse(value);

                return null;
              }),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
              cursorColor: Colors.orange,
              decoration: InputStyle().inputDecoration('Comentarios'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor preencha o campo';
                }

                match.comment = value;

                return null;
              }),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 70,
            width: 300,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
                child: const Text(
                  'Salvar Partida',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    DateTime now = DateTime.now();
                    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
                    match.date = formattedDate;
                    match.startTime = widget.performanceController.inicioPartida;
                    match.endTime = widget.performanceController.fimPartida;


                    widget.performanceController.saveMatch(context, match);
                  }

                }),
          ),
        ],
      ),
    );
  }
}
