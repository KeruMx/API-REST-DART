import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Course.dart';

class CourseController extends ResourceController{
  CourseController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getCourses() async{
    final query = Query<Course>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idCourse')
  Future<Response> getCourseById(@Bind.path('idCourse') int idAct) async{
    final query = Query<Course>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertCourse() async{
    final advertisement = Course()..read(await request.body.decode());
    final query = Query<Course>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idCourse')
  Future<Response> updateCourse(@Bind.path('idCourse') int idAct) async{
    final advertisement = Course()..read(await request.body.decode());
    final query = Query<Course>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idCourse')
  Future<Response> deleteCourse(@Bind.path('idCourse') int idAct) async{
    final query = Query<Course>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
