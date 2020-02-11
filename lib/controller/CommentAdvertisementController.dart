import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/CommentAdvertisement.dart';

class CommentAdvertisementController extends ResourceController{
  CommentAdvertisementController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getCommentAdvertisement() async{
    final commentAdvertisementQuery = Query<CommentAdvertisement>(context);
    final resCommentAdvertisement = await commentAdvertisementQuery.fetch();
    return Response.ok(resCommentAdvertisement);
  }
  @Operation.get('idCommentAdvertisement')
  Future<Response> getAdvertisementById(@Bind.path('idCommentAdvertisement') int idCommAdv) async{
    final commentAdvertisementQuery = Query<CommentAdvertisement>(context)..where((a)=>a.idCommentAdvertisement).equalTo(idCommAdv);
    final resCommentAdvertisement = await commentAdvertisementQuery.fetch();
    if(resCommentAdvertisement == null)
      return  Response.notFound();

    return Response.ok(resCommentAdvertisement);

  }
  @Operation.post()
  Future<Response> insCommentAdvertisement() async{
    final objCommentAdvertisement = CommentAdvertisement()..read(await request.body.decode());
    final query = Query<CommentAdvertisement>(context)..values = objCommentAdvertisement;
    final insCommentAdvertisement = await query.insert();
    return Response.ok(insCommentAdvertisement);
  }
  @Operation.put()
  Future<Response> upCommentAdvertisement(@Bind.path('idCommentAdvertisement')int idCommAdv) async{
    final objCommentAdvertisement = CommentAdvertisement()..read(await request.body.decode());
    final queryCommentAdvertisement = Query<CommentAdvertisement>(context)..where((a)=> a.idCommentAdvertisement).equalTo(idCommAdv)..values = objCommentAdvertisement;
    final upCommentAdvertisement  = await queryCommentAdvertisement.updateOne();
    return Response.ok(upCommentAdvertisement);
  }
  @Operation.delete()
  Future<Response> delCommentAdvertisement(@Bind.path('idCommentAdvertisement')int idCommAdv) async{
    final queryAdvertisement = Query<CommentAdvertisement>(context)..where((a)=> a.idCommentAdvertisement).equalTo(idCommAdv);
    final delCommentAdvertisement = await queryAdvertisement.delete();
    return Response.ok(delCommentAdvertisement);
  }


}