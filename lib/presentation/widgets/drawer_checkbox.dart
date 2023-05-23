import 'package:flutter/material.dart';

class DrawerCheckbox extends StatefulWidget {
  final String text;
  final bool value;
  final Function(bool? value) onChanged;

  const DrawerCheckbox(
      {Key? key,
      required this.text,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  State<DrawerCheckbox> createState() => _DrawerCheckboxState();
}

class _DrawerCheckboxState extends State<DrawerCheckbox> {
  late bool enabled = widget.value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Theme.of(context).colorScheme.onSurface),
                ),
                onPressed: () {
                  widget.onChanged(!enabled);
                  setState(() {
                    enabled = !enabled;
                  });
                },
                child: Text(widget.text)),
          ),
          Checkbox(
              value: enabled,
              onChanged: (value) {
                widget.onChanged(value);
                setState(() {
                  enabled = !enabled;
                });
              })
        ],
      ),
    );
  }
}
