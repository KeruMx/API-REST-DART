import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Activities.dart';

class Delivery extends ManagedObject<tblDelivery> implements tblDelivery{}
class tblDelivery{

  @Column(primaryKey: true)
  int idDelivery;

  String file;
  DateTime datDelivery;


  @Relate(#fkstudent2)
  Users idStudent;
  @Relate(#fkactivities)
  Activities idActivity;
}
