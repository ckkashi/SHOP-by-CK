class ProductModel {
  String? pID;
  String? pImg;
  String? pName;
  String? pDesc;
  String? pPrice;
  String? pCat;

  ProductModel(
      {this.pID, this.pImg, this.pName, this.pDesc, this.pPrice, this.pCat});

  ProductModel.fromJson(Map<String, dynamic> json) {
    pID = json['pID'];
    pImg = json['pImg'];
    pName = json['pName'];
    pDesc = json['pDesc'];
    pPrice = json['pPrice'];
    pCat = json['pCat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pID'] = this.pID;
    data['pImg'] = this.pImg;
    data['pName'] = this.pName;
    data['pDesc'] = this.pDesc;
    data['pPrice'] = this.pPrice;
    data['pCat'] = this.pCat;
    return data;
  }
}
