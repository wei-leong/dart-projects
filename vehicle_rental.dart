// Create an abstract class Vehicle with properties make, model, year, and calculateRentalCost(int days).
// Define an interface Insurable with insuranceCost(int days).
// Implement Car, Bike, Truck classes extending Vehicle; have at least one class implement Insurable.
// Build a RentalService class with a method rentVehicle(Vehicle v, int days) that prints rental + insurance if Insurable.
// In main(), demonstrate renting a Car for 5 days, a Bike for 2 days, and a Truck for 3 days.

class RentalService{
  void rentVehicle(Vehicle v, int day){
    double totalRentalCost = v.calculateRentalCost(day);
    double totalInsuranceCost = (v as Insurable).insuranceCost(day);

    print("Rental for Vehicle : $totalRentalCost");
    print("Insurance for Vehicle : $totalInsuranceCost");
    print("Total Amount Payable : ${totalRentalCost + totalInsuranceCost}");
  }
}

abstract class Vehicle{
  String? company;
  String? model;
  DateTime? year;
  double get dailyRate;

  Vehicle({this.company, this.model, this.year});

  double calculateRentalCost(int days){
    return dailyRate * days;
  }
}

abstract class Insurable{
  double insuranceCost(int days){
    return 0;
  }
}

class Car extends Vehicle implements Insurable{
  double get dailyRate => 50;

  Car({String? company, String? model, DateTime? year})
      : super(company: company, model: model, year: year);

  @override
  double insuranceCost(int days) {
    return 30.00 * days;
  }
}

class Van extends Vehicle implements Insurable{
  double get dailyRate => 50;

  Van({String? company, String? model, DateTime? year})
      : super(company: company, model: model, year: year);

  @override
  double insuranceCost(int days) {
    return 50.00 * days;
  }
}