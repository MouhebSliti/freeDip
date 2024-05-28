import 'package:flutter/material.dart';
import 'package:mouheb/util/PreferenceManager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userLogin = TextEditingController();
  TextEditingController userPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: userLogin,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "LOGIN",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: userPass,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.add_chart_sharp),
                        hintText: "MOT DE PASSE",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Text(
                            "Vous n'avez pas un compte?",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          InkWell(
                            onTap: () {
                              // Sign Up
                              Navigator.of(context).pushNamed("signUp");
                            },
                            child: const Text(
                              "S'inscrire",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: ElevatedButton(
                        onPressed: () {
                          if (userLogin.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Donner votre Login'),
                              ),
                            );
                          } else if (userPass.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Donner votre mot de passe'),
                              ),
                            );
                          } else {
                            String login = PreferenceManager.instance
                                .getString(PreferenceManager.EMAIl);
                            String password = PreferenceManager.instance
                                .getString(PreferenceManager.PASSWORD);

                            if (login == userLogin.text && password == userPass.text) {
                              if (!PreferenceManager.instance.getBool(PreferenceManager.ISLOGGED)) {
                                // Set ISLOGGED to true to indicate the user has logged in
                                PreferenceManager.instance.setBool(PreferenceManager.ISLOGGED, true);
                                // Navigate to the category screen
                                Navigator.of(context).pushReplacementNamed("categoryScreen");
                              } else {
                                // Navigate to the home screen for subsequent logins
                                Navigator.of(context).pushReplacementNamed("homeScreen");
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Vérifier vos credentials'),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          elevation: 6,
                        ),
                        child: const Text(
                          "Se connecter",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Forget PassWord
                        Navigator.of(context)
                            .pushNamed("forgetPassword");
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Text(
                          "Mot de passe oublié?",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
