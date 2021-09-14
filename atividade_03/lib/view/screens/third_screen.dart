import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgPath = "assets/images/futcover.jpeg";
    var desc =
        "O tema do nosso projeto será o desenvolvimento de um app de resultados de partidas de futebol, mais especificamente o time do coração do usuário. Dentro do app você irá encontrar o resultado de partidas ocorridas e quando será os próximos jogos, além de também poder visualizar a tabela do Campeonato Brasileiro (Brasileirão) e Copa do Brasil.";

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
      child: Center(
        child: Container(
            padding: EdgeInsets.all(15),
            width: 350,
            height: 350,
            color: Color.fromRGBO(0, 0, 0, 0.7),
            child: Column(
              children: [
                Text("Projeto\n\n",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                Text(
                  desc,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
