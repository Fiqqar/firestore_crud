import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  final Widget? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    this.leadingIcon,
    this.actions,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox(
          height: 96, // ⭐ FIX UTAMA: tinggi terkunci
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                leadingIcon ?? const Icon(Icons.fastfood, size: 32),

                const SizedBox(width: 12),

                // ===== TEXT AREA =====
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // ===== PRICE + ACTION =====
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Rp ${price.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          actions
                              ?.map(
                                (e) => SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: IconTheme(
                                    data: const IconThemeData(size: 18),
                                    child: e,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
