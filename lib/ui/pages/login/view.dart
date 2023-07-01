import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pruebagfg/fakedata/Users.dart';

class LoginUiPage extends StatefulWidget {
  const LoginUiPage({Key? key}) : super(key: key);

  @override
  State<LoginUiPage> createState() => _LoginUiPageState();
}

class _LoginUiPageState extends State<LoginUiPage> {

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('LoginUiPage'),
      ),*/
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 9, 10, 24),
          ),
          
          child: PageView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        const Text(
                          'Sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //
                        const Text(
                          'admin:1234',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  FormLogin()

                ],
              ),
            ],
          ),
        )
    );
  }

}

class FormLogin extends StatefulWidget {
  FormLogin({Key? key}) : super(key: key);


  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final Map<String, String> _dataFormLogin = {
    'user': '',
    'password': '',
  };

  String messageErrorForm = '';

  initSession(){
    if(verifyFields()){
      UsersFakeData.fakeUsers.forEach((element) {
        if(element['user'] == _dataFormLogin['user'] && element['password'] == _dataFormLogin['password']){
          context.goNamed("adminClients");
        }else{
          setState(() {
            messageErrorForm = 'Usuario o contraseña incorrectos';
          });
        }
      });
    }
  }

  bool verifyFields(){
    if(_dataFormLogin['user'] == ''){
      setState(() {
        messageErrorForm = 'El campo usuario no puede estar vacio';
      });
      return false;
    }

    if(_dataFormLogin['password'] == ''){
      setState(() {
        messageErrorForm = 'El campo contraseña no puede estar vacio';
      });
      return false;
    }
    return true;
    //
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                //padding
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    //obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      //padding
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      //Background
                      filled: true,
                      fillColor: const Color(0x33EFEFEF),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      /*labelText: 'Usuario', labelStyle: TextStyle(
                      color: const Color.fromARGB(
                        255, 255, 255, 255),
                    ),*/
                      hintText: 'Usuario',
                      hintStyle: TextStyle(
                        color: const Color(0x99EFEFEF),
                      ),
                      //Text color wrote
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _dataFormLogin['user'] = text;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          //Password
          Row(
            children: [
              Expanded(
                //padding
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      //padding
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      //Background
                      filled: true,
                      fillColor: const Color(0x33EFEFEF),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      /*labelText: 'Usuario', labelStyle: TextStyle(
                      color: const Color.fromARGB(
                        255, 255, 255, 255),
                    ),*/
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(
                        color: const Color(0x99EFEFEF),
                      ),
                      //Text color wrote
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _dataFormLogin['password'] = text;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical : 0, horizontal: 30),
                  child: Center(child: 
                  Text(
                  messageErrorForm,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 106, 95),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextButton(
                  onPressed: () {
                    initSession();
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}