import 'package:flutter/material.dart';

import '../Screens/categories_page.dart';
import '../screens/home_screen.dart';
import '../screens/settings_page.dart';
import '../screens/transaction_history.dart';
import 'data.dart';

class Transaction {
  final String name;
  final String details;
  final String category;
  Transaction({required this.name, required this.details, required this.category});
}
Widget buildDrawer(BuildContext context, int page) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF2E2E2E),
          ),
          child: Text(
            'Expense Tracker',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home,color: Colors.white,),
          title: Text('Home',style: TextStyle(color: Colors.white),),
          onTap: () {
            if(page != 0 ) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeDashboardPage()),
              );
            }
          },
        ),
        ListTile(
          leading: Icon(Icons.history,color: Colors.white,),
          title: Text('Transaction History',style: TextStyle(color: Colors.white,),),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransactionHistory(transactions: transactions1,)),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.category,color: Colors.white,),
          title: Text('Categories',style: TextStyle(color: Colors.white,),),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoriesPage()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.settings,color: Colors.white,),
          title: Text('Settings',style: TextStyle(color: Colors.white,)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ],
    ),
  );
}