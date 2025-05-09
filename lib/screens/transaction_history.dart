import 'package:expensetracker/screens/SubScreens/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../instances/instance.dart';
class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key,required this.transactions});
  final List<Transaction> transactions;
  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction History",
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: widget.transactions.length,
        itemBuilder: (context, index) {
          final transaction = widget.transactions[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetailsPage(transaction: transaction),
                  ),
                );
              },
              child: ListTile(
                title: Text(transaction.name,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
                subtitle: Text(transaction.details,
                    style: GoogleFonts.inter(color: Colors.grey[600])),
                leading: const Icon(Icons.monetization_on_outlined,color: Colors.green,),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            )
          );
        },
      ),
    );
  }
}
