import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Course.dart';

class Schedule extends ManagedObject<tblSchedule> implements tblSchedule{}
class tblSchedule{

  @Column(primaryKey: true)
  int idSchedule;

  @Relate(#fkstudent)
  Users idStudent;
  @Relate(#fkcourse)
  Course idCourse;
}
