import 'package:flutter/material.dart';

class TodoDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? startDate;
  final DateTime? endDate;

  const TodoDetailPage({
    super.key,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF8F6FF),
              Color(0xFFF1F3FF),
              Color(0xFFFFF8FB),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.black54),
                    ),
                    const Text(
                      "Todo Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Icon(Icons.notifications_none_rounded,
                        color: Colors.black54),
                  ],
                ),
                const SizedBox(height: 40),

                // Todo Card
                Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.deepPurpleAccent, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            startDate != null
                                ? "${startDate!.day} ${_monthName(startDate!.month)} ${startDate!.year}"
                                : "No Date",
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 14),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? Colors.greenAccent.shade100
                                  : Colors.orangeAccent.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isCompleted ? "Done" : "Pending",
                              style: TextStyle(
                                color: isCompleted
                                    ? Colors.green.shade700
                                    : Colors.orange.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
