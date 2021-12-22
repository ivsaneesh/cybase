import 'package:cached_network_image/cached_network_image.dart';
import 'package:cybase/core/health_model.dart';
import 'package:cybase/core/http_api.dart';
import 'package:cybase/core/string_extension.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  bool _isLoading = true;
  late HealthModel _healthModel;

  bool _readMore = false;

  @override
  void initState() {
    _isLoading = true;
    _getHealthData();

    super.initState();
  }

  _getHealthData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      _healthModel = HealthModel();
      HttpApi api = HttpApi();
      _healthModel = await api.healthTipApi();

      print("_healthModel >>> ${_healthModel.error}");
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
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        automaticallyImplyLeading: true,
        title: const Text(
          "Health Tips",
          style: TextStyle(color: Colors.black45, fontSize: 15),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              )),
        ],
      ),
      body:
      _isLoading== true?
          SizedBox():
      Visibility(
          visible: !_isLoading,
          child: ListView.builder(
              itemCount: _healthModel.data![0].tips?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  "${_healthModel.data![0].tips?[index].title}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  _healthModel.data![0].tips?[index].isLiked ==
                                          1
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _healthModel
                                              .data![0].tips?[index].isLiked ==
                                          1
                                      ? Colors.red
                                      : null,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${_healthModel.data![0].tips?[index].image}",
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height / 4.8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            _healthModel.data![0].tips![0].description
                                .toString()
                                .removeP(),
                            maxLines: _readMore ? null :2,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "${_healthModel.data![0].tips?[index].postedOn}",
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 4,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${_healthModel.data![0].tips?[index].readTime}",
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 4,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${_healthModel.data![0].tips?[index].likeCount}",
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 4,
                                  color: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 2, 12, 2),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                    shape: BoxShape.rectangle),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      _readMore = !_readMore;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        _readMore? "Less" :  "Read More",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      Icon(
                                        _readMore ?   Icons.keyboard_arrow_up: Icons.keyboard_arrow_down,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
