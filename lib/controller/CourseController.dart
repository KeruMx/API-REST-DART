import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Course.dart';
class CourseController extends ResourceController{
  CourseController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getCourse() async{
    final courseQuery = Query<Course>(context);
    final resCourse = await courseQuery.fetch();
    return Response.ok(resCourse);
  }
  @Operation.get('idCourse')
  Future<Response> getActivityById(@Bind.path('idCourse') int idCou) async{
    final courseQuery = Query<Course>(context)..where((a)=>a.idCourse).equalTo(idCou);
    final resCourse = await courseQuery.fetch();
    if(resCourse == null)
      return  Response.notFound();

    return Response.ok(resCourse);

  }
  @Operation.post()
  Future<Response> insCourse() async{
    final objCourse = Course()..read(await request.body.decode());
    final query = Query<Course>(context)..values = objCourse;
    final insCourse = await query.insert();
    return Response.ok(insCourse);
  }
  @Operation.put()
  Future<Response> upCourse(@Bind.path('idCourse')int idCou) async{
    final objCourse = Course()..read(await request.body.decode());
    final queryCourse = Query<Course>(context)..where((a)=> a.idCourse).equalTo(idCou)..values = objCourse;
    final upCourse  = await queryCourse.updateOne();
    return Response.ok(upCourse);
  }
  @Operation.delete()
  Future<Response> delCourse(@Bind.path('idCourse')int idCou) async{
    final queryCourse = Query<Course>(context)..where((a)=> a.idCourse).equalTo(idCou);
    final delCourse = await queryCourse.delete();
    return Response.ok(delCourse);
  }


}