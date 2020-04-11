import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';


void main() =>
    runApp(
        MaterialApp(
          home: MyApp(),
          debugShowCheckedModeBanner: false,
        )
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _rememberMe = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  void _submitCommand() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      _loginCommand();
    }
  }
//Yasmine change this , hotti f blastha ur method
  void _loginCommand() {
    final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/login.jpg"),
                    fit: BoxFit.cover)),
          ), Center(
            child: new Container(
              height: 600.00,
              width: 300.00,
              decoration: BoxDecoration(
                color: Color(0xfff2e9db).withAlpha(100),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(24.00, 24.00),
                    color: Color(0xffd9cebf).withAlpha(40),
                    blurRadius: 42,
                  ),
                ], borderRadius: BorderRadius.circular(50.00),
              ),
            ),
          ),
          Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Bienvenue !",
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            color: Color(0xffffffff),
                            shadows: [
                              Shadow(
                                offset: Offset(0.00, 3.00),
                                color: Color(0xffff8700),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                "Email", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                            SizedBox(height: 2.0,),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],),
                              height: 50.0,
                              child: TextFormField(
                                validator: (val) => !EmailValidator.validate(val, true)
                                    ? 'Cet email nest pas valide'
                                    : null,
                                onSaved: (val) => _email = val,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Color(0xff739D84)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Color(0xff739D84),
                                  ),
                                  hintText: "Entrer votre Email",
                                  hintStyle: TextStyle(
                                    color: Color(0xff739D84),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                "Mot de passe", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                            SizedBox(height: 2.0,),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],),
                              height: 50.0,
                              child: TextFormField(
                                validator: (val) =>
                                val.length < 4 ? 'Password too short..' : null,
                                onSaved: (val) => _password = val,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                    color: Color(0xff739D84)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xff739D84),
                                  ),
                                  hintText: "Entrer votre mot de passe",
                                  hintStyle: TextStyle(
                                    color: Color(0xff739D84),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            child: Text(
                                "Mot de passe oublié?",
                                style: TextStyle(
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 20.0,
                          child: Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(unselectedWidgetColor: Colors
                                    .white),
                                child: Checkbox(
                                  value: _rememberMe,
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Souvient de moi',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: 250,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: _submitCommand,
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color(0xFFF1B97A),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Color(0xFFE8652D),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text("___________OU___________",
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                            SizedBox(height: 20.0,),
                            Text('S\'inscrire avec', style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Container(
                                      height: 40.0, width: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/facebook.png"),
                                        ),
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    child: Container(
                                      height: 40.0, width: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/google.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Vous n\'avez pas un compte? ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'S\'enregistrer',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),

              )
          ),

        ],
      ),

    );
  }
}

