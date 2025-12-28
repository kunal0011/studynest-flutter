import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              title: Text('Seat S1 (Daily Plan)'),
              trailing: Text('\$30.00'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Tax (10%)'),
              trailing: Text('\$3.00'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text('\$33.00',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  context.push('/payment');
                },
                child: const Text('Proceed to Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
