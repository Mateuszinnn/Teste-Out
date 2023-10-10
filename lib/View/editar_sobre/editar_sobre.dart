import 'package:flutter/material.dart';

class EditarSobrePage extends StatelessWidget {
  const EditarSobrePage({Key? key}) : super(key: key);

  // Widget para criar um campo de texto com um rótulo.
  Widget buildTextFieldWithLabel(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF212121),
              fontFamily: 'Open Sans',
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              height: 1.5,
              letterSpacing: 0.0,
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ),
        ),
      ],
    );
  }

  // Widget para criar um campo de texto (dias da semana e horarios de atendimento) com um ícone de seta para baixo.
  Widget buildTextField(String hintText) {
    return SizedBox(
      height: 40.0,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          //se for dia da semana o ícone de seta para baixo não é exibido
          suffixIcon: ![
            'Segunda-feira',
            'Terça-feira',
            'Quarta-feira',
            'Quinta-feira',
            'Sexta-feira',
          ].contains(hintText)
              ? const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF4E97FE),
                  size: 30,
                )
              : null,
        ),
      ),
    );
  }

  // Widget para criar o horario de atendimento com dia da semana, horário de abertura e horário de fechamento.
  Widget buildTimeInput(String day, String openTime, String closeTime) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: buildTextField(day), //cria o campo para os dias da semana
        ),
        const SizedBox(width: 8.0),
        SizedBox(
          width: 91.1,
          child: buildTextField(openTime), //cria o campo para os inicio dos atendimentos
        ),
        const SizedBox(width: 8.0),
        const Text(
          'às',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        const SizedBox(width: 8.0),
        SizedBox(
          width: 101.1,
          child: buildTextField(closeTime), //cria o campo para os fim dos atendimentos
        ),
      ],
    );
  }

  // Widget para criar um cartão de edifício com título e nome de administrador.
  Widget buildBuildingCard(String title, String adminUsername) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: Image.asset('assets/images/imagem2.jpg').image,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.verified,
                      color: Color(0xFF7A5CF0),
                      size: 16,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'Administrador',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: adminUsername,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          suffixIcon: const Icon(
                            Icons.edit,
                            color: Color(0xFFC7C6CA),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = [
      'Segunda-feira',
      'Terça-feira',
      'Quarta-feira',
      'Quinta-feira',
      'Sexta-feira',
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF4E97FE),
                size: 20.0,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Editar Sobre',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF4E97FE),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Horário de Atendimento',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: <Widget>[
                ...daysOfWeek.map((day) {
                  return Column(
                    children: [
                      buildTimeInput(day, '9:00', '17:00'), // Widget para criar o horario de atendimento com dia da semana, horário de abertura e horário de fechamento.
                      const SizedBox(height: 8.0),
                    ],
                  );
                }).toList(),
                const Row(
                  children: [
                    SizedBox(
                      width: 125,
                      child: SizedBox(
                        height: 40.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Sábado',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    SizedBox(
                      width: 226.9,
                      child: SizedBox(
                        height: 40.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Fechado',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                            suffixIcon: Icon(Icons.keyboard_arrow_down,
                                color: Color(0xFF4E97FE), size: 30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Row(
                  children: [
                    SizedBox(
                      width: 125,
                      child: SizedBox(
                        height: 40.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Domingo',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    SizedBox(
                      width: 226.9,
                      child: SizedBox(
                        height: 40.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Fechado',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                            suffixIcon: Icon(Icons.keyboard_arrow_down,
                                color: Color(0xFF4E97FE), size: 30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Edificios
                const Text(
                  'Edifícios',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                //botao de adicionar
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(97.0, 20.0),
                    padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.0),
                      side: const BorderSide(
                        color: Color(0xFF4E97FE),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Adicionar',
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontFamily: 'Open Sans',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ],
            ),
            buildBuildingCard('Edifício Sul', '@felipeluizz_'), // Widget para criar um cartão de edifício com título e nome de administrador.
            buildBuildingCard('Edifício Norte', '@robertapaula20'), // Widget para criar um cartão de edifício com título e nome de administrador.
            buildBuildingCard('Edifício Central', '@eumunhozricardo'), // Widget para criar um cartão de edifício com título e nome de administrador.
            buildTextFieldWithLabel('Localização', 'Localização'), // Widget para criar um campo de texto com um rótulo.
            buildTextFieldWithLabel('Whatsapp', 'Whatsapp'), // Widget para criar um campo de texto com um rótulo.
            buildTextFieldWithLabel('E-mail', 'E-mail'), // Widget para criar um campo de texto com um rótulo.
          ],
        ),
      ),
    );
  }
}
