import 'package:flutter/material.dart';

import 'app_search_field.dart';

class AppListScreenBody extends StatelessWidget {
  final String searchHint;
  final bool isLoading;
  final bool hasData;
  final Future<void> Function() onRefresh;
  final ValueChanged<String>? onSearchChanged;
  final Widget child;

  const AppListScreenBody({
    required this.searchHint,
    required this.isLoading,
    required this.hasData,
    required this.onRefresh,
    required this.child,
    this.onSearchChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final horizontalPadding =
        (screenWidth * 0.055).clamp(16.0, 24.0).toDouble();

    return SafeArea(
      child: isLoading && !hasData
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  8,
                  horizontalPadding,
                  24,
                ),
                children: [
                  AppSearchField(
                    hintText: searchHint,
                    onChanged: onSearchChanged,
                  ),
                  SizedBox(height: screenWidth * 0.07),
                  child,
                ],
              ),
            ),
    );
  }
}
