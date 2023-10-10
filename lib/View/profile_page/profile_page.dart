import 'package:flutter/material.dart';
import 'package:app/components/bottom_navigator/bottom_navigation.dart';
import 'package:app/components/tweet_card/tweet_card.dart';
import 'package:app/View/editar_perfil/editar_perfil.dart';
import 'package:app/components/secao_sobre/secao_sobre.dart';

class ProfilePage extends StatefulWidget {
  final Function(int) onTabSelected;
  final int currentPageIndex;

  const ProfilePage({
    Key? key,
    required this.currentPageIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;

  final List<String> _tabTitles = ['Atividades', 'Sobre', 'Avisos']; //Opções do carrosel

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabTitles.length,
      initialIndex: _currentIndex,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.asset('assets/images/imagem.jpg', fit: BoxFit.contain), //foto de fundo do perfil
                _buildIconButton(Icons.arrow_back_ios, Alignment.topLeft), //Botão de voltar em cima da foto de perfil
                _buildProfileImage(), //imagem de perfil
              ],
            ),
            _buildProfileInfo(), //informações do perfil
            //Barra de abas
            TabBar(
              tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildAtividadesTab(),
                  Center(
                    child: SingleChildScrollView(
                      child: SecaoSobre(
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigation(), //Bottom navigator
      ),
    );
  }

  // Cria a aba de atividades com tweets.
  Widget _buildAtividadesTab() {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //criacao de tweets
          TweetCard(
            tweetText:
                'Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.',
          ),
          TweetCard(
            tweetText: 'Lorem ipsum dolor sit amet consectetur.',
          ),
          TweetCard(
            tweetText:
                'Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.',
          ),
          TweetCard(
            tweetText:
                'Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.',
          ),
          TweetCard(
            tweetText:
                'Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.',
          ),
        ],
      ),
    );
  }

  // Cria informações de perfil, incluindo nome, descrição, cidade, etc.
  Widget _buildProfileInfo() {
    return Container(
      width: double.infinity,
      height: 150.14,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Stack(
        children: [
          _buildElevatedButton(), //botao de editar sobre
          Positioned(
            top: 60.0,
            left: 16.0,
            child: Row(
              children: [
                //Nome do usuario
                _buildText('Cidade ADM de MG', FontWeight.w700, 23.0, 
                    Alignment.topLeft),
                const SizedBox(width: 8.0),
                const Icon(
                  Icons.verified,
                  color: Color(0xFFFFB800),
                  size: 24.0,
                ),
              ],
            ),
          ),
          Positioned(
            top: 95.0,
            left: 16.0,
            child: Row(
              children: [
                //Texto da bio
                _buildText('Perfil Oficial da Cidade Administrativa de MG',
                    FontWeight.w400, 16.0, Alignment.topLeft),
              ],
            ),
          ),
          Positioned(
            top: 120.0,
            left: 11.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Informacoes complementares
                _buildText('Cidade Administrativa', FontWeight.w400, 12.0,
                    Alignment.topLeft,
                    showLocationIcon: true),
                const SizedBox(width: 8.0),
                _buildText('Entrou em jan/23', FontWeight.w400, 12.0,
                    Alignment.topLeft,
                    showDataIcon: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Cria um botão "Editar Perfil" na parte superior direita.
  Widget _buildElevatedButton() {
    return Positioned(
      top: 10.0,
      right: 10.0,
      child: ElevatedButton(
        onPressed: () {
          // Quando o botão é pressionado, navegue para a página EditarPerfilPage.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditarPerfilPage()),
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
        //texto do botao
        child: const Text(
          'Editar Perfil',
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
    );
  }

  // Cria um texto com opção para exibir ícones de localização e data.
  Widget _buildText(
    String text,
    FontWeight fontWeight,
    double fontSize,
    Alignment alignment, {
    bool showLocationIcon = false,
    bool showDataIcon = false,
  }) {
    return Row(
      children: [
        if (showLocationIcon)
          const Icon(
            Icons.location_on_outlined,
            color: Color(0xFF909094),
            size: 24.0,
          ),
        if (showDataIcon)
          const Icon(
            Icons.calendar_month_outlined,
            color: Color(0xFF909094),
            size: 24.0,
          ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: 0.0,
            color: const Color(0xFF212121),
          ),
        ),
      ],
    );
  }
  
  //Botao de voltar
  Widget _buildIconButton(IconData icon, Alignment alignment) {
    return Positioned(
      top: 55.0,
      left: 20.0,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.white,
          size: 23.0,
        ),
      ),
    );
  }

  // Cria uma imagem de perfil redonda.
  Widget _buildProfileImage() {
    return Positioned(
      top: 130.0,
      left: 25.0,
      child: Container(
        width: 100.14,
        height: 100.14,
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
            'assets/images/imagem2.jpg',
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
