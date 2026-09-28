import 'package:devnest/core/widgets/phase_placeholder.dart';
import 'package:flutter/material.dart';

/// Terminal tab: placeholder for the log and command view.
class TerminalScreen extends StatelessWidget {
  const TerminalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhasePlaceholder(
      icon: Icons.terminal_outlined,
      title: 'Terminal',
      description:
          'Live stdout and stderr from the running processes, streamed from the '
          'Kotlin layer over a platform channel.',
      bullets: <String>[
        'Streamed process logs with follow and filter',
        'Errors surfaced in plain language rather than raw exit codes',
        'Coming with the native process pipeline',
      ],
    );
  }
}
