
import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/widgets/bottom_nav.dart';
import 'package:kiteapp/widgets/config_option.dart';
import 'package:kiteapp/api/config_utilities.dart';

class Config extends StatelessWidget {
    Config({super.key});

    final ConfigUtils utils = ConfigUtils();

    void showMessage(
        BuildContext context,
        String message, {
        bool error = false,
    }) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(message),
                backgroundColor: error ? kiteError : kiteSurfaceLight,
                behavior: SnackBarBehavior.floating,
            ),
        );
    }

    Future<void> exportLibrary(BuildContext context) async {
        try {
            final path = await utils.exportToFile();

            if (!context.mounted) return;

            if (path != null) {
                showMessage(context, 'Library exported successfully');
            }
        } catch (e) {
            if (!context.mounted) return;

            showMessage(
                context,
                'Export failed: $e',
                error: true,
            );
        }
    }

    Future<void> importLibrary(BuildContext context) async {
        try {
            final count = await utils.importFromFile();

            if (!context.mounted) return;

            if (count != null) {
                showMessage(
                    context,
                    '$count movies imported successfully',
                );
            }
        } catch (e) {
            if (!context.mounted) return;

            showMessage(
                context,
                'Import failed: $e',
                error: true,
            );
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: kiteBackground,
            appBar: AppBar(
                title: const Text('Settings'),
                backgroundColor: kiteSurface,
                foregroundColor: kiteText,
                elevation: 0,
            ),
            body: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                            const Text(
                                'Library',
                                style: TextStyle(
                                    color: kiteText,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                                'Manage your saved movies and backups.',
                                style: TextStyle(
                                    color: kiteTextSecondary,
                                    fontSize: 14,
                                ),
                            ),

                            const SizedBox(height: 20),

                            Card(
                                color: kiteSurface,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                    children: [
                                        ConfigOption(
                                            title: 'Export library',
                                            description: 'Save your movies to a JSON file',
                                            icon: Icons.upload_file,
                                            onClick: () => exportLibrary(context),
                                        ),

                                        const Divider(
                                            height: 1,
                                            color: kiteSurfaceLight,
                                            indent: 16,
                                            endIndent: 16,
                                        ),

                                        ConfigOption(
                                            title: 'Import library',
                                            description: 'Restore movies from a JSON backup',
                                            icon: Icons.download,
                                            onClick: () => importLibrary(context),
                                        ),
                                    ],
                                ),
                            ),

                            const SizedBox(height: 32),

                            const Text(
                                'About',
                                style: TextStyle(
                                    color: kiteText,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),

                            const SizedBox(height: 16),

                            Card(
                                color: kiteSurface,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                ),
                                child: const ListTile(
                                    leading: Icon(
                                        Icons.info_outline,
                                        color: kitePrimary,
                                    ),
                                    title: Text(
                                        'Kite',
                                        style: TextStyle(color: kiteText),
                                    ),
                                    subtitle: Text(
                                        'Movie and TV series library',
                                        style: TextStyle(
                                            color: kiteTextSecondary,
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            bottomNavigationBar: BottomNav(),
        );
    }
}

