import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
import 'package:api_moviles/model/Activities.dart';

class CommentActivity extends ManagedObject<tblCommentActivity> implements tblCommentActivity{}
class tblCommentActivity{

  @Column(primaryKey: true)
  int idCommentActivity;

  String Comment;
  DateTime datComActivity;


  @Relate(#fkAdvertisement)
  Activities idAdvertisement;
  @Relate(#fkuser2)
  Users idUser;
}
