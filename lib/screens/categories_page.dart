import 'package:expensetracker/screens/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../instances/data.dart';
import '../instances/instance.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}
class _CategoriesPageState extends State<CategoriesPage> {
  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.fastfood, 'name': 'food'},
    {'icon': Icons.directions_car, 'name': 'transport'},
    {'icon': Icons.home, 'name': 'rent'},
    {'icon': Icons.shopping_bag, 'name': 'shopping'},
  ];
  final List<Color> _list = [
    Colors.red,
    Colors.blue,
    Colors.green
  ];
  // Map of icon name to IconData
  final Map<String, IconData> _iconMap = {
    'Fast Food': Icons.fastfood,
    'Transport': Icons.directions_car,
    'Home': Icons.home,
    'Shopping': Icons.shopping_bag,
    'Health': Icons.local_hospital,
    'Education': Icons.school,
    'Other': Icons.more_horiz,
  };

  void _showAddCategoryModal() {
    final TextEditingController nameController = TextEditingController();
    String selectedIconName = _iconMap.keys.first;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add New Category',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedIconName,
                dropdownColor: Colors.grey[850],
                iconEnabledColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Select Icon',
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: _iconMap.entries.map((entry) {
                  return DropdownMenuItem<String>(
                    value: entry.key,
                    child: Row(
                      children: [
                        Icon(entry.value, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(entry.key, style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedIconName = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (nameController.text.trim().isNotEmpty) {
                    setState(() {
                      _categories.add({
                        'name': nameController.text.trim(),
                        'icon': _iconMap[selectedIconName],
                      });
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Category'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Categories",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: _categories.length,
        separatorBuilder: (_, __) =>
        const Divider(color: Colors.grey, indent: 16, endIndent: 16),
        itemBuilder: (context, index) {
          final category = _categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransactionHistory(transactions: findTransaction(category["name"]),)),
              );
            },
            child: ListTile(
              leading: Icon(category['icon'], color: _list[index%3]),
              title: Text(
                category['name'],
                style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _categories.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete),
                color: Colors.grey[400],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: _showAddCategoryModal,
        child: const Icon(Icons.add),
      ),
    );
  }
  List<Transaction> findTransaction(String name) {
    if(name == "food") {
      return foodTransactions;
    }else if(name == "Transport") {
      return transportTransactions;
    }else if(name == "Rent") {
      return rentTransactions;
    }else if(name == "Shopping") {
      return shoppingTransactions;
    }
    return transactions1;
  }
}
