import 'package:flutter/material.dart';

class AppEntityListView<T> extends StatelessWidget {
  final List<T> items;
  final String emptyMessage;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final double itemSpacing;

  const AppEntityListView({
    required this.items,
    required this.emptyMessage,
    required this.itemBuilder,
    this.itemSpacing = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          emptyMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: itemSpacing),
      itemBuilder: (context, index) => itemBuilder(context, items[index]),
    );
  }
}
