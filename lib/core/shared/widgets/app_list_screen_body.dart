import 'package:flutter/material.dart';

import 'app_search_field.dart';
import '../../theme/app_theme.dart';

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
    final horizontalPadding = AppUi.horizontalPadding(context);

    return SafeArea(
      child: isLoading && !hasData
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  AppUi.screenTopPadding,
                  horizontalPadding,
                  AppUi.screenBottomPadding,
                ),
                children: [
                  AppSearchField(
                    hintText: searchHint,
                    onChanged: onSearchChanged,
                  ),
                  const SizedBox(height: AppUi.sectionGap),
                  child,
                ],
              ),
            ),
    );
  }
}
