import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Activities.dart';
class ActivitiesController extends ResourceController{
  ActivitiesController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getActivities() async{
    final activitiesQuery = Query<Activities>(context);
    final resActivities = await activitiesQuery.fetch();
    return Response.ok(resActivities);
  }
  @Operation.get('id')
  Future<Response> getActivityById(@Bind.path('id') int idAct) async{
    final activitiesQuery = Query<Activities>(context)..where((a)=> a.id).equalTo(idAct);
    final resActivities = await activitiesQuery.fetch();
    if(resActivities == null)
      return  Response.notFound();

    return Response.ok(resActivities);

  }
  @Operation.post()
  Future<Response> insActividad() async{
    final objActividad = Activities()..read(await request.body.decode());
    final query = Query<Activities>(context)..values = objActividad;
    final insActividad = await query.insert();
    return Response.ok(insActividad);
  }
  @Operation.put()
  Future<Response> upActivity(@Bind.path('id')int idAct) async{
    final objActividad = Activities()..read(await request.body.decode());
    final queryActividad = Query<Activities>(context)..where((a)=> a.id).equalTo(idAct)..values = objActividad;
    final upActividad  = await queryActividad.updateOne();
    return Response.ok(upActividad);
  }
  @Operation.delete()
  Future<Response> delActivity(@Bind.path('id')int idAct) async{
    final queryActivity = Query<Activities>(context)..where((a)=> a.id).equalTo(idAct);
    final delActividad = await queryActivity.delete();
    return Response.ok(delActividad);
  }


}