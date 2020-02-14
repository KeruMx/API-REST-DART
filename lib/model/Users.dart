import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/CommentActivity.dart';
import 'package:api_moviles/model/UserType.dart';
import 'package:api_moviles/model/Course.dart';
import 'package:api_moviles/model/Schedule.dart';
import 'package:api_moviles/model/Delivery.dart';
import 'package:api_moviles/model/CommentAdvertisement.dart';

class User extends ManagedObject<tblUser> implements tblUser{}
class tblUser{

  @Column(primaryKey: true)
  int id;

  String name;
  String lastName;
  DateTime birDate;
  String password;
  @Column(unique: true)
  String email;

  @Relate(#fktypeuser)
  UserType idType;

  ManagedSet<Course> fkteacher;
  ManagedSet<Schedule> fkstudent;
  ManagedSet<Delivery> fkstudent2;
  ManagedSet<CommentActivity> fkuser2;
  ManagedSet<CommentAdvertisement> fkuser;
}
