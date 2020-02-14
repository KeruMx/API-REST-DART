import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Schedule.dart';

class ScheduleController extends ResourceController{
  ScheduleController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getSchedule() async{
    final query = Query<Schedule>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idSchedule')
  Future<Response> getScheduleById(@Bind.path('idSchedule') int idAct) async{
    final query = Query<Schedule>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertSchedule() async{
    final advertisement = Schedule()..read(await request.body.decode());
    final query = Query<Schedule>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idSchedule')
  Future<Response> updateSchedule(@Bind.path('idSchedule') int idAct) async{
    final advertisement = Schedule()..read(await request.body.decode());
    final query = Query<Schedule>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idSchedule')
  Future<Response> deleteSchedule(@Bind.path('idSchedule') int idAct) async{
    final query = Query<Schedule>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
