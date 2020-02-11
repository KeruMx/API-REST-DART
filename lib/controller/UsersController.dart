import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';
class UsersController extends ResourceController{
  UsersController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getUsers() async{
    final usersQuery = Query<Users>(context);
    final resUsers = await usersQuery.fetch();
    return Response.ok(resUsers);
  }
  @Operation.get('idUsers')
  Future<Response> getActivityById(@Bind.path('idUsers') int idUs) async{
    final usersQuery = Query<Users>(context)..where((a)=>a.idUsers).equalTo(idUs);
    final resUsers = await usersQuery.fetch();
    if(resUsers == null)
      return  Response.notFound();

    return Response.ok(resUsers);

  }
  @Operation.post()
  Future<Response> insUsers() async{
    final objUsers = Users()..read(await request.body.decode());
    final query = Query<Users>(context)..values = objUsers;
    final insUsers = await query.insert();
    return Response.ok(insUsers);
  }
  @Operation.put()
  Future<Response> upUsers(@Bind.path('idUsers')int idUs) async{
    final objUsers = Users()..read(await request.body.decode());
    final queryUsers = Query<Users>(context)..where((a)=> a.idUsers).equalTo(idUs)..values = objUsers;
    final upUsers  = await queryUsers.updateOne();
    return Response.ok(upUsers);
  }
  @Operation.delete()
  Future<Response> delUsers(@Bind.path('idUsers')int idUs) async{
    final queryUsers = Query<Users>(context)..where((a)=> a.idUsers).equalTo(idUs);
    final delUsers = await queryUsers.delete();
    return Response.ok(delUsers);
  }


}