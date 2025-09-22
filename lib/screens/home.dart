import 'package:flutter/material.dart';
import 'package:manifest_app/const/color.dart';
import 'package:manifest_app/providers/manifestation_provider.dart';
import 'package:manifest_app/providers/theme_provider.dart';
import 'package:manifest_app/screens/past_manifestation.dart';
import 'package:provider/provider.dart';

class ManifestationHomePage extends StatelessWidget {
  const ManifestationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
            ? darkColor
            : primaryColor,
        elevation: 0,
        title: const Text(
          'Manifest Daily',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
                onPressed: themeProvider.toggleTheme,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PastManifestationsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Provider.of<ThemeProvider>(context).isDarkMode
                ? [darkColor.withOpacity(0.1), Colors.black]
                : [primaryColor.withOpacity(0.1), Colors.white],
          ),
        ),
        child: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: ManifestationForm(),
          ),
        ),
      ),
    );
  }
}

class ManifestationForm extends StatefulWidget {
  const ManifestationForm({super.key});

  @override
  State<ManifestationForm> createState() => _ManifestationFormState();
}

class _ManifestationFormState extends State<ManifestationForm>
    with TickerProviderStateMixin {
  final TextEditingController manifestationController = TextEditingController();
  final TextEditingController gratitudeController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    manifestationController.dispose();
    gratitudeController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: primaryColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controller,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ManifestationProvider>(
      builder: (context, manifestationProvider, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              // Welcome Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, primaryColor.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.white, size: 40),
                    SizedBox(height: 15),
                    Text(
                      "Transform Your Dreams Into Reality",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Set your intentions and attract abundance",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Input Fields
              _buildTextField(
                controller: manifestationController,
                label: "Today's Manifestation",
                hint: "I am attracting financial abundance and success...",
                icon: Icons.star_rounded,
              ),

              _buildTextField(
                controller: gratitudeController,
                label: "Gratitude Practice",
                hint:
                    "I'm grateful for my health, family, and opportunities...",
                icon: Icons.favorite_rounded,
              ),

              // Daily Affirmation Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? darkColor
                      : Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.format_quote,
                      color: Colors.amber.shade700,
                      size: 30,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Today's Affirmation",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '"${manifestationProvider.dailyAffirmation}"',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Save Button
              Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    final manifest = manifestationController.text.trim();
                    final gratitude = gratitudeController.text.trim();

                    if (manifest.isEmpty || gratitude.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Please fill in both fields"),
                          backgroundColor: Colors.orange,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                      return;
                    }

                    await manifestationProvider.saveManifestation(
                      manifest,
                      gratitude,
                    );
                    manifestationController.clear();
                    gratitudeController.clear();

                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Text("Manifestation Saved Successfully!"),
                          ],
                        ),
                        backgroundColor:
                            Provider.of<ThemeProvider>(
                              context,
                              listen: false,
                            ).isDarkMode
                            ? darkColor
                            : primaryColor,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).isDarkMode
                        ? darkColor
                        : primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(width: 2, color: Colors.grey),
                    ),
                    elevation: 8,
                    shadowColor: primaryColor.withOpacity(0.3),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save_rounded, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Save Manifestation",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // View Past Manifestations Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PastManifestationsPage(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: primaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history_rounded, color: primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        "View Past Manifestations",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
