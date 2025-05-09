import 'instance.dart';
final List<Transaction> transactions1 = [
  Transaction(name: "Netflix Subscription", details: "\$15 - Jan 2, 2025", category: "Bills"),
  Transaction(name: "Bike Rental", details: "\$6 - May 1, 2025", category: "transport"),
  Transaction(name: "Tech Gadget", details: "\$220 - May 4, 2025", category: "shopping"),
  Transaction(name: "Pizza Hut", details: "\$20 - May 3, 2025", category: "food"),
  Transaction(name: "Water Bill", details: "\$25 - Apr 26, 2025", category: "rent"),
  Transaction(name: "Payment to John", details: "\$50 - Jan 3, 2025", category: "others"),
  Transaction(name: "Uber Ride", details: "\$18 - May 6, 2025", category: "transport"),
  Transaction(name: "Grocery Store", details: "\$45 - May 2, 2025", category: "food"),
  Transaction(name: "May Rent", details: "\$1200 - May 1, 2025", category: "rent"),
  Transaction(name: "Gas Station", details: "\$35 - May 4, 2025", category: "transport"),
  Transaction(name: "Amazon Purchase", details: "\$150 - May 6, 2025", category: "shopping"),
  Transaction(name: "Salary", details: "\$2000 - Jan 1, 2025", category: "others"),
  Transaction(name: "Zara Clothing", details: "\$80 - May 5, 2025", category: "shopping"),
  Transaction(name: "Bookstore", details: "\$30 - May 2, 2025", category: "shopping"),
  Transaction(name: "Security Deposit", details: "\$300 - Apr 30, 2025", category: "rent"),
  Transaction(name: "Maintenance Fee", details: "\$50 - Apr 28, 2025", category: "rent"),
  Transaction(name: "McDonald's", details: "\$12 - May 6, 2025", category: "food"),
  Transaction(name: "Metro Ticket", details: "\$2.50 - May 3, 2025", category: "transport"),
  Transaction(name: "Coffee", details: "\$3 - Dec 31, 2024", category: "food"),
  Transaction(name: "Starbucks Coffee", details: "\$5 - May 5, 2025", category: "food"),
];
final List<Transaction> foodTransactions = [
  Transaction(name: "McDonald's", details: "\$12 - May 6, 2025", category: "food"),
  Transaction(name: "Starbucks Coffee", details: "\$5 - May 5, 2025", category: "food"),
  Transaction(name: "Pizza Hut", details: "\$20 - May 3, 2025", category: "food"),
  Transaction(name: "Grocery Store", details: "\$45 - May 2, 2025", category: "food"),
];

final List<Transaction> transportTransactions = [
  Transaction(name: "Uber Ride", details: "\$18 - May 6, 2025", category: "transport"),
  Transaction(name: "Gas Station", details: "\$35 - May 4, 2025", category: "transport"),
  Transaction(name: "Metro Ticket", details: "\$2.50 - May 3, 2025", category: "transport"),
  Transaction(name: "Bike Rental", details: "\$6 - May 1, 2025", category: "transport"),
];

final List<Transaction> rentTransactions = [
  Transaction(name: "May Rent", details: "\$1200 - May 1, 2025", category: "rent"),
  Transaction(name: "Security Deposit", details: "\$300 - Apr 30, 2025", category: "rent"),
  Transaction(name: "Maintenance Fee", details: "\$50 - Apr 28, 2025", category: "rent"),
  Transaction(name: "Water Bill", details: "\$25 - Apr 26, 2025", category: "rent"),
];

final List<Transaction> shoppingTransactions = [
  Transaction(name: "Amazon Purchase", details: "\$150 - May 6, 2025", category: "shopping"),
  Transaction(name: "Zara Clothing", details: "\$80 - May 5, 2025", category: "shopping"),
  Transaction(name: "Tech Gadget", details: "\$220 - May 4, 2025", category: "shopping"),
  Transaction(name: "Bookstore", details: "\$30 - May 2, 2025", category: "shopping"),
];
