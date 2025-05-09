import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../instances/instance.dart';
class TransactionDetailsPage extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailsPage({super.key, required this.transaction});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction Details",
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  transaction.details,
                  style: GoogleFonts.inter(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 20),
                Text(
                  "Category : ${transaction.category}",
                  style: GoogleFonts.inter(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 20),
                const Divider(),
                Text(
                  "This payment is done through secure transaction portal and the payment has been verified by the world bank",
                  style: GoogleFonts.inter(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
