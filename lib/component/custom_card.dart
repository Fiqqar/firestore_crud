import 'package:firestore_crud/colors/color.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final List<Widget>? actions;

  const CustomCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.restaurant_menu,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Column(
            mainAxisSize: MainAxisSize.min, // ⬅️ KUNCI UTAMA
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Rp ${price.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.price,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 28, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      actions
                          ?.map(
                            (e) => SizedBox(
                              width: 28,
                              height: 28,
                              child: IconTheme(
                                data: const IconThemeData(size: 18),
                                child: e,
                              ),
                            ),
                          )
                          .toList() ??
                      [],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
