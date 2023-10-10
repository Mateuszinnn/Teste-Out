import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {
  final String tweetText;
  const TweetCard({Key? key, required this.tweetText}) : super(key: key);
  
  @override
  //Widget para criacao de Tweet
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top:10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //foto do usuario
          CircleAvatar(
            radius: 22,
            backgroundImage: Image.asset('assets/images/imagem2.jpg').image,
          ),
          const SizedBox(
            width: 8,
          ),
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
                  //linha que contem o nome do usuario, icone de verificado, tag, dia da postagem e icone de seta para baixo
                  const Row(
                    children: [
                      Text(
                        'Cidade ADM de MG',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.verified,
                        color:Color(0xFFFFB800),
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '@cidadeadm',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                         '• 12 dias',
                         style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.0,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  //texto do tweet
                  Text(
                    tweetText,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  //linha q contem o icone de comentarios e qtd de comentarios
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.mode_comment_outlined,
                        color: Color(0xFF868686),
                       size: 20.0,
                      ),
                      Text(
                        '0',
                        style: TextStyle(color: Colors.grey, fontSize: 15),               
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

