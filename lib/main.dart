import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// Fazer app das pessoas que tu admira
//TODO: Oi gau, fiz um aplicativo seu, te adimiro muito e nao conseguiria expressar de outra forma
// Posso mandar aqui? Chama Gaules - A Tribo
//Possso mandar o link? Chama Gaules - A Tribo : http: Playstore
//

//TODO: Tema esportista, nipe nba, nike

//TODO: Playlist musica
//TODO: Json de noticias
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (_) => 'Gaules - A Tribo',
      title: 'Gaules - A Tribo',
      // darkTheme: true,
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = PageController();

  int idx = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final pg = _controller.page?.toInt() ?? 0;
      setState(() {
        idx = pg;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = PageView(
      controller: _controller,
      children: [
        GaulesScreen(),
        NovidadesScreen(),
        MotivacionalScreen(),
        FaqScreen(),
      ],
    );

    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: idx,
        onTap: (i) => _controller.jumpToPage(i),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Gaules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Novidades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Motivar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'FAQ',
          ),
        ],
      ),
    );
  }
}

final newsList = [
  {
    "title": "Hoje tem NBA!",
    "subtitle": "Nets VS Bucks",
    "url": "https://www.twitch.tv/gaules"
  },
  {
    "title": "Sorteio do mês (Encerrado)",
    "subtitle": "Concorra a um Pc no valor de R\$5000",
    "url": "https://gleam.io/pBZ54/sorteio-pc-gamer-no-valor-de-r-500000-junho"
  },
  {
    "title": "Hoje tem CS!",
    "subtitle": "G2 vs BIG BLAST Premier",
    "url": "https://www.twitch.tv/gaules"
  },
  {
    "title": "Ta rolando patetada!",
    "subtitle": "Vem pra live!",
    "url": "https://www.twitch.tv/gaules"
  },
  {
    "title": "Ta rolando patetada!",
    "subtitle": "Vem pra live!",
    "url": "https://www.twitch.tv/gaules"
  },
  {
    "title": "Perdeu algum momento da live?",
    "subtitle": "Assista os cortes",
    "url": "https://www.youtube.com/channel/UCSt_yx4dkoOhLS99--5nz6Q"
  },
  {
    "title": "Perdeu algum episodio da live?",
    "subtitle": "Assista a gravacao da live",
    "url": "https://www.youtube.com/channel/UCNuCod6hyIb_tzBL0Yeb7qg"
  },

];

class News {
  String title;
  String subtitle;
  String url;
  News({
    required this.title,
    required this.subtitle,
    required this.url,
  });




  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'url': url,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      title: map['title'],
      subtitle: map['subtitle'],
      url: map['url'],
    );
  }

}

class NovidadesScreen extends StatefulWidget {
  const NovidadesScreen({Key? key}) : super(key: key);

  @override
  _NovidadesScreenState createState() => _NovidadesScreenState();
}

class _NovidadesScreenState extends State<NovidadesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (c, i) {
          final map = newsList[i];
          final n = News.fromMap(map);
          return ListTile(
            onTap: (){
              launch(n.url);
            },
          title: Text(n.title),
          subtitle: Text(n.subtitle),
          trailing: Icon(Icons.arrow_forward_ios),
        );
        },
      ),
    );
  }
}

class GaulesScreen extends StatefulWidget {
  const GaulesScreen({Key? key}) : super(key: key);

  @override
  _GaulesScreenState createState() => _GaulesScreenState();
}

class _GaulesScreenState extends State<GaulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/gau.png',
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 56, right: 12),
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 360,
              child: Text(
                '''
            Mais um guerreiro da Maior Tribo do Mundo!
            
            Atuei como jogador profissional de CS por quase uma década, fui o primeiro treinador a ser campeão do mundo em 2007 com o MIBR.
            
            Acertei um pouco, errei muito, ganhei bastante coisa e tbm perdi demais!
            
            Atualmente faço live todos os dias aqui na Twitch!
            ''',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MotivacionalScreen extends StatefulWidget {
  const MotivacionalScreen({Key? key}) : super(key: key);

  @override
  _MotivacionalScreenState createState() => _MotivacionalScreenState();
}

final videoUrlIdList = [
  [
    'Não tenha medo',
    '8gRcWnhrzKU',
  ],
  [
    'A VIDA É BELA!',
    'bFtezA1_iEA',
  ],
  [
    'COMO SUPERAR A INSEGURANÇA',
    'qXHfdScWjgA',
  ],
  [
    'RESILIENCIA',
    'VUVzSuyJAXA',
  ],
  [
    'O PODER DO AGORA',
    'fDVUWDqcy-8',
  ],
  [
    'Se transforme',
    'rqXvju80QTc',
  ],
];

//TODO: Lista de videos do gau

class _MotivacionalScreenState extends State<MotivacionalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motivacional'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: videoUrlIdList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      launch(
                          'https://www.youtube.com/watch?v=${videoUrlIdList[index][1]}');
                    },
                    child: Container(
                      height: 96,
                      child: Image.network(
                        'https://img.youtube.com/vi/${videoUrlIdList[index][1]}/0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Text(
                    videoUrlIdList[index][0],
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.headline6,
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            ExpansionTile(
              title: Text('Hey Google! Quem é gaulês?'),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(
                    'Alexandre Borba Chiqueta, mais conhecido como Gaules, é um streamer, youtuber, filantropo e ex-jogador profissional de Counter-Strike brasileiro. Ele começou sua carreira profissional na g3nerationX em 2001, quando a equipe foi para a final da World Cyber Games',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Me mostre mais'),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Assista esse podcast : '),
                      customIconButton(
                          FontAwesomeIcons.youtube,
                          'https://www.youtube.com/watch?v=vStgnVQtyeA',
                          Colors.red),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Playlist dos Portões'),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customIconButton(
                        FontAwesomeIcons.youtube,
                        'https://www.youtube.com/playlist?list=PLQYRa2F_C1pAy6qVgT78R-I07KOTnhWWk',
                        Colors.red,
                      ),
                      customIconButton(
                        FontAwesomeIcons.spotify,
                        'https://open.spotify.com/playlist/1ZUByJbjixJFIkyU5HJ91y?si=gziD9mmSSzCtuEb6WAHcBg',
                        Colors.green,
                      )
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text('Siga o gau nas redes sociais'),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customIconButton(
                          FontAwesomeIcons.twitch,
                          'https://www.twitch.tv/gaules',
                          Colors.deepPurple,
                        ),
                        customIconButton(FontAwesomeIcons.youtube,
                            'https://www.youtube.com/c/Gaules/', Colors.red),
                        customIconButton(
                          FontAwesomeIcons.instagram,
                          'https://www.instagram.com/gaules/',
                          Colors.purple[400]!,
                        ),
                        customIconButton(
                            FontAwesomeIcons.twitter,
                            'https://twitter.com/Gaules?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',
                            Colors.lightBlue),
                        customIconButton(
                            FontAwesomeIcons.facebook,
                            'https://www.facebook.com/gaules',
                            Colors.blue[500]!),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconButton customIconButton(IconData icon, String url, Color color) {
    return IconButton(
      onPressed: () {
        launch(url);
      },
      icon: FaIcon(
        icon,
        color: color,
      ),
    );
  }
}
/*
 '''
Mais um guerreiro da Maior Tribo do Mundo!
Atuei como jogador profissional de CS por quase uma década,
fui o primeiro treinador a ser campeão do mundo em 2007 com o MIBR.
Acertei um pouco, errei muito, ganhei bastante coisa e tbm perdi demais!
Atualmente faço live todos os dias aqui na Twitch!
''',
*/