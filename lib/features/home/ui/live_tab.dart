part of 'home_page.dart';

bool isInRoom = false;

class LiveTab extends StatefulWidget {
  @override
  _LiveTabState createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> with AutomaticKeepAliveClientMixin {
  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: AppConfig.admobKey,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('BannerAd onAdClosed.'),
      ),
    );

    return banner.load();
  }

  @override
  void dispose() {
    _anchoredBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var s = S.of(context);
    List<Room> rooms = [
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 9),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 6),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
    ];
    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              if (!_loadingAnchoredBanner) {
                _loadingAnchoredBanner = true;
                _createAnchoredBanner(context);
              }
              return ListView.builder(
                itemCount: rooms.length + 1,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 160),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    if (_anchoredBanner != null)
                      return Container(
                        width: _anchoredBanner!.size.width.toDouble(),
                        height: _anchoredBanner!.size.height.toDouble(),
                        child: AdWidget(ad: _anchoredBanner!),
                      );
                    return Container();
                  } else
                    return OpenContainer(
                      openColor: theme.scaffoldBackgroundColor,
                      closedColor: theme.scaffoldBackgroundColor,
                      closedElevation: 0,
                      onClosed: (bool? value) {
                        setState(() {
                          isInRoom = value ?? true;
                        });
                      },
                      openBuilder:
                          (context, Function({bool? returnValue}) action) =>
                              RoomDetailsPage(
                        rooms[index - 1],
                        onLeaveTap: () => action(returnValue: false),
                      ),
                      closedBuilder: (context, action) =>
                          RoomCard(rooms[index - 1], index - 1),
                    );
                },
              );
            },
          ),
          InRoomWidget(onLeaveTap),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: isInRoom ? 80 : 0),
        child: FloatingActionButton.extended(
          onPressed: () => Sheet.openFrosted(
              context,
              StartARoomSheet(rooms.first, () {
                Navigator.pop(context);
                onLeaveTap();
              })),
          icon: Icon(Icons.add),
          label: Text(S.of(context).start_a_room),
          backgroundColor: theme.primaryColor,
          foregroundColor: theme.accentColor,
        ),
      ),
    );
  }

  void onLeaveTap() {
    setState(() {
      isInRoom = false;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
