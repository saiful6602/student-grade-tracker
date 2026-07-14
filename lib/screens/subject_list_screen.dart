import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

/// Screen 2 — shows every subject in a ListView.builder.
/// Swiping an item away (Dismissible) removes it via the provider.
class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  Color _gradeColor(BuildContext context, String grade) {
    final scheme = Theme.of(context).colorScheme;
    switch (grade) {
      case 'A':
        return scheme.primary;
      case 'B':
        return scheme.secondary;
      case 'C':
        return scheme.tertiary;
      default:
        return scheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SubjectProvider>(
      builder: (context, provider, _) {
        final subjects = provider.subjects;

        if (subjects.isEmpty) {
          return Center(
            child: Text(
              'No subjects yet.\nAdd one from the Add tab.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          );
        }

        return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return Dismissible(
              key: ValueKey('${subject.name}_$index'),
              direction: DismissDirection.endToStart,
              background: Container(
                color: theme.colorScheme.error,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: theme.colorScheme.onError),
              ),
              onDismissed: (_) {
                final removedName = subject.name;
                provider.removeSubject(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$removedName removed')),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                color: theme.cardColor,
                child: ListTile(
                  title: Text(subject.name, style: theme.textTheme.titleMedium),
                  subtitle: Text('Mark: ${subject.mark.toStringAsFixed(1)}'),
                  trailing: CircleAvatar(
                    backgroundColor: _gradeColor(context, subject.grade),
                    child: Text(
                      subject.grade,
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
