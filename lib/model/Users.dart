import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/UserType.dart';
import 'package:api_moviles/model/Course.dart';
import 'package:api_moviles/model/Schedule.dart';
import 'package:api_moviles/model/Delivery.dart';
import 'package:api_moviles/model/CommentAdvertisement.dart';

class Users extends ManagedObject<tblUser> implements tblUser{}
class tblUser{

  @Column(primaryKey: true)
  int idUsers;

  String name;
  String lastName;
  DateTime birDate;
  String password;
  @Column(unique: true)
  String email;

  @Relate(#fktypeuser)
  UserType idType;

  ManagedObject<Course> fkteacher;
  ManagedObject<Schedule> fkstudent;
  ManagedObject<Delivery> fkstudent2;
  ManagedObject<CommentAdvertisement> fkuser;
}
