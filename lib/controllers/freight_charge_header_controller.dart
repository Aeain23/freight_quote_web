import 'package:FreightQuote/models/freight_charge_header_model.dart';
import 'package:get/get.dart';

class FreightChargeHeaderController extends GetxController {

  FreightChargeHeaderModel data = FreightChargeHeaderModel();

  void updateData(
      {required String pol,
      required String pol2,
      required String pod,
      required String pod2,
      required String origin,
      required String origin2,
      required String dest,
      required String dest2,
      required String viaPort,
      required String viaPort2,
      required String shippingLine,
      required String shippingLine2,
      required String transitTime,
      required String transitDay,
      required String frequency,
      required String note,
      required String note2,
      required String viaSecond,
      required String viaSecond2,
      required String viaThird,
      required String viaThird2,
      required String detentionFreeDay,
      required String demurrageFreeDay,
      required String commodity2,
      required String commodity,
      required String deliveryType,
      required String deliveryType2}) {

    this.data = FreightChargeHeaderModel(
      commodity2: commodity2,
      commodity: commodity,
      deliveryType2: deliveryType2,
      deliveryType: deliveryType,
      demurrageFreeDay: demurrageFreeDay,
      dest2: dest2,
      dest: dest,
      detentionFreeDay: detentionFreeDay,
      frequency: frequency,
      note2: note2,
      note: note,
      origin2: origin2,
      origin: origin,
      pod2: pod2,
      pod: pod,
      pol2: pol2,
      pol: pol,
      shippingLine2: shippingLine2,
      shippingLine: shippingLine,
      transitDay: transitDay,
      transitTime: transitTime,
      viaPort2: viaPort2,
      viaPort: viaPort,
      viaSecond2: viaSecond2,
      viaSecond: viaSecond,
      viaThird2: viaThird2,
      viaThird: viaThird,
    );
    update();
  }
}
