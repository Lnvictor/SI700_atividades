import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/auth/auth_bloc.dart';
import 'package:trab_01/logic/auth/auth_event.dart';
import 'package:trab_01/logic/auth/register_bloc.dart';
import 'package:trab_01/logic/auth/register_event.dart';
import 'package:trab_01/logic/auth/register_state.dart';
import 'package:trab_01/logic/user/user_bloc.dart';
import 'package:trab_01/logic/user/user_event.dart';
import 'package:trab_01/logic/user/user_state.dart';
import 'package:trab_01/main.dart';
import 'package:trab_01/model/user.dart';
import 'package:trab_01/view/screens/auth/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trab_01/view/screens/core/home.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formProfileKey = new GlobalKey();
    String? name = user.name;
    String? lastName = user.lastName;
    String? email = user.email;
    String? team = user.team;
    String? birthday = user.birthday;
    String? city = user.city;
    String? rgState = user.rgState;
    String? password = user.password;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state){
        return Scaffold(
              appBar: AppBar(title: Text("Perfil")),
              body: Form(
                key: formProfileKey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Nome", border: OutlineInputBorder()),
                              initialValue: user.name,
                          validator: (String? inValue) {
                            if (inValue!.length == 0) {
                              return "Insira algo como nome";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            name = inValue!;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Sobrenome",
                              border: OutlineInputBorder()),
                            initialValue: user.lastName,
                          validator: (String? inValue) {
                            if (inValue!.length == 0) {
                              return "Insira algo como sobrenome";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            lastName = inValue;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email", border: OutlineInputBorder()),
                              initialValue: user.email,
                          validator: (String? inValue) {
                            if (inValue!.length < 4) {
                              return "Digite algo como email";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            email = inValue!;
                          },
                        ),
                        SizedBox(height: 5),
                        DropdownButton<String>(
                          hint: Text("Selecione o Seu time"),
                          value: user.team,
                          items: <String>['Sao Paulo', 'Curintia']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (dynamic value) {
                            team = value;
                            BlocProvider.of<RegisterBloc>(context)
                                .add(ChangeOnDropDownMenu());
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Data de nascimento",
                              border: OutlineInputBorder()),
                              initialValue: user.birthday,
                          onSaved: (String? inValue) {
                            birthday = inValue;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Cidade",
                              border: OutlineInputBorder()),
                              initialValue: user.city,
                          onSaved: (String? inValue) {
                            city = inValue;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Estado",
                              border: OutlineInputBorder()),
                              initialValue: user.rgState,
                          onSaved: (String? inValue) {
                            rgState = inValue;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Senha", border: OutlineInputBorder()),
                            initialValue: user.password,
                          onSaved: (String? inValue) {
                            password = inValue;
                          },
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            if (formProfileKey.currentState!.validate()) {
                              formProfileKey.currentState!.save();
                              user.name = name;
                              user.lastName = lastName;
                              user.email = email;
                              user.birthday = birthday;
                              user.rgState = rgState;
                              user.team = team;
                              user.city = city;
                              user.password = password;
                              BlocProvider.of<UserBloc>(context).add(UpdateUser(userId, user));
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return HomeScreen();
                              }
                              ));
                            }
                          },
                          child: Text("Salvar"),
                        ),
                        ElevatedButton(
                          onPressed: (){
                              BlocProvider.of<UserBloc>(context).add(DeleteUser(userId));
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return MyApp();
                              }
                              ));
                          },  
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: Text("Apagar Conta"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
      });
  }
}
