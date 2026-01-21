import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String description;
  final int price;

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: leadingIcon ?? const Icon(Icons.fastfood),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: actions == null
            ? Text(
                "Rp $price",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )
            : Row(mainAxisSize: MainAxisSize.min, children: actions!),
        onTap: onTap,
      ),
    );
  }
}
