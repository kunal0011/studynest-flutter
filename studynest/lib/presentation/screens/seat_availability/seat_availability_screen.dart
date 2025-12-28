import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:studynest/di/providers.dart';
import '../../../data/models/seat.dart';

class SeatAvailabilityScreen extends ConsumerStatefulWidget {
  const SeatAvailabilityScreen({super.key});

  @override
  ConsumerState<SeatAvailabilityScreen> createState() =>
      _SeatAvailabilityScreenState();
}

class _SeatAvailabilityScreenState
    extends ConsumerState<SeatAvailabilityScreen> {
  String? _selectedSeatId;
  String? _selectedSeatLabel;

  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(studyNestRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Select a Seat')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem(context, Colors.grey[300]!, 'Available'),
                _buildLegendItem(context, Colors.red[300]!, 'Booked'),
                _buildLegendItem(context, Colors.green, 'Selected'),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Seat>>(
              future: repository.getSeats(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                // Mock data if empty or error for UI demo
                final seats = snapshot.data ?? [];

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: seats.length,
                  itemBuilder: (context, index) {
                    final seat = seats[index];
                    return _buildSeat(context, seat);
                  },
                );
              },
            ),
          ),
          if (_selectedSeatLabel != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  'Selected Seat: $_selectedSeatLabel',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton(
              onPressed: _selectedSeatId == null
                  ? null
                  : () {
                      context.push(
                        '/select_plan',
                        extra: {
                          'seatId': _selectedSeatId,
                          'seatLabel': _selectedSeatLabel,
                        },
                      );
                    },
              child: const Text('Confirm Selection'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, Color color, String label) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildSeat(BuildContext context, Seat seat) {
    final isSelected = _selectedSeatId == seat.id;
    final isAvailable = seat.isAvailable;

    Color color;
    if (isSelected) {
      color = Colors.green;
    } else if (isAvailable) {
      color = Colors.grey[300]!;
    } else {
      color = Colors.red[300]!;
    }

    return InkWell(
      onTap: isAvailable
          ? () {
              setState(() {
                if (_selectedSeatId == seat.id) {
                  _selectedSeatId = null;
                  _selectedSeatLabel = null;
                } else {
                  _selectedSeatId = seat.id;
                  _selectedSeatLabel = seat.label;
                }
              });
            }
          : null,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: Colors.green[800]!, width: 2)
              : null,
        ),
        child: Text(
          seat.label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
