import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FinancialShimmer extends StatelessWidget {
  const FinancialShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(width: 50, height: 16, color: Colors.white),
                    const SizedBox(width: 12),
                    Expanded(child: Container(height: 16, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
