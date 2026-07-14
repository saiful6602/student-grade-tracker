import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

/// Screen 3 — total subjects, average mark, and overall grade.
/// Wrapped in a Consumer so it rebuilds live whenever subjects
/// are added or removed elsewhere in the app.
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SubjectProvider>(
      builder: (context, provider, _) {
        final passing = provider.passingSubjects.length;

        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              _SummaryCard(
                label: 'Total Subjects',
                value: '${provider.totalSubjects}',
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              _SummaryCard(
                label: 'Average Mark',
                value: provider.averageMark.toStringAsFixed(2),
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 16),
              _SummaryCard(
                label: 'Overall Grade',
                value: provider.overallGrade,
                color: theme.colorScheme.tertiary,
              ),
              const SizedBox(height: 16),
              _SummaryCard(
                label: 'Passing Subjects',
                value: '$passing / ${provider.totalSubjects}',
                color: theme.colorScheme.primaryContainer,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color),
        title: Text(label, style: theme.textTheme.titleMedium),
        trailing: Text(value, style: theme.textTheme.headlineSmall),
      ),
    );
  }
}
