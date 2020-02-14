import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/CommentActivity.dart';

class CommentActivityController extends ResourceController{
  CommentActivityController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getCommentActivity() async{
    final query = Query<CommentActivity>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idCommentActivity')
  Future<Response> getCommentActivityById(@Bind.path('idCommentActivity') int idAct) async{
    final query = Query<CommentActivity>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertCommentActivity() async{
    final advertisement = CommentActivity()..read(await request.body.decode());
    final query = Query<CommentActivity>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idCommentActivity')
  Future<Response> updateCommentActivity(@Bind.path('idCommentActivity') int idAct) async{
    final advertisement = CommentActivity()..read(await request.body.decode());
    final query = Query<CommentActivity>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idCommentActivity')
  Future<Response> deleteCommentActivity(@Bind.path('idCommentActivity') int idAct) async{
    final query = Query<CommentActivity>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
