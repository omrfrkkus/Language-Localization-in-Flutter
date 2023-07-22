import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.login),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: DropdownButton<String>(
                icon: Icon(Icons.language),
                hint: Text(AppLocalizations.of(context)!.sellectlanguage),
                value: selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage = newValue;
                  });
                },
                items: <String>['Turkish', 'English', 'French']
                    .map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              FlutterLogo(
                size: 100.0,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.username,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.password,
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.login),
                onPressed: () {
                  // Giriş işlemleri burada gerçekleştirilebilir
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
