import 'package:flutter/material.dart';
import 'package:murekkapp/pages/guncel_durumum.dart';
import 'package:murekkapp/widgets/widgets_button.dart';


import '../const.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  static const GuncelDurumum_route = '/Guncel_durumum';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 192, 197, 176),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 36, 41, 1),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('images/main_logo.jpg'),
            scale: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(172, 177, 181, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  //right: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //const SizedBox(height: 45),
                    const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                        Visibility(
                            visible: girisVisibility,
                            child: LoginButton2(
                              buttonText: "Giriş Yap",
                              onTap: () {
                                setState(() {
                                  girisColor = Colors.black;
                                  girisFontColor = Colors.white;
                                  kayitOlColor = Colors.white;
                                  kayitOlFontColor = Colors.black;
                                  girisVisibility = true;
                                  epostaBool = true;
                                  sifreBool = true;
                                  tekrarSifreBool = false;
                                  butonText = "Giriş Yap";
                                  sifreUnuttumBool = true;
                                });
                              },
                            )),
                        Visibility(
                            visible: girisVisibility,
                            child: SignUp(
                              buttonText: "Kayıt Ol",
                              onTap: () {
                                setState(() {
                                  girisColor = Colors.white;
                                  girisFontColor = Colors.black;
                                  kayitOlColor = Colors.black;
                                  kayitOlFontColor = Colors.white;
                                  girisVisibility = true;
                                  epostaBool = true;
                                  sifreBool = true;
                                  tekrarSifreBool = true;
                                  butonText = "Kayıt Ol";
                                  sifreUnuttumBool = false;
                                });
                              },
                            )),
                      ],
                    ),

                    Visibility(
                      visible: epostaBool,
                      child: const Eposta(),
                    ),

                    Visibility(
                      visible: sifreBool,
                      child: const LoginPassword(),
                    ),

                    Visibility(
                      visible: tekrarSifreBool,
                      child: const PasswordAgain(),
                    ),

                    Visibility(
                      visible: sifreUnuttumBool,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                girisVisibility = false;
                                epostaBool = false;
                                sifreBool = true;
                                tekrarSifreBool = true;
                                butonText = "Şifremi Yenile";
                                sifreUnuttumBool = false;
                              });
                            },
                            child: const Text("Şifremi Unuttum")),
                      ),
                    ),

                    Container(
                      height: 55,
                      // for an exact replicate, remove the padding.
                      // pour une réplique exact, enlever le padding.
                      padding:
                          const EdgeInsets.only(top: 5, left: 70, right: 70),
                      child: Visibility(
                          visible: true,
                          child: LoginButton(
                            buttonText: butonText,
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GuncelDurumum()));
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Eposta extends StatelessWidget {
  const Eposta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: InkWell(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(172, 177, 181, 1),
            ),
            child: const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(172, 177, 181, 1),
                hintText: "E-posta",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 221, 221, 221)), //<-- SEE HERE
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 250, 250, 250)), //<-- SEE HERE
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 237, 12, 27)), //<-- SEE HERE
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPassword extends StatefulWidget {
  const LoginPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  passwordControl() {
    setState(() {
      //refresh UI
      if (passenable) {
        //if passenable == true, make it false
        passenable = false;
      } else {
        passenable = true; //if passenable == false, make it true
      }
    });
  }

  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: InkWell(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(172, 177, 181, 1),
            ),
            child: TextField(
              obscureText:
                  passenable, //if passenable == true, show **, else show password character
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(172, 177, 181, 1),
                  hintText: "Şifre",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Color.fromARGB(255, 221, 221, 221)), //<-- SEE HERE
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Color.fromARGB(255, 250, 250, 250)), //<-- SEE HERE
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 237, 12, 27)), //<-- SEE HERE
                  ),
                  suffix: IconButton(
                      onPressed: () {
                        passwordControl();
                        //add Icon button at end of TextField
                      },
                      icon: Icon(passenable == true
                          ? Icons.remove_red_eye
                          : Icons.password))
                  //eye icon if passenable = true, else, Icon is ***__
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordAgain extends StatefulWidget {
  const PasswordAgain({super.key});

  @override
  State<PasswordAgain> createState() => _PasswordAgainState();
}

class _PasswordAgainState extends State<PasswordAgain> {
  passwordControl() {
    setState(() {
      //refresh UI
      if (passenable) {
        //if passenable == true, make it false
        passenable = false;
      } else {
        passenable = true; //if passenable == false, make it true
      }
    });
  }

  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: InkWell(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(172, 177, 181, 1),
            ),
            child: TextField(
              obscureText:
                  passenable, //if passenable == true, show **, else show password character
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(172, 177, 181, 1),
                  hintText: "Tekrar Şifre",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Color.fromARGB(255, 221, 221, 221)), //<-- SEE HERE
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Color.fromARGB(255, 250, 250, 250)), //<-- SEE HERE
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 237, 12, 27)), //<-- SEE HERE
                  ),
                  suffix: IconButton(
                      onPressed: () {
                        passwordControl();
                        //add Icon button at end of TextField
                      },
                      icon: Icon(passenable == true
                          ? Icons.remove_red_eye
                          : Icons.password))
                  //eye icon if passenable = true, else, Icon is ***__
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
