import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Users.dart';

class UsersController extends ResourceController{
  UsersController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getUsers() async{
    final query = Query<User>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idUser')
  Future<Response> getUserById(@Bind.path('idUser') int idAct) async{
    final query = Query<User>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertUser() async{
    final advertisement = User()..read(await request.body.decode());
    final query = Query<User>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idUser')
  Future<Response> updateUser(@Bind.path('idUser') int idAct) async{
    final advertisement = User()..read(await request.body.decode());
    final query = Query<User>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idUser')
  Future<Response> deleteUser(@Bind.path('idUser') int idAct) async{
    final query = Query<User>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
