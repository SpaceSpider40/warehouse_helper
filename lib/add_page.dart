import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_input/image_input.dart';
import 'package:warehouse_helper/entities/note.dart';
import 'package:warehouse_helper/image_utils.dart';
import 'package:warehouse_helper/note_database.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    print(NoteDatabase.instance.findNotes());

    return _AddPage();
  }
}

class _AddPage extends State<AddPage> {
  String _title = '';
  String _part = '';
  String _warehouse = '';

  final List<XFile> _images = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: ImageInput(
                  images: _images,
                  onImageSelected: (image) {
                    setState(() {
                      _images.add(image);
                    });
                  },
                  onImageRemoved: (image, index) {
                    setState(() {
                      _images.remove(image);
                    });
                  },
                  allowMaxImage: 1,
                  allowEdit: true,
                  imageSize: const Size(400, 400),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Title", border: OutlineInputBorder()),
                  onChanged: (String value) {
                    setState(() {
                      _title = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Part", border: OutlineInputBorder()),
                  onChanged: (String value) {
                    setState(() {
                      _part = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Warehouse", border: OutlineInputBorder()),
                  onChanged: (String value) {
                    setState(() {
                      _warehouse = value;
                    });
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: OutlinedButton(
                    onPressed: () {
                      String imagePath = '';
                      if (_images.isNotEmpty) {
                        ImageUtils.saveFile(_images[0]);
                        imagePath = ImageUtils.getSavePath(_images[0]);
                      }

                      Note note = Note(
                          id: null,
                          title: _title,
                          part: _part,
                          warehouse: _warehouse,
                          img: imagePath
                      );

                      //todo:remove
                      print(note);

                      NoteDatabase.instance.insertNote(note);
                    },
                    child: const Text("Save"),
                  )),
            ],
          ),
        )),
      );
}
