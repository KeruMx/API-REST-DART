import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/CommentAdvertisement.dart';

class CommentAdvertisementController extends ResourceController{
  CommentAdvertisementController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getCommentActivity() async{
    final query = Query<CommentAdvertisement>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idCommentAdvertisement')
  Future<Response> getCommentAdvertisementById(@Bind.path('idCommentAdvertisement') int idAct) async{
    final query = Query<CommentAdvertisement>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertCommentAdvertisement() async{
    final advertisement = CommentAdvertisement()..read(await request.body.decode());
    final query = Query<CommentAdvertisement>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idCommentAdvertisement')
  Future<Response> updateCommentAdvertisement(@Bind.path('idCommentAdvertisement') int idAct) async{
    final advertisement = CommentAdvertisement()..read(await request.body.decode());
    final query = Query<CommentAdvertisement>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idCommentAdvertisement')
  Future<Response> deleteCommentAdvertisement(@Bind.path('idCommentAdvertisement') int idAct) async{
    final query = Query<CommentAdvertisement>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
