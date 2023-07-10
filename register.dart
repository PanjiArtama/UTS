import 'package:flutter/material.dart';
import 'package:panjiartamasinaga/kelompok/signin.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Back.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
          margin: EdgeInsets.only(top: 230),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 210),
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.5)),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                child: Column(
                  children: [
                    Container(
                        width: 300,
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                label: Text('Username',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text('Email',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text('Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text('Confirm Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 200),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signin(),
                        ));
                  },
                  child: Text('Sudah punya Akun'),
                ),
              ),
              SizedBox(height: 35),
              Container(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signin(),
                          ));
                    },
                    child: Text('Register')),
              )
            ],
          )),
    ));
  }
}
