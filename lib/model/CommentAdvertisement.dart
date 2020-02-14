import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Advertisement.dart';

class CommentAdvertisement extends ManagedObject<tblCommentAdvertisement> implements tblCommentAdvertisement{}
class tblCommentAdvertisement{

  @Column(primaryKey: true)
  int id;

  String comment;
  DateTime datComAdvertisement;


  @Relate(#fkAdvertisement)
  Advertisement idAdvertisement;
  @Relate(#fkuser)
  User idUser;
}
