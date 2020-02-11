import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/UserType.dart';
class UsersTypeController extends ResourceController{
  UsersTypeController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getUsersType() async{
    final usersTypeQuery = Query<UserType>(context);
    final resUsersType = await usersTypeQuery.fetch();
    return Response.ok(resUsersType);
  }
  @Operation.get('idUsersType')
  Future<Response> getActivityById(@Bind.path('idUsersType') int idUTy) async{
    final usersTypeQuery = Query<UserType>(context)..where((a)=>a.idUsersType).equalTo(idUTy);
    final resUsersType = await usersTypeQuery.fetch();
    if(resUsersType == null)
      return  Response.notFound();

    return Response.ok(resUsersType);

  }
  @Operation.post()
  Future<Response> insUsersType() async{
    final objUsersType = UserType()..read(await request.body.decode());
    final query = Query<UserType>(context)..values = objUsersType;
    final insUsersType = await query.insert();
    return Response.ok(insUsersType);
  }
  @Operation.put()
  Future<Response> upUsersType(@Bind.path('idUsersType')int idUTy) async{
    final objUsersType = UserType()..read(await request.body.decode());
    final queryUsersType = Query<UserType>(context)..where((a)=> a.idUsersType).equalTo(idUTy)..values = objUsersType;
    final upUsersType  = await queryUsersType.updateOne();
    return Response.ok(upUsersType);
  }
  @Operation.delete()
  Future<Response> delUsersType(@Bind.path('idUsersType')int idUTy) async{
    final queryUsersType = Query<UserType>(context)..where((a)=> a.idUsersType).equalTo(idUTy);
    final delUsersType = await queryUsersType.delete();
    return Response.ok(delUsersType);
  }


}