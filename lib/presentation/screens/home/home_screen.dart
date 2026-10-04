import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  final menus = appMenuItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        final currentMenu = menus[index];

        return _CustomListTitle(currentMenu: currentMenu);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const new({required this.currentMenu});

  final MenuItem currentMenu;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(currentMenu.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(currentMenu.title),
      subtitle: Text(currentMenu.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        // Navigator.pushNamed(context, currentMenu.link );

        context.push(currentMenu.link);
        // context.pushNamed( CardsScreen.name );
      },
    );
  }
}
