// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultra Meme Soundboard',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'meme',
      ),
      home: const MyHomePage(title: 'Ultra Meme Soundboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> audioFiles = [
    'andrew-tate-breath-air.mp3',
    'andrew-tate-what-color-is-your-bugatti.mp3',
    'android-sound-effect-meme_tcbuori.mp3',
    'aughhhhh-aughhhhh.mp3',
    'barrachatdrop-f.mp3',
    'Bing-Chilling.mp3',
    'british-quandale-dingle.mp3',
    'Cant-Touch-This.mp3',
    'ceeday-huh-sound-effect.mp3',
    'censor-beep-1.mp3',
    'chase_QnUxJTk.mp3',
    'Click_Me.mp3',
    'Credits.mp3',
    'dank-meme-compilation-volume-17_cutted.mp3',
    'deez-nuts-got-eem-original-vine-mp3cut.mp3',
    'Default-Dance.mp3',
    'deja-vu.mp3',
    'ding-sound-effect_2.mp3',
    'directed-by-robert-b_voI2Z4T.mp3',
    'dj-airhorn-sound-effect-kingbeatz_1.mp3',
    'emotional-damage_svaNMfN.mp3',
    'erro.mp3',
    'fake-raze-ult-enemy.mp3',
    'Fart-With-Reverb.mp3',
    'fbi-open-up-sfx.mp3',
    'g-e-t-n-o-o-b.mp3',
    'galaxy-brain-meme.mp3',
    'gigachad-theme-music.mp3',
    'giornos-theme-but-only-the-best-part-is-in_vwd15lya_lyb0-online-audio-converter.mp3',
    'goofy-ahh-sounds.mp3',
    'haram-andrew-tate_1iFyjoS.mp3',
    'hello-its-john-cena.mp3',
    'i-fart-in-your-general-direction.mp3',
    'indian-music-mp3cut.mp3',
    'ishowspeed-barks.mp3',
    'keyboard-typing-sound-effect.mp3',
    'lightskin-rizz-sin-city.mp3',
    'loud-bing-chilling.mp3',
    'loud-version_7n1qEm2.mp3',
    'mcdonalds-beeping-sound.mp3',
    'mikejebait-3.mp3',
    'mlg-airhorn.mp3',
    'NAH-Bro.mp3',
    'nooo.mp3',
    'nut_ZKo5FA9.mp3',
    'oh-no-no-no-tik-tok-song-sound-effect.mp3',
    'Outro-Song.mp3',
    'p-hub-intro.mp3',
    'punch-gaming-sound-effect-hd_RzlG1GE.mp3',
    'quandale-dingle-arrested.mp3',
    'quandale-dingle-best-version.mp3',
    'quandale-dingle-pt-1.mp3',
    'Rehehehe.mp3',
    'rick-ross-gruntmp3.mp3',
    'roblox-death-sound_1.mp3',
    'Romance.mp3',
    'run-that-back-marski.mp3',
    'run-vine-sound-effect.mp3',
    'Sad.mp3',
    'Send_To_Jesus.mp3',
    'sigma-male-grindset.mp3',
    'so-long-gay-bowser-mario-smg4.mp3',
    'spiderman-meme-song.mp3',
    'Swag-Like-Ohio.mp3',
    'Taco-Bell-Bong.mp3',
    'tactical-nuke.mp3',
    'Take-Off.mp3',
    'the-simpsons-nelsons-haha.mp3',
    'tyler-fkin-1-machine-gun_1.mp3',
    'untitled_1071.mp3',
    'untitled_3.mp3',
    'video0-online-audio-converter_L0R7wUM.mp3',
    'video0_k03U0Iy.mp3',
    'Vine-Boom.mp3',
    'windows-95 (1).mp3',
    'Windows-XP.mp3',
    'y2mate-mp3cut_sRzY6rh.mp3',
    'yt1s_nijLeKo.mp3',
  ];
  final BannerAd myBanner = BannerAd(
    adUnitId: 'redacted',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );
  AudioPlayer player = AudioPlayer();
  late int count;

  void playSound(int index) {
    player.play(AssetSource(audioFiles[index]));
  }

  void stopSound() {
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: stopSound,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://wallpapercave.com/wp/3CEN5jA.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                  children: List.generate(
                (audioFiles.length / 25).ceil(),
                (pageIndex) {
                  return GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(77, (index) {
                        print("\n idk");
                        int audioIndex = pageIndex * 25 + index + 1;
                        if (audioIndex >= audioFiles.length) {
                          return const Text("MEME OVER!");
                        }
                        return OutlinedButton(
                          onPressed: () {
                            playSound(audioIndex);
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: Text(audioFiles[audioIndex]
                              .split('.')[0]
                              .replaceAll('-', ' ')
                              .replaceAll('_', ' ')),
                        );
                      }));
                  //put
                },
              )),
            ),
            Container(
              alignment: Alignment.center,
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
              child: adWidget,
            )
          ],
        ),
      ),
    );
  }
}
