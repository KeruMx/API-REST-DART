import 'package:api_moviles/api_moviles.dart';
import 'package:api_moviles/model/Delivery.dart';

class DeliveryController extends ResourceController{
  DeliveryController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getDeliveries() async{
    final query = Query<Delivery>(context);
    final res = await query.fetch();
    return Response.ok(res);
  }

  @Operation.get('idDelivery')
  Future<Response> getDeliveryById(@Bind.path('idDelivery') int idAct) async{
    final query = Query<Delivery>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.fetch();
    if(res==null){
      return Response.notFound();
    }
    return Response.ok(res);
  }

  @Operation.post()
  Future<Response> insertDelivery() async{
    final advertisement = Delivery()..read(await request.body.decode());
    final query = Query<Delivery>(context)..values=advertisement;
    final res = await query.insert();
    return Response.ok(res);
  }

  @Operation.put('idDelivery')
  Future<Response> updateDelivery(@Bind.path('idDelivery') int idAct) async{
    final advertisement = Delivery()..read(await request.body.decode());
    final query = Query<Delivery>(context)..where((a)=>a.id).equalTo(idAct)..values=advertisement;
    final res = await query.updateOne();
    return Response.ok(res);
  }

  @Operation.delete('idDelivery')
  Future<Response> deleteDelivery(@Bind.path('idDelivery') int idAct) async{
    final query = Query<Delivery>(context)..where((a)=>a.id).equalTo(idAct);
    final res = await query.delete();
    return Response.ok(res);
  }
}
