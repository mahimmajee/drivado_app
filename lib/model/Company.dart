class CompanyModel {
  String? createdAt;
  String? companyName;
  String? logo;
  String? email;
  String? mobileNumber;
  String? address;
  int? gstNum;
  String? totalUnpaidBooking;
  int? availableCreditLimit;
  String? id;

  CompanyModel({
    this.createdAt,
    this.companyName,
    this.logo,
    this.email,
    this.mobileNumber,
    this.address,
    this.gstNum,
    this.totalUnpaidBooking,
    this.availableCreditLimit,
    this.id,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'] as String?;
    companyName = json['companyName'] as String?;
    logo = json['logo'] as String?;
    email = json['email'] as String?;
    mobileNumber = json['mobileNumber'] as String?;
    address = json['address'] as String?;
    gstNum = json['gst_num'] as int?;
    totalUnpaidBooking = json['totalUnpaidBooking'] as String?;
    availableCreditLimit = json['availableCreditLimit'] as int?;
    id = json['id'] as String?;
  }
}
