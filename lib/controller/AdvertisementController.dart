import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Advertisement.dart';
class AdvertisementController extends ResourceController{
  AdvertisementController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getAdvertisement() async{
    final advertisementQuery = Query<Advertisement>(context);
    final resAdvertisement = await advertisementQuery.fetch();
    return Response.ok(resAdvertisement);
  }
  @Operation.get('idAdvertisement')
  Future<Response> getAdvertisementById(@Bind.path('idAdvertisement') int idAdv) async{
    final advertisementQuery = Query<Advertisement>(context)..where((a)=>a.idAdvertisement).equalTo(idAdv);
    final resAdvertisement = await advertisementQuery.fetch();
    if(resAdvertisement == null)
      return  Response.notFound();

    return Response.ok(resAdvertisement);

  }
  @Operation.post()
  Future<Response> insAdvertisement() async{
    final objAdvertisement = Advertisement()..read(await request.body.decode());
    final query = Query<Advertisement>(context)..values = objAdvertisement;
    final insAdvertisement = await query.insert();
    return Response.ok(insAdvertisement);
  }
  @Operation.put()
  Future<Response> upAdvertisement(@Bind.path('idAdvertisement')int idAdv) async{
    final objAdvertisement = Advertisement()..read(await request.body.decode());
    final queryAdvertisement = Query<Advertisement>(context)..where((a)=> a.idAdvertisement).equalTo(idAdv)..values = objAdvertisement;
    final upAdvertisement  = await queryAdvertisement.updateOne();
    return Response.ok(upAdvertisement);
  }
  @Operation.delete()
  Future<Response> delAdvertisement(@Bind.path('idAdvertisement')int idAdv) async{
    final queryAdvertisement = Query<Advertisement>(context)..where((a)=> a.idAdvertisement).equalTo(idAdv);
    final delAdvertisement = await queryAdvertisement.delete();
    return Response.ok(delAdvertisement);
  }


}