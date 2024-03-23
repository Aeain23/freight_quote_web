import 'package:FreightQuote/models/freight_charge_detail_model.dart';
import 'package:get/get.dart';

class FreightChargeDetailController extends GetxController {
  List<FreightChargeDetailModel> freightChargeData = [
    FreightChargeDetailModel(code: "OFE", description: "OCEAN FREIGHT EXPORT", qty: "-", cargo: "FCL", dg: "1", uom: "20F"),
    FreightChargeDetailModel(code: "OFE", description: "OCEAN FREIGHT EXPORT", qty: "-", cargo: "FCL", dg: "1", uom: "20F"),
    FreightChargeDetailModel(code: "OFE", description: "OCEAN FREIGHT EXPORT", qty: "-", cargo: "FCL", dg: "1", uom: "20F"),
    FreightChargeDetailModel(code: "OFE", description: "OCEAN FREIGHT EXPORT", qty: "-", cargo: "FCL", dg: "1", uom: "20F"),
  ];

  void updateData({
    required int index,
    required String code,
    required String desc,
    required String qty,
    required String cargo,
    required String dg,
    required String uom,
    required String vat,
    required String pc,
    required String unit,
    required String cont,
    required String rate,
    required String curr,
    required String currRate,
    required String minQty,
    required String minAmt,
    required String amt,
    required String cost,
    required String percentage,
    required String rev,
  }) {
    // freightChargeData.map((e) => e.)

    freightChargeData[index] = FreightChargeDetailModel(
      code: code,
      description: desc,
      qty: qty,
      cargo: cargo,
      dg: dg,
      uom: uom,
      vat: vat,
      pc: pc,
      amt: amt,
      cont: cont,
      cost: cost,
      curr: curr,
      currRate: currRate,
      minAmt: minAmt,
      minQty: minQty,
      percentage: percentage,
      rate: rate,
      rev: rev,
      unit: unit,
    );
    update();
  }
}
