import 'package:api_moviles/api_moviles.dart';

class CommentActivityController extends ResourceController{
  CommentActivityController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getCommentActivity() async{
    final commentActivityQuery = Query<CommentActivity>(context);
    final resCommentActivity = await commentActivityQuery.fetch();
    return Response.ok(resCommentActivity);
  }
  @Operation.get('idCommentActivity')
  Future<Response> getActivityById(@Bind.path('idCommentActivity') int idCommA) async{
    final commentActivityQuery = Query<CommentActivity>(context)..where((a)=>a.idCommentActivity).equalTo(idCommA);
    final resCommentActivity = await commentActivityQuery.fetch();
    if(resCommentActivity == null)
      return  Response.notFound();

    return Response.ok(resCommentActivity);

  }
  @Operation.post()
  Future<Response> insCommentActivity() async{
    final objCommentActivity = CommentActivity()..read(await request.body.decode());
    final query = Query<CommentActivity>(context)..values = objCommentActivity;
    final insCommentActivity = await query.insert();
    return Response.ok(insCommentActivity);
  }
  @Operation.put()
  Future<Response> upCommentActivity(@Bind.path('idCommentActivity')int idCommA) async{
    final objCommentActivity = CommentActivity()..read(await request.body.decode());
    final queryCommentActivity = Query<CommentActivity>(context)..where((a)=> a.idCommentActivity).equalTo(idCommA)..values = objCommentActivity;
    final upCommentActivity  = await queryCommentActivity.updateOne();
    return Response.ok(upCommentActivity);
  }
  @Operation.delete()
  Future<Response> delCommentActivity(@Bind.path('idCommentActivity')int idCommA) async{
    final queryCommentActivity = Query<CommentActivity>(context)..where((a)=> a.idCommentActivity).equalTo(idCommA);
    final delCommentActivity = await queryCommentActivity.delete();
    return Response.ok(delCommentActivity);
  }


}