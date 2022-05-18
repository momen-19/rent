class PaymentModel {
  late String name, cvv, id, number,nameCar,price;
  late DateTime date;

  PaymentModel({
    required this.name,
    required this.cvv,
    required this.number,
    required this.date,
    required this.price,
    required this.nameCar,

  });

  PaymentModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    number = map['number'];
    cvv = map['cvv'];
    date = map['date'];
price = map['price'];
nameCar = map['nameCar'];
  }

  Map<String, Object> toMap() {
    return {
      'name': name,
      'cvv': cvv,
      'number': number,
      'date': date,
      'price': price,
      'nameCar': nameCar,
    };
  }
}
