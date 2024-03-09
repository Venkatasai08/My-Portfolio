import 'package:flutter/material.dart';

class ServiceToggleButtonWidget extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;
  const ServiceToggleButtonWidget(
      {super.key, required this.iconData, required this.onTap});

  @override
  State<ServiceToggleButtonWidget> createState() =>
      _ServiceToggleButtonWidgetState();
}

class _ServiceToggleButtonWidgetState extends State<ServiceToggleButtonWidget> {
  bool isHover = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue.withOpacity(0.5),
      borderRadius: BorderRadius.circular(100),
      onTap: widget.onTap,
      onHover: (value) {
        isHover = !value;
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isHover ? Colors.white : Colors.blueAccent),
        child: Icon(
          widget.iconData,
          color: isHover ? Colors.blueAccent : Colors.white,
        ),
      ),
    );
  }
}
