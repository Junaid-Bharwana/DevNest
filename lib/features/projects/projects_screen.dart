import 'package:devnest/core/widgets/phase_placeholder.dart';
import 'package:flutter/material.dart';

/// Projects tab: placeholder for the project list.
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhasePlaceholder(
      icon: Icons.folder_outlined,
      title: 'Projects',
      description:
          'Local web projects — WordPress, Laravel or plain PHP — will live '
          'here, each one served from its own folder on the device.',
      bullets: <String>[
        'Create, open and delete projects stored under the app data directory',
        'Show the origin each project is served on',
        'Coming in a later phase of the MVP',
      ],
    );
  }
}
