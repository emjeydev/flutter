import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: success ? Colors.green : Colors.red,
          title: Column(
            children: [
              Text(
                "Password Validator",
              ),
              Text(
                "@____emjey",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  success ? Icons.lock_open : Icons.lock_outline,
                  color: success ? Colors.green : Colors.red,
                  size: 130,
                ),
              ),
              SizedBox(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 207, 207, 207),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: success ? Colors.green : Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Password",
                            border:
                                OutlineInputBorder(borderSide: BorderSide())),
                      ),
                    ),
                    SizedBox(height: 5),
                    FlutterPwValidator(
                      controller: controller,
                      minLength: 8,
                      uppercaseCharCount: 2,
                      numericCharCount: 3,
                      specialCharCount: 1,
                      normalCharCount: 3,
                      width: 400,
                      height: 150,
                      onSuccess: () {
                        setState(() {
                          success = true;
                        });
                        print("Matched");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Password is a match"),
                          ),
                        );
                      },
                      onFail: () {
                        setState(() {
                          success = false;
                          print("Not Matched");
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
