import 'package:api_moviles/api_moviles.dart';

class ScheduleController extends ResourceController{
  ScheduleController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getSchedule() async{
    final ScheduleQuery = Query<Schedule>(context);
    final resSchedule = await ScheduleQuery.fetch();
    return Response.ok(resSchedule);
  }
  @Operation.get('idSchedule')
  Future<Response> getActivityById(@Bind.path('idSchedule') int idSche) async{
    final ScheduleQuery = Query<Schedule>(context)..where((a)=>a.idSchedule).equalTo(idSche);
    final resSchedule = await ScheduleQuery.fetch();
    if(resSchedule == null)
      return  Response.notFound();

    return Response.ok(resSchedule);

  }
  @Operation.post()
  Future<Response> insSchedule() async{
    final objSchedule = Schedule()..read(await request.body.decode());
    final query = Query<Schedule>(context)..values = objSchedule;
    final insSchedule = await query.insert();
    return Response.ok(insSchedule);
  }
  @Operation.put()
  Future<Response> upSchedule(@Bind.path('idSchedule')int idSche) async{
    final objSchedule = Schedule()..read(await request.body.decode());
    final querySchedule = Query<Schedule>(context)..where((a)=> a.idSchedule).equalTo(idSche)..values = objSchedule;
    final upSchedule  = await querySchedule.updateOne();
    return Response.ok(upSchedule);
  }
  @Operation.delete()
  Future<Response> delSchedule(@Bind.path('idSchedule')int idSche) async{
    final querySchedule = Query<Schedule>(context)..where((a)=> a.idSchedule).equalTo(idSche);
    final delSchedule = await querySchedule.delete();
    return Response.ok(delSchedule);
  }


}