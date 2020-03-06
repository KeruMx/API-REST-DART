import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Activities.dart';

class Delivery extends ManagedObject<tblDelivery> implements tblDelivery{}
class tblDelivery{

  @primaryKey
  int id;

  String file;
  DateTime datDelivery;


  @Relate(#fkstudent2)
  User idStudent;
  @Relate(#fkactivities)
  Activities idActivity;
}
