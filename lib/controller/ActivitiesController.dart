import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Activities.dart';

class ActivitiesController extends ResourceController{
  ActivitiesController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getActivities() async{
    final query = Query<Activities>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idActivity')
  Future<Response> getActivityById(@Bind.path('idActivity') int idAct) async{
    final query = Query<Activities>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertActivity() async{
    final activity = Activities()..read(await request.body.decode());
    final query = Query<Activities>(context)..values=activity;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idActivity')
  Future<Response> updateActivity(@Bind.path('idActivity') int idAct) async{
    final activity = Activities()..read(await request.body.decode());
    final query = Query<Activities>(context)..where((a)=>a.id).equalTo(idAct)..values=activity;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idActivity')
  Future<Response> deleteActivity(@Bind.path('idActivity') int idAct) async{
    final query = Query<Activities>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
