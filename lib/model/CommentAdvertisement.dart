import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Advertisement.dart';

class CommentAdvertisement extends ManagedObject<tblCommentAdvertisement> implements tblCommentAdvertisement{}
class tblCommentAdvertisement{

  @Column(primaryKey: true)
  int idCommentAdvertisement;

  String Comment;
  DateTime datComAdvertisement;


  @Relate(#fkAdvertisement)
  Advertisement idAdvertisement;
  @Relate(#fkuser)
  Users idUser;
}
