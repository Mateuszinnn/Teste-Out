import 'package:flutter/material.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({Key? key}) : super(key: key);

  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  // Widget para criar um campo de texto comum com um rótulo e margem
  Widget buildTextFieldWithLabel(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
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
                  if (label == 'Moderadores')
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(97.0, 20.0),
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 4.0, 16.0, 4.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48.0),
                                side: const BorderSide(
                                  color: Color(0xFF000000),
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
                    ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40.0,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              suffixIcon: hint == 'Moderadores'
                  ? const Icon(Icons.dangerous, color: Colors.red, size: 20)
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icone para voltar
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
            //Cabecalho da pagina
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Editar Perfil',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            //Boato de Salvar
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
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5, right: 229.0),
              child: const Text(
                'Imagem de Perfil',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontFamily: 'Open Sans',
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 0.0,
                ),
              ),
            ),
            Center(
              child: _buildProfileImage(), //Widget para escolher foto
            ),
            buildTextFieldWithLabel('Nome', 'Nome'),  // Widget para criar um campo de texto comum com um rótulo 
            buildTextFieldWithLabel('Bio', 'Bio'),  // Widget para criar um campo de texto comum com um rótulo 
            buildTextFieldWithLabel('Localização', 'Localização'),  // Widget para criar um campo de texto comum com um rótulo 
            buildTextFieldWithLabel(
                'Administração Geral', 'Administração Geral'),  // Widget para criar um campo de texto comum com um rótulo 
            buildTextFieldWithLabel('Moderadores', 'Moderadores'),  // Widget para criar um campo de texto comum com um rótulo 
            Container(
              margin: const EdgeInsets.only(top: 10),
            ),
            const SizedBox(
              height: 40.0,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Moderadores',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  suffixIcon:
                      Icon(Icons.dangerous, color: Colors.red, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  //Widget para escolher foto
  Widget _buildProfileImage() {
    return Stack(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white,
              width: 6.0,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/imagem3.jpg',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          top: 40,
          left: 40,
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 24.0,
          ),
        ),
      ],
    );
  }
}
