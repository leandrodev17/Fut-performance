
import 'package:objectbox/objectbox.dart';
import '../../external/objectbox.g.dart';

// ignore_for_file: public_member_api_docs

@Entity()
class MatchEntity {
  int id;
  int goals;
  int assists;
  String? comment;
  String date;
  String startTime;
  String endTime;


  MatchEntity({ this.id = 0, this.goals= 0, this.assists= 0, this.comment, this.date = '', this.startTime = '',this.endTime = '' });

}