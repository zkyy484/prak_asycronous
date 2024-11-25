import 'package:flutter/material.dart';
import 'package:praktikum_acronyus/navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {

  Future _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => const NavigationSecond()),) ?? Colors.blue;
    setState(() {});
  }

  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Moch. Dzaky Musyaddad'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateAndGetColor(context);
          },
          child: Text('Change Color')),
      ),
    );
  }
}

