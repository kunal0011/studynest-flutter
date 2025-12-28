import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectPlanScreen extends StatelessWidget {
  final Map<String, dynamic>? extra;

  const SelectPlanScreen({super.key, this.extra});

  @override
  Widget build(BuildContext context) {
    final seatLabel = extra?['seatLabel'] as String? ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(title: const Text('Select Plan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.chair),
                const SizedBox(width: 8),
                Text(
                  'Selected Seat: $seatLabel',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildPlanCard(context, 'Hourly', '\$5/hr', false),
          const SizedBox(height: 12),
          _buildPlanCard(context, 'Daily', '\$30/day', true), // Recommended
          const SizedBox(height: 12),
          _buildPlanCard(context, 'Monthly', '\$500/month', false),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context,
    String title,
    String price,
    bool isRecommended,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isRecommended
            ? BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price),
        trailing: isRecommended
            ? Chip(
                label: const Text('Best Value'),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              )
            : null,
        onTap: () {
          context.push('/checkout');
        },
      ),
    );
  }
}
