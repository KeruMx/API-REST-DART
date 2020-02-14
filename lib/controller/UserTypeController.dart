import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/UserType.dart';

class UserTypeController extends ResourceController{
  UserTypeController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getUserTypes() async{
    final query = Query<UserType>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idUserType')
  Future<Response> getUserTypeById(@Bind.path('idUserType') int idAct) async{
    final query = Query<UserType>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertUserType() async{
    final advertisement = UserType()..read(await request.body.decode());
    final query = Query<UserType>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idUserType')
  Future<Response> updateUserType(@Bind.path('idUserType') int idAct) async{
    final advertisement = UserType()..read(await request.body.decode());
    final query = Query<UserType>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idUserType')
  Future<Response> deleteUserType(@Bind.path('idUserType') int idAct) async{
    final query = Query<UserType>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
