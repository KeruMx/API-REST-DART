import 'package:api_moviles/api_moviles.dart';

class DeliveryController extends ResourceController{
  DeliveryController(this.context);
  final ManagedContext context;
  @Operation.get()
  Future<Response> getDelivery() async{
    final courseQuery = Query<Delivery>(context);
    final resDelivery = await courseQuery.fetch();
    return Response.ok(resDelivery);
  }
  @Operation.get('idDelivery')
  Future<Response> getActivityById(@Bind.path('idDelivery') int idDeliv) async{
    final courseQuery = Query<Delivery>(context)..where((a)=>a.idDelivery).equalTo(idDeliv);
    final resDelivery = await courseQuery.fetch();
    if(resDelivery == null)
      return  Response.notFound();

    return Response.ok(resDelivery);

  }
  @Operation.post()
  Future<Response> insDelivery() async{
    final objDelivery = Delivery()..read(await request.body.decode());
    final query = Query<Delivery>(context)..values = objDelivery;
    final insDelivery = await query.insert();
    return Response.ok(insDelivery);
  }
  @Operation.put()
  Future<Response> upDelivery(@Bind.path('idDelivery')int idDeliv) async{
    final objDelivery = Delivery()..read(await request.body.decode());
    final queryDelivery = Query<Delivery>(context)..where((a)=> a.idDelivery).equalTo(idDeliv)..values = objDelivery;
    final upDelivery  = await queryDelivery.updateOne();
    return Response.ok(upDelivery);
  }
  @Operation.delete()
  Future<Response> delDelivery(@Bind.path('idDelivery')int idDeliv) async{
    final queryDelivery = Query<Delivery>(context)..where((a)=> a.idDelivery).equalTo(idDeliv);
    final delDelivery = await queryDelivery.delete();
    return Response.ok(delDelivery);
  }


}