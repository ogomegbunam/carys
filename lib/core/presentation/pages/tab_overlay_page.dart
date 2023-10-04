import 'package:carys/core/presentation/blocs/tab_overlay/tab_overlay_bloc.dart';
import 'package:carys/core/presentation/widgets/custom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabOverlayPage extends StatelessWidget {
  const TabOverlayPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabOverlayBloc, TabOverlayState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(child: child),
            if (state.shown) CustomNavBarWidget()
          ],
        );
      },
    );
  }
}
