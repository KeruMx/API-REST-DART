import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Course.dart';
import 'package:api_moviles/model/Delivery.dart';

class Activities extends ManagedObject<tblActivities> implements tblActivities{}
class tblActivities{

  @Column(primaryKey: true)
  int id;

  String activity;
  String description;
  DateTime datActivity;


  @Relate(#fkcourse2)
  Course idCourse;

  ManagedObject<Delivery> fkactivities;
}
