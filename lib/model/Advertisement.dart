import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Course.dart';
import 'package:api_moviles/model/CommentAdvertisement.dart';

class Advertisement extends ManagedObject<tblAdvertisement> implements tblAdvertisement{}
class tblAdvertisement{

  @Column(primaryKey: true)
  int id;

  String notice;
  DateTime datAdvertisement;


  @Relate(#fkcourse3)
  Course idCourse;


  ManagedObject<CommentAdvertisement> fkAdvertisement;
}
