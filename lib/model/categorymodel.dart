class Categorymodel {
  String? message;
  bool? status;
  List<categoris>? categorys;

  Categorymodel({this.message, this.status, this.categorys});

  Categorymodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      categorys = <categoris>[];
      json['data'].forEach((v) {
        categorys!.add(categoris.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.categorys != null) {
      data['data'] = this.categorys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class categoris {
  String? idss;
  String? catname;
  String? catdescription;
  String? image;

  categoris({this.idss, this.catname, this.catdescription, this.image});

  categoris.fromJson(Map<String, dynamic> json) {
    idss = json['idss'];
    catname = json['catname'];
    catdescription = json['catdescription'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['idss'] = this.idss;
    data['catname'] = this.catname;
    data['catdescription'] = this.catdescription;
    data['image'] = this.image;
    return data;
  }
}
