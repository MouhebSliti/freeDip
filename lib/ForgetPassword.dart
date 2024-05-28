import 'package:flutter/material.dart';
import 'package:mouheb/util/PreferenceManager.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => SignUpState();
}

class SignUpState extends State<ForgetPassword> {
  TextEditingController userPass = TextEditingController();
  TextEditingController userConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(50.0),
            child: Icon(
              Icons.password,
              size: 100,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: userPass,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add_chart_sharp),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: userConfirmPass,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add_chart_sharp),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          elevation: 6,
                        ),
                        child: const Text(
                          "Back",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Save Information

                          if (userPass.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Donner votre nouveau mot de passe')));
                          } else if (userConfirmPass.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Confirmer votre nouveau mot de passe')));
                          } else if (userPass.text != userConfirmPass.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Mots de passe non identitque')));
                          } else {
                            PreferenceManager.instance.setString(
                                PreferenceManager.PASSWORD, userPass.text);

                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          elevation: 6,
                        ),
                        child: const Text(
                          "Changer",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
    ));
  }
}
