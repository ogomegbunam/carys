import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/features/home/presentation/pages/widgets/drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      drawerDragStartBehavior: DragStartBehavior.start,
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        
      ),
      body: SafeArea(child: Text("Homepage")),
    );
  }
}
