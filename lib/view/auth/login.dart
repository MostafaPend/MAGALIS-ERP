import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:cooky/cooky.dart' as cookie;

import '../../controller/controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? errorMessage = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        final snackBar = SnackBar(
          content: Text(errorMessage ?? ''),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  showLoaderDialog(BuildContext c){
    showDialog(
      barrierDismissible: false,
      context:c,
      builder:(c){
        return AlertDialog(
          backgroundColor: Colors.black,
          content: new Row(
            children: [
              Spacer(),
              Spacer(),
              CircularProgressIndicator(color: Colors.red,),
              Spacer(),
              Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." ,style: TextStyle(color: Colors.white),)),
              Spacer(),
              Spacer(),

            ],),
        );
      },
    );
  }


  Widget build(BuildContext context) {
    var pro = Provider.of<Controller>(context);
    var uid = cookie.get('UKEY');
    var name = cookie.get('UNAME');
    if(uid.toString()==""||uid.toString()=="null"){
    print("NO");
    }else{
      pro.id=uid.toString();
      pro.name=name.toString();
      QR.to("/home");
    }
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/1.png',
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300, right: 300),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 20, color: ColorManager.primary),
                          )),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(color: ColorManager.primary),
                          controller: emailController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.primary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.primary,
                              ),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: ColorManager.primary),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: ColorManager.primary),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.primary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.primary,
                              ),
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    ColorManager.primary)),
                            child: const Text('Login'),
                            onPressed: () async {
                              showLoaderDialog(context);
                              try{
                                var res = await signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);

                                User? user = FirebaseAuth.instance.currentUser;
                                if (user != null) {
                                  print(user.uid);
                                  pro.id = user.uid;
                                  var ress = await FirebaseFirestore.instance.collection("Users").doc(emailController.text).get();
                                  cookie.set('UKEY',user.uid.toString());
                                  cookie.set('UNAME',ress["name"].toString());
                                  QR.to('/home');

                                }


                              }catch(e){
                                Navigator.pop(context);
                                final snackBar =  SnackBar(
                                  content: Text('Wrong email or password'),);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }

                            },
                          )),
                      //  Row(
                      //    children: <Widget>[
                      //      const Text('Does not have account?'),
                      //      TextButton(
                      //        child: const Text(
                      //          'Sign in',
                      //          style: TextStyle(fontSize: 20),
                      //        ),
                      //        onPressed: () {
                      //          //signup screen
                      //        },
                      //      )
                      //    ],
                      //    mainAxisAlignment: MainAxisAlignment.center,
                      //  )
                    ],
                  ),
                )

                // SizedBox(
                //   width: 380,
                //   child: DefaultInputForm(
                //       controller: controller1,
                //       hint: 'Username',
                //       label: 'Username',
                //       onTab: () {},
                //       validate: () {},
                //       passFun: () {},
                //       onSave: () {},
                //       obscureText: false),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // SizedBox(
                //   width: 380,
                //   child: DefaultInputForm(
                //       controller: controller2,
                //       hint: 'Password',
                //       label: 'Password',
                //       onTab: () {},
                //       validate: () {},
                //       onSave: () {},
                //       suffix: IconButton(
                //         icon: Icon(Icons.remove_red_eye),
                //         onPressed: () {
                //           setState(() {
                //             isVisible = !isVisible;
                //           });
                //         },
                //       ),
                //       passFun: () {},
                //       obscureText: isVisible),
                // ),
                // const SizedBox(
                //   height: 25,
                // ),
                // MaterialButton(
                //   onPressed: () {},
                //   color: Colors.black,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   child: const Padding(
                //     padding: EdgeInsets.all(12.0),
                //     child: Text(
                //       'Login',
                //       style: TextStyle(
                //         fontFamily: 'poppins',
                //         fontSize: 15,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                //)
              ],
            ),
          ),
        ));
  }
}