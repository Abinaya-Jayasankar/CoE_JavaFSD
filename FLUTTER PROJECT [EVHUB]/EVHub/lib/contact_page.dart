import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'localization.dart';

class ContactPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  ContactPage({required this.onLocaleChange});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).translate('select_language')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLangButton('English', Locale('en')),
              _buildLangButton('हिन्दी', Locale('hi')),
              _buildLangButton('தமிழ்', Locale('ta')),
              _buildLangButton('తెలుగు', Locale('te')),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLangButton(String lang, Locale locale) {
    return ElevatedButton(
      onPressed: () {
        widget.onLocaleChange(locale);
        Navigator.pop(context);
      },
      child: Text(lang),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("contact_us"),
          style: const TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: Colors.white),
            onPressed: _showLanguageDialog,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate("get_in_touch"),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context).translate("contact_subtitle"),
                      style: const TextStyle(color: Colors.white70, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    _buildNeonCard(Icons.email, "email_us", "evhubofficial@gmail.com"),
                    _buildNeonCard(Icons.phone, "call_us", "+1 6759876453"),
                    _buildNeonCard(Icons.location_on, "visit_us", "123 EV Street, Green City, USA"),
                    const SizedBox(height: 30),
                    _buildFloatingSocialBar(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNeonCard(IconData icon, String titleKey, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.purpleAccent, width: 1.5),
        boxShadow: [BoxShadow(color: Colors.purple.withOpacity(0.5), blurRadius: 10)],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.purpleAccent, size: 30),
        title: Text(AppLocalizations.of(context).translate(titleKey),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        tileColor: Colors.black.withOpacity(0.6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _buildFloatingSocialBar() {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        _buildSocialButton(FontAwesomeIcons.facebook, "Facebook"),
        _buildSocialButton(FontAwesomeIcons.instagram, "Instagram"),
        _buildSocialButton(FontAwesomeIcons.whatsapp, "WhatsApp"),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadowColor: Colors.purpleAccent,
        elevation: 5,
      ),
      onPressed: () {
        debugPrint("Redirecting to $label...");
      },
      icon: Icon(icon, size: 20),
      label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}