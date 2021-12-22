

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cybase/core/home_model.dart';
import 'package:cybase/core/http_api.dart';
import 'package:cybase/ui/health_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeModel _homeModel;

  bool _isLoading = true;
  late TabController _tabController;

  @override
  void initState() {
    _getHomeData();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _getHomeData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      _homeModel = HomeModel();
      HttpApi api = HttpApi();
      _homeModel = await api.homeApi();

      if (_homeModel.error == false) {}

      print("_homeModel >>> ${_homeModel.error}");
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF5FFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "MedFeed",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              children: [
                Container(
                  width: 32,
                  decoration: const BoxDecoration(
                      color: Colors.black12, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                Positioned(
                  right: 1,
                  top: 2,
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        shape: BoxShape.rectangle),
                    constraints: const BoxConstraints(
                      minWidth: 15,
                      minHeight: 15,
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Visibility(
          visible: !_isLoading,
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              getFullScreenCarousel(context),
              const SizedBox(
                height: 22,
              ),
              _categoryView(),
            ],
          ),
        ),
      ),
    );
  }

  _categoryView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _homeModel.data?.category?.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      "${_homeModel.data?.category?[index].image}",
                    ),
                  )),
              Text(
                "${_homeModel.data?.category?[index].name.toString()}",
                style: const TextStyle(fontSize: 13, color: Colors.black45),
              ),
            ],
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.9,
        ),
      ),
    );
  }

  CarouselSlider getFullScreenCarousel(BuildContext mediaContext) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 3.6,
        aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        scrollPhysics: const BouncingScrollPhysics(),
        viewportFraction: 1.0,
      ),
      items: _homeModel.data?.banner?.map(
        (img) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HealthScreen()));
            },
            child: CachedNetworkImage(
              imageUrl: img.image.toString(),
              fit: BoxFit.fill,
              // width: 1000.0,
            ),
          );
        },
      ).toList(),
    );
  }
}
