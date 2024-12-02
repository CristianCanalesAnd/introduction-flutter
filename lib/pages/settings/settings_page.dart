import 'package:flutter/material.dart';
import 'package:introduction_flutter/widgets/custom_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "Settings",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      elevation: 0,
    );
  }

  Widget get _buildBody {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        buildDarkModeBtn,
      ],
    );
  }

  Widget get buildDarkModeBtn {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            "Dark Mode",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          CustomSwitch(
            activeColor: Colors.green.shade400,
            value: _darkMode,
            onChanged: onChangedDarkMode,
          ),
        ],
      ),
    );
  }

  // Functions
  onChangedDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
  }
}
