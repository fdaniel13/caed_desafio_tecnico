import 'package:caed_desafio_tecnico/src/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/consts/icons_svg.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final controller = Modular.get<AuthController>();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.sizeOf(context).height,
         
          child: Column(
            children: [
              Image.asset('assets/authimage.png'),
                    Expanded(child: SvgPicture.string(logo)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    const SizedBox(height: 84,),
                    Form(
                        key: _formKey,
                        child: Column(
                        
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Usuário',
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: const Color(0xff757575),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 11.9,
                            ),
                            TextFormField(
                              controller: userController,
                              validator: (text) {
                                return controller.validateUser(username: text)
                                    ? null
                                    : "Nome de usuário não pode estar vazio";
                              },
                              decoration: const InputDecoration(
                                 
                                  filled: true,
                                  fillColor: Color(0xffF0F0F0),
                                  border: InputBorder.none),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Senha',
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: const Color(0xff757575),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 11.9,
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: passController,
                              validator: (text) {
                                return controller.validatePass(pass: text)
                                    ? null
                                    : "A senha não pode estar vazia";
                              },
                              decoration: const InputDecoration(
                                  
                                  filled: true,
                                  fillColor: Color(0xffF0F0F0),
                                  border: InputBorder.none),
                            ),
                          ],
                        )),
                    
                   
                  ],
                ),
              ),
              const SizedBox(
                      height: 41,
                    ),
                    
                    FilledButton(
                      onPressed: () async {

                        
                        if (_formKey.currentState!.validate()) {
                           var canGoHome=await controller.signIn(
                              username: userController.text,
                              pass: passController.text);
                            
                    canGoHome ? Modular.to.navigate('/home') : null;
                          
                        }
                      },
                      style: ButtonStyle(
                         shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )),
                          fixedSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width, 56)),
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color(0xffFFFF00)),
                         ),
                      child: Text(
                        "Entrar",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                      
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}