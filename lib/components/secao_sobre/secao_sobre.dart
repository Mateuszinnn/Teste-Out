import 'package:flutter/material.dart';
import 'package:app/View/editar_sobre/editar_sobre.dart';

// Widget para exibir informações sobre um edifício, como título, descrição e imagem.
class BuildingInfoWidget extends StatelessWidget {
  final String title;
  final String handle;
  final String description;
  final String imagePath;

  const BuildingInfoWidget({
    required this.title,
    required this.handle,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //imagem do edificio
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(imagePath),
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
                    //nome do edificio
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 2),
                    //icone de verificado
                    const Icon(
                      Icons.verified,
                      color: Color(0xFF7A5CF0),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    //tag
                    Text(
                      handle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //descricao do perfil
                Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Widget para a página da seção "Sobre".
class SecaoSobre extends StatelessWidget {
  final VoidCallback onPressed;

  const SecaoSobre({Key? key, required this.onPressed}) : super(key: key);

  // Widget para construir a tabela de dias e horarios de atendimento.
  Widget buildHorarioRow(String dia, String horario) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //dia da semana
          Text(
            dia,
            style: const TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          //linha
          Text(
            '_' * 25,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              decoration: TextDecoration.underline,
              decorationColor: Colors.grey,
            ),
          ),
          //horario de atendimento
          Text(
            horario,
            style: const TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          //botao para edicao da secao sobre
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditarSobrePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(146.0, 38.0),
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
              'Editar Seção Sobre',
              style: TextStyle(
                color: Color(0xFF212121),
                fontFamily: 'Open Sans',
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                height: 1.5,
                letterSpacing: 0.0,
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          const Text(
            'Horário de Atendimento',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          buildHorarioRow('Segunda-feira', '09:00 às 17:00'), // Widget para construir a tabela de dias e horarios de atendimento.
          buildHorarioRow('Terça-feira', '09:00 às 17:00'), // Widget para construir a tabela de dias e horarios de atendimento.
          buildHorarioRow('Quarta-feira', '09:00 às 17:00'), // Widget para construir a tabela de dias e horarios de atendimento.
          buildHorarioRow('Quinta-feira', '09:00 às 17:00'), // Widget para construir a tabela de dias e horarios de atendimento.
          buildHorarioRow('Sexta-feira', '09:00 às 17:00'), // Widget para construir a tabela de dias e horarios de atendimento.
          buildHorarioRow('Sábado', 'Fechado'), // Widget para construir a tabela de dias e horarios de atendimento.
          buildHorarioRow('Domingo', 'Fechado'), // Widget para construir a tabela de dias e horarios de atendimento.
          const SizedBox(height: 16.0),
          const Text(
            'Edifícios',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          // Widget para exibir informações sobre um edifício, como título, descrição e imagem.
          const BuildingInfoWidget(
            title: 'Edifício Sul',
            handle: '@edificiosul',
            description: 'Edifício da Cidade Administrativa de MG',
            imagePath: 'assets/images/imagem2.jpg',
          ),
          // Widget para exibir informações sobre um edifício, como título, descrição e imagem.
          const BuildingInfoWidget(
            title: 'Edifício Norte',
            handle: '@edificionorte',
            description: 'Edifício da Cidade Administrativa de MG',
            imagePath: 'assets/images/imagem5.jpg',
          ),
          // Widget para exibir informações sobre um edifício, como título, descrição e imagem.
          const BuildingInfoWidget(
            title: 'Edifício Central',
            handle: '@edificiocentral',
            description: 'Edifício da Cidade Administrativa de MG',
            imagePath: 'assets/images/imagem4.jpg',
          ),
          //secao de localizacao
          const Text(
            'Localização',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          //linha com endereco e icone
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color(0xFF7A5CF0),
                size: 24.0,
              ),
              Text(
                'São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          //imagem de exemplo para localizacao
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/imagem6.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16.0),
          //secao de contato
          const Text(
            'Contato',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          //Telefone de contato
          const Row(
            children: [
              Icon(
                Icons.call_sharp,
                color: Color(0xFF7A5CF0),
                size: 24.0,
              ),
              Text(
                '+55 15 91234-5678',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          //email de contato
          const Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: Color(0xFF7A5CF0),
                size: 24.0,
              ),
              Text(
                'edificiosul@governomg.com.br',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
