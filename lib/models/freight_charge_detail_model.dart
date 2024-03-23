class FreightChargeDetailModel {
  String? code;
  String? description;
  String? qty;
  String? cargo;
  String? dg;
  String? uom;
  String? vat;
  String? pc;
  String? unit;
  String? cont;
  String? rate;
  String? curr;
  String? currRate;
  String? minQty;
  String? minAmt;
  String? amt;
  String? cost;
  String? percentage;
  String? rev;

  FreightChargeDetailModel(
      {this.code,
      this.description,
      this.qty,
      this.cargo,
      this.dg,
      this.uom,
      this.vat,
      this.pc,
      this.unit,
      this.cont,
      this.rate,
      this.curr,
      this.currRate,
      this.minQty,
      this.minAmt,
      this.amt,
      this.cost,
      this.percentage,
      this.rev});

  FreightChargeDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    qty = json['qty'];
    cargo = json['cargo'];
    dg = json['dg'];
    uom = json['uom'];
    vat = json['vat'];
    pc = json['pc'];
    unit = json['unit'];
    cont = json['cont'];
    rate = json['rate'];
    curr = json['curr'];
    currRate = json['currRate'];
    minQty = json['minQty'];
    minAmt = json['minAmt'];
    amt = json['amt'];
    cost = json['cost'];
    percentage = json['percentage'];
    rev = json['rev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['qty'] = this.qty;
    data['cargo'] = this.cargo;
    data['dg'] = this.dg;
    data['uom'] = this.uom;
    data['vat'] = this.vat;
    data['pc'] = this.pc;
    data['unit'] = this.unit;
    data['cont'] = this.cont;
    data['rate'] = this.rate;
    data['curr'] = this.curr;
    data['currRate'] = this.currRate;
    data['minQty'] = this.minQty;
    data['minAmt'] = this.minAmt;
    data['amt'] = this.amt;
    data['cost'] = this.cost;
    data['percentage'] = this.percentage;
    data['rev'] = this.rev;
    return data;
  }
}
