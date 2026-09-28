import 'package:devnest/core/widgets/phase_placeholder.dart';
import 'package:flutter/material.dart';

/// Services tab: placeholder for the service dashboard.
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhasePlaceholder(
      icon: Icons.dns_outlined,
      title: 'Services',
      description:
          'The service dashboard will show every bundled runtime with its '
          'state, and let you start, stop and restart each one.',
      bullets: <String>[
        'Cards with Running / Stopped / Starting / Error per service',
        'CPU, RAM and storage readouts',
        'START ALL, STOP ALL and RESTART ALL',
        'Per-service logs',
      ],
    );
  }
}
