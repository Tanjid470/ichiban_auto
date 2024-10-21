class CarBookingModel{
  static String brand = 'brand';
  static String model = 'model';
  static String year = 'year';
  static String registration = 'registration';
  static String customerName = 'customerName';
  static String customerNumber = 'customerNumber';
  static String customerEmail = 'customerEmail';
  static String bookingTitle = 'bookingTitle';
  static String startDate = 'startDate';
  static String endDate = 'endDate';
  static String assignMechanic = 'assignMechanic';

  static List<String> setBookingInfo() => [
    brand,
    model,
    year,
    registration,
    customerName,
    customerNumber,
    customerEmail,
    bookingTitle,
    startDate,
    endDate,
    assignMechanic
  ];

}