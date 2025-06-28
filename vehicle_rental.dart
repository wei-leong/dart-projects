// Create an abstract class Vehicle with properties make, model, year, and abstract calculateRentalCost(int days).
// Define an interface Insurable with insuranceCost(int days).
// Implement Car, Bike, Truck classes extending Vehicle; have at least one class implement Insurable.
// Build a RentalService class with a method rentVehicle(Vehicle v, int days) that prints rental + insurance if Insurable.
// In main(), demonstrate renting a Car for 5 days, a Bike for 2 days, and a Truck for 3 days.

abstract class Vehicle{
  String? company;
  String? model;
  DateTime? year;

  double calculateRentalCost(int days){
    return 0;
  }
}