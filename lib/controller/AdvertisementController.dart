import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Advertisement.dart';

class AdvertisementController extends ResourceController{
  AdvertisementController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAdvertisements() async{
    final query = Query<Advertisement>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idAdvertisement')
  Future<Response> getAdvertisementById(@Bind.path('idAdvertisement') int idAct) async{
    final query = Query<Advertisement>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertAdvertisement() async{
    final advertisement = Advertisement()..read(await request.body.decode());
    final query = Query<Advertisement>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idAdvertisement')
  Future<Response> updateAdvertisement(@Bind.path('idAdvertisement') int idAct) async{
    final advertisement = Advertisement()..read(await request.body.decode());
    final query = Query<Advertisement>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idAdvertisement')
  Future<Response> deleteAdvertisement(@Bind.path('idAdvertisement') int idAct) async{
    final query = Query<Advertisement>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
