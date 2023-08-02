import 'package:carys/core/domain/entities/navbar_icon.dart';
import 'package:carys/core/presentation/blocs/tab_overlay/tab_overlay_bloc.dart';
import 'package:carys/core/presentation/widgets/custom_navbar_widget.dart';
import 'package:carys/features/chat/presentation/pages/chat_home_page.dart';
import 'package:carys/features/home/presentation/pages/home_page.dart';
import 'package:carys/features/likes/presentation/pages/likes_home_page.dart';
import 'package:carys/features/settings/presentation/pages/settings_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class TabOverlayPage extends StatelessWidget {
  TabOverlayPage({super.key});
  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() => [
        const HomePage(),
        const LikesHomePage(),
        const ChatHomePage(),
        const SettingsHomePage(),
      ];

  final List<NavbarIcon> _navBarItems = [
    NavbarIcon("Home", 'home'),
    NavbarIcon("Likes", 'likes'),
    NavbarIcon("Chat", 'chat'),
    NavbarIcon("Settings", 'settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabOverlayBloc, TabOverlayState>(
      builder: (context, state) {
        return PersistentTabView.custom(
          context,
          controller: state.tabController,
          itemCount: _navBarItems.length,
          screens: _buildScreens(),
          confineInSafeArea: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          handleAndroidBackButtonPress: true,
          hideNavigationBar: state is TabOverlayHidden,
          customWidget: (navBarEssentials) => CustomNavBarWidget(
            items: _navBarItems,
            selectedIndex: state.tabController.index,
            onItemSelected: (index) {
              controller.index = index;
              context.read<TabOverlayBloc>().add(ChangeTabIndexEvent(index));
            },
          ),
        );
      },
    );
  }
}
