// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as youtube;

class CustomDownloadMenu extends StatelessWidget {
  final List<youtube.VideoStreamInfo> videoList;
  CustomDownloadMenu({
    @required this.videoList,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 8, top: 16),
            child: Row(
              children: <Widget> [
                Text("Download", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                Spacer(),
                /*Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.folder, color: Colors.white),
                        onPressed: () {
                          // TODO: SHOW DIALOG TO CHANGE DOWNLOAD FOLDER
                        },
                      ),
                      Text("Default folder", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 16)
                    ],
                  ),
                ),*/
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: SizedBox(height: 1, child: Divider(indent: 16, endIndent: 16)),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text("Audio", style: TextStyle(color: Theme.of(context).textTheme.body1.color)),
                    subtitle: Text("Download the audio from this video at maximum quality"),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Download", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    onTap: () => Navigator.pop(context, ["Audio", "null"]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(height: 1, child: Divider(indent: 16, endIndent: 16)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22, right: MediaQuery.of(context).size.width*0.2),
                  child: ListTile(
                    leading: Icon(Icons.videocam),
                    title: Text("Video", style: TextStyle(color: Theme.of(context).textTheme.body1.color)),
                    subtitle: Text("Download video at selected quality bellow"),
                    onTap: () {},
                  ),
                ),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: videoList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16, left: 32),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Quality: ",
                            style: TextStyle(color: Theme.of(context).textTheme.body1.color, fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            videoList[index].videoResolution.toString() + " " +
                            videoList[index].framerate.toString() + "fps "
                          ),
                          videoList[index].videoQualityLabel.contains(new RegExp(r'HDR'))
                          ? Text(
                            "HDR ", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.redAccent),
                          ) : Container(),
                          Text(
                            (((videoList[index].size)/1024)/1024).toStringAsFixed(2) +
                            "MB", style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(Icons.file_download, color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context, ["Video", index.toString()]);
                            },
                          ),
                          SizedBox(width: 18)
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}