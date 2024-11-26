import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;

  const CustomAppBar({
    super.key,
    this.username = "Farea",
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final isLightMode =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light;
    final greeting = DateTime.now().hour < 12 ? 'Good morning' : 'Good evening';

    return Container(
      decoration: BoxDecoration(
        color: kcontentColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 0.5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Theme Toggle Button
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isLightMode ? Colors.grey[100] : kbuttonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                  child: Icon(
                    isLightMode
                        ? Icons.dark_mode_rounded
                        : Icons.light_mode_rounded,
                    color: isLightMode ? kbuttonColor : Colors.amber,
                  ),
                ),
              ),

              // Greeting and Username
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                  color: isLightMode ? kcontentColor : kbuttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          greeting,
                          style: TextStyle(
                            color: isLightMode ? Colors.black87 : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                color:
                                isLightMode ? Colors.black87 : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.waving_hand_rounded,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
