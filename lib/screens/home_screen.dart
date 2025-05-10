import 'package:expensetracker/screens/SubScreens/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../instances/data.dart';
import '../instances/instance.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({super.key});

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  int income = 5000;
  int expenses = 2300;
  late int balance;
  int showmoreorless = 3;

  final List<Transaction> transactions = transactions1;

  @override
  Widget build(BuildContext context) {
    balance = income - expenses;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog();
        },
        backgroundColor: const Color(0xFF212121),
        child: const Icon(Icons.edit_calendar_sharp, color: Colors.white),
      ),
      drawer: buildDrawer(context, 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _summaryCard("Income", "\$$income", Colors.green),
              _summaryCard("Expenses", "\$$expenses", Colors.red),
              _summaryCard("Balance", "\$$balance", Colors.blue),
            ],
          ),
          const SizedBox(height: 24),
          _sectionTile(
            title: "Recent Expenses",
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  itemCount: showmoreorless.clamp(0, transactions.length),
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=>TransactionDetailsPage(transaction: transaction)
                            )
                          );
                        },
                        child: ListTile(
                        title: Text(
                          transaction.name,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          _formatTransactionDate(transaction.details),
                          style: GoogleFonts.inter(color: Colors.grey[600]),
                        ),
                        leading: const Icon(Icons.monetization_on_outlined,
                            color: Colors.green),
                        trailing:
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      )
                      ),
                    );
                  },
                ),
                if (transactions.length > 3)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showmoreorless =
                          showmoreorless == 3 ? transactions.length : 3;
                        });
                      },
                      child:
                      Center(child: Text(showmoreorless == 3 ? "Show More" : "Show Less")),
                    ),
                  ),
              ],
            ),
          ),
          _sectionTile(
            title: "Expenses by Category",
            child: SizedBox(height: 200, child: _buildPieChart()),
          ),
          _sectionTile(
            title: "Monthly Trend",
            child: SizedBox(height: 200, child: _buildBarChart()),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(String title, String amount, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(color: color, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(amount,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color)),
          ],
        ),
      ),
    );
  }

  Widget _sectionTile({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(title, style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.amber.shade900))),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
              value: 40,
              color: Colors.red,
              title: "Food",
              titleStyle: const TextStyle(color: Colors.white)),
          PieChartSectionData(
              value: 25,
              color: Colors.blue,
              title: "Bills",
              titleStyle: const TextStyle(color: Colors.white)),
          PieChartSectionData(
              value: 20,
              color: Colors.orange,
              title: "Transport",
              titleStyle: const TextStyle(color: Colors.white)),
          PieChartSectionData(
              value: 15,
              color: Colors.green,
              title: "Others",
              titleStyle: const TextStyle(color: Colors.white)),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 30,
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 1000,
        barGroups: [
          _barData(0, 500),
          _barData(1, 300),
          _barData(2, 600),
          _barData(3, 700),
          _barData(4, 450),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final titles = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
                return Text(titles[value.toInt()],
                    style: const TextStyle(fontSize: 12));
              },
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData _barData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y, color: Colors.blueAccent, width: 16),
      ],
    );
  }

  Future dialog() {
    DateTime selectedDate = DateTime.now();

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Add Transaction'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Date'),
                  subtitle: Text(_formatDate(selectedDate)),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now(), // disallow future
                    );
                    if (picked != null) {
                      setState(() => selectedDate = picked);
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(DateTime(date.year, date.month, date.day)).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    return '$diff days ago';
  }

  String _formatTransactionDate(String details) {
    try {
      final parts = details.split(' - ');
      if (parts.length != 2) return details;

      final date = DateTime.parse(parts[1]);
      final now = DateTime.now();
      final diff = now.difference(DateTime(date.year, date.month, date.day)).inDays;

      if (diff == 0) return 'Today';
      if (diff == 1) return 'Yesterday';
      return '$diff days ago';
    } catch (_) {
      return details;
    }
  }
}
