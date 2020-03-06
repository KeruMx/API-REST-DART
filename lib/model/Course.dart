import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Schedule.dart';
import 'package:api_moviles/model/Activities.dart';
import 'package:api_moviles/model/Advertisement.dart';

class Course extends ManagedObject<tblCourse> implements tblCourse{}
class tblCourse{

  @primaryKey
  int id;

  String name;
  String description;

  @Relate(#fkteacher)
  User idTeacher;

  ManagedSet<Schedule> fkcourse;
  ManagedSet<Activities> fkcourse2;
  ManagedSet<Advertisement> fkcourse3;
}
