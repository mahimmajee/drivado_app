class UserModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? email;
  String? mobileNumber;
  String? currency;
  bool? isActive;
  String? totalUnpaidBooking;
  int? availableLimit;
  String? id;
  String? companyId;

  UserModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.email,
    this.mobileNumber,
    this.currency,
    this.isActive,
    this.totalUnpaidBooking,
    this.availableLimit,
    this.id,
    this.companyId,
  });

  String getCurrencyISOCode(String? currencyName) {
    final Map<String, String> currencyMap = {
      "Denar": "MKD",
      "Dominican Peso": "DOP",
      "Czech Koruna": "CZK",
      "Sri Lanka Rupee": "LKR",
      "Canadian Dollar": "CAD",
      "Rwanda Franc": "RWF",
      "Hong Kong Dollar": "HKD",
      "Iranian Rial": "IRR",
      "Fiji Dollar": "FJD",
      "Pakistan Rupee": "PKR",
      "European Monetary Unit (E.M.U.-6)": "XEU",
      "Kyat": "MMK",
      "Guyana Dollar": "GYD",
      "Hryvnia": "UAH",
      "Iceland Krona": "ISK",
      "Rand": "ZAR",
      "Kwacha": "MWK",
      "Kuwaiti Dinar": "KWD",
      "Tanzanian Shilling": "TZS",
      "Algerian Dinar": "DZD",
      "Zambian Kwacha": "ZMW",
      "Nuevo Sol": "PEN",
      "CFA Franc BCEAO": "XOF",
      "Colombian Peso": "COP",
      "Singapore Dollar": "SGD",
      "Zloty": "PLN",
      "Gibraltar Pound": "GIP",
      "Moldovan Leu": "MDL",
      "Moroccan Dirham": "MAD",
      "Brazilian Real": "BRL",
      "Tugrik": "MNT",
      "Kroon": "EEK",
      "Venezuelan bolÃ­var": "VES",
      "Vatu": "VUV",
      "Norwegian Krone": "NOK",
      "Malagasy Ariary": "MGA",
      "Bermudian Dollar (customarily known as Bermuda Dollar)": "BMD",
      "East Caribbean Dollar": "XCD",
      "Russian Ruble": "RUB",
      "New Leu": "RON",
    };
    return currencyMap[currencyName] ?? "Unknown";
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'] as String?;
    name = json['name'] as String?;
    avatar = json['avatar'] as String?;
    email = json['email'] as String?;
    mobileNumber = json['mobileNumber'] as String?;
    currency = getCurrencyISOCode(json['currency'] as String?);
    isActive = json['isActive'] as bool?;
    totalUnpaidBooking = json['totalUnpaidBooking'] as String?;
    availableLimit = json['availableLimit'] as int?;
    id = json['id'] as String?;
    companyId = json['companyId'] as String?;
  }
}
