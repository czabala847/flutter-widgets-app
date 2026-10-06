import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier).update((state) {
              //   return !state;
              // });

              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            },
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColorIndex = ref
        .watch(themeNotifierProvider)
        .selectorColor;

    return RadioGroup<int>(
      groupValue: selectedColorIndex,
      onChanged: (value) {
        if (value != null) {
          // ref.read(selectedColorIndexProvider.notifier).state = value;
          // ref.read(selectedColorIndexProvider.notifier).state = value;
          ref.read(themeNotifierProvider.notifier).changeColorIndex(value);
        }
      },
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];

          return RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
          );
        },
      ),
    );
  }
}
