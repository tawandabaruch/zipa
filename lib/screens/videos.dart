import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music_app/widgets/widgets.dart';

class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Icon(
              MaterialCommunityIcons.z_wave,
              size: 32,
              color: Colors.orange,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  AntDesign.search1,
                  color: Colors.white,
                ),
                onPressed: () => _searchFocusNode.requestFocus(),
              ),
              IconButton(
                icon: Icon(
                  AntDesign.shoppingcart,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            behavior: HitTestBehavior.translucent,
            child: Stack(
              children: [
                SafeArea(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeadline(),
                        Search(
                          focusNode: _searchFocusNode,
                        ),
                        _buildGenres(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: GlassBottomPanel(
              showCurrentPlay: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenres() {
    return Expanded(
      child: PageBar(
        tabs: [
          'Commercial',
          'Free license',
        ],
        itemBuilder: (context, index) {
          return GridView.count(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 24,
              bottom: 240,
            ),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              GenreItem(
                label: 'Trending',
                image: AssetImage('assets/images/Trending.jpg'),
              ),
              GenreItem(
                label: 'Hip hop',
                image: AssetImage('assets/images/HipHop.jpg'),
              ),
              GenreItem(
                label: 'Dancehall',
                image: AssetImage('assets/images/Dancehall.jpg'),
              ),
              GenreItem(
                label: 'RnB',
                image: AssetImage('assets/images/RnB.jpg'),
              ),
              GenreItem(
                label: 'Museve',
                image: AssetImage('assets/images/museve.jpg'),
              ),
              GenreItem(
                label: 'House',
                image: AssetImage('assets/images/house.jpg'),
              ),
              GenreItem(
                label: 'Rhumba',
                image: AssetImage('assets/images/Rhumba.jpg'),
              ),
              GenreItem(
                label: 'Techno',
                image: AssetImage('assets/images/techno.jpg'),
              ),
              GenreItem(
                label: 'Gospel',
                image: AssetImage('assets/images/Gospel.jpg'),
              ),
              GenreItem(
                label: 'Native',
                image: AssetImage('assets/images/native.jpg'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeadline() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 16,
      ),
      child: Text(
        'Find the best videos\nin Zimbabwe',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 32,
          color: Colors.white70,
        ),
      ),
    );
  }
}

