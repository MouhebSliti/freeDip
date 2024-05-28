import 'package:flutter/material.dart';
import 'package:mouheb/util/PreferenceManager.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  bool isChecked = false;
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
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
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: userName,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: "User Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: userEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email ",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: userPhone,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Phone ",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: CheckboxListTile(
                        title: const Text(
                          "J'ai lu et j'accepte",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        subtitle: const Text(
                          "les conditions d'utilisation",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        selected: isChecked,
                        activeColor: Colors.black,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val!;
                          });
                        },
                        value: isChecked,
                        controlAffinity:
                        ListTileControlAffinity.leading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                              if (userName.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Donner votre nom')));
                              } else if (userEmail.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Donner votre Email')));
                              } else if (!EmailValidator.validate(
                                  userEmail.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Email non valide')));
                              } else if (userPhone.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Donner votre Phone')));
                              } else if (userPass.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Donner votre Mot de Passe')));
                              } else if (userConfirmPass.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Confirmer votre Mot de Passe')));
                              } else if (userConfirmPass.text !=
                                  userPass.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Mots de Passe non identiques')));
                              } else if (!isChecked) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Accepter la CGU')));
                              } else {
                                // Save Information
                                PreferenceManager.instance.setString(
                                    PreferenceManager.NAME, userName.text);
                                PreferenceManager.instance.setString(
                                    PreferenceManager.EMAIl, userEmail.text);
                                PreferenceManager.instance.setString(
                                    PreferenceManager.PHONE, userPhone.text);
                                PreferenceManager.instance.setString(
                                    PreferenceManager.PASSWORD, userPass.text);
                                PreferenceManager.instance.setBool(
                                    PreferenceManager.ISLOGGED, true);

                                Navigator.of(context)
                                    .pushNamed("categoryScreen");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              elevation: 6,
                            ),
                            child: const Text(
                              "Valider",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
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
