import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Schedule.dart';
import 'package:api_moviles/model/Activities.dart';
import 'package:api_moviles/model/Advertisement.dart';

class Course extends ManagedObject<tblCourse> implements tblCourse{}
class tblCourse{

  @Column(primaryKey: true)
  int idCourse;

  String name;
  String description;

  @Relate(#fkteacher)
  Users idTeacher;

  ManagedObject<Schedule> fkcourse;
  ManagedObject<Activities> fkcourse2;
  ManagedObject<Advertisement> fkcourse3;
}
