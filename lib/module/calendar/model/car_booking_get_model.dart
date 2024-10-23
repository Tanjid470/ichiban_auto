class BookingGetModel {
  final String? brand;
  final String? model;
  final String? year;
  final String? registration;
  final String? customerName;
  final String? customerNumber;
  final String? customerEmail;
  final String bookingTitle;
  final String startDate;
  final String endDate;
  final String assignMechanic;

  BookingGetModel({
    this.brand,
    this.model,
    this.year,
    this.registration,
    this.customerName,
    this.customerNumber,
    this.customerEmail,
    required this.bookingTitle,
    required this.startDate,
    required this.endDate,
    required this.assignMechanic,
  });

  factory BookingGetModel.fromJson(Map<String, dynamic> json) {
    return BookingGetModel(
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      registration: json['registration'],
      customerName: json['customerName'],
      customerNumber: json['customerNumber'],
      customerEmail: json['customerEmail'],
      bookingTitle: json['bookingTitle'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      assignMechanic: json['assignMechanic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'year': year,
      'registration': registration,
      'customerName': customerName,
      'customerNumber': customerNumber,
      'customerEmail': customerEmail,
      'bookingTitle': bookingTitle,
      'startDate': startDate,
      'endDate': endDate,
      'assignMechanic': assignMechanic,
    };
  }
}
