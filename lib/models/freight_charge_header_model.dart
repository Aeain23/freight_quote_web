  class FreightChargeHeaderModel {
  String? pol;
  String? pol2;
  String? pod;
  String? pod2;
  String? viaPort;
  String? viaPort2;
  String? shippingLine;
  String? shippingLine2;
  String? transitTime;
  String? transitDay;
  String? frequency;
  String? note;
  String? note2;
  String? origin;
  String? origin2;
  String? dest;
  String? dest2;
  String? viaSecond;
  String? viaSecond2;
  String? viaThird;
  String? viaThird2;
  String? detentionFreeDay;
  String? demurrageFreeDay;
  String? commodity;
  String? commodity2;
  String? deliveryType;
  String? deliveryType2;

  FreightChargeHeaderModel(
      {this.pol,
      this.pol2,
      this.pod,
      this.pod2,
      this.viaPort,
      this.viaPort2,
      this.shippingLine,
      this.shippingLine2,
      this.transitTime,
      this.transitDay,
      this.frequency,
      this.note,
      this.note2,
      this.origin,
      this.origin2,
      this.dest,
      this.dest2,
      this.viaSecond,
      this.viaSecond2,
      this.viaThird,
      this.viaThird2,
      this.detentionFreeDay,
      this.demurrageFreeDay,
      this.commodity,
      this.commodity2,
      this.deliveryType,
      this.deliveryType2});

  FreightChargeHeaderModel.fromJson(Map<String, dynamic> json) {
    pol = json['pol'];
    pol2 = json['pol2'];
    pod = json['pod'];
    pod2 = json['pod2'];
    viaPort = json['viaPort'];
    viaPort2 = json['viaPort2'];
    shippingLine = json['shippingLine'];
    shippingLine2 = json['shippingLine2'];
    transitTime = json['transitTime'];
    transitDay = json['transitDay'];
    frequency = json['frequency'];
    note = json['note'];
    note2 = json['note2'];
    origin = json['origin'];
    origin2 = json['origin2'];
    dest = json['dest'];
    dest2 = json['dest2'];
    viaSecond = json['viaSecond'];
    viaSecond2 = json['viaSecond2'];
    viaThird = json['viaThird'];
    viaThird2 = json['viaThird2'];
    detentionFreeDay = json['detentionFreeDay'];
    demurrageFreeDay = json['demurrageFreeDay'];
    commodity = json['commodity'];
    commodity2 = json['commodity2'];
    deliveryType = json['deliveryType'];
    deliveryType2 = json['deliveryType2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pol'] = this.pol;
    data['pol2'] = this.pol2;
    data['pod'] = this.pod;
    data['pod2'] = this.pod2;
    data['viaPort'] = this.viaPort;
    data['viaPort2'] = this.viaPort2;
    data['shippingLine'] = this.shippingLine;
    data['shippingLine2'] = this.shippingLine2;
    data['transitTime'] = this.transitTime;
    data['transitDay'] = this.transitDay;
    data['frequency'] = this.frequency;
    data['note'] = this.note;
    data['note2'] = this.note2;
    data['origin'] = this.origin;
    data['origin2'] = this.origin2;
    data['dest'] = this.dest;
    data['dest2'] = this.dest2;
    data['viaSecond'] = this.viaSecond;
    data['viaSecond2'] = this.viaSecond2;
    data['viaThird'] = this.viaThird;
    data['viaThird2'] = this.viaThird2;
    data['detentionFreeDay'] = this.detentionFreeDay;
    data['demurrageFreeDay'] = this.demurrageFreeDay;
    data['commodity'] = this.commodity;
    data['commodity2'] = this.commodity2;
    data['deliveryType'] = this.deliveryType;
    data['deliveryType2'] = this.deliveryType2;
    return data;
  }
}
