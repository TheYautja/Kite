
import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';

class ConfigOption extends StatefulWidget {
    
    final String title;
    final String description;
    final IconData icon;
    final Future<void> Function() onClick;

    const ConfigOption({
        super.key,
        required this.title,
        required this.description,
        required this.icon,
        required this.onClick,
    });

    @override
    State<ConfigOption> createState() => _ConfigOptionState();

}

class _ConfigOptionState extends State<ConfigOption> {
    bool loading = false;

    Future<void> execute() async {
        if (loading) return;

        setState(() => loading = true);

        try {
            await widget.onClick();
        } finally {
        if (mounted) {
            setState(() => loading = false);
        }
        }

    }

    @override
    Widget build(BuildContext context) {
        return ListTile(
            contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
        ),
        leading: Icon(
            widget.icon,
            color: kitePrimary,
            size: 28,
        ),
        title: Text(
            widget.title,
            style: const TextStyle(
                color: kiteText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
            ),
        ),
        subtitle: Text(
            widget.description,
            style: const TextStyle(
                color: kiteTextSecondary,
                fontSize: 13,
            ),
        ),
        trailing: loading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: kitePrimary,
                ),
            )
            : const Icon(
                Icons.chevron_right,
                color: kiteTextSecondary,
            ),
        enabled: !loading,
        onTap: execute,
        );
    }
}

