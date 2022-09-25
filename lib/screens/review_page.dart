import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/models/review_page_args.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:cinegraw_app/utility/ratingInputFormatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ProfileApp _profileApp = ProfileApp();
  final _reviewController = TextEditingController();
  final _ratingController = TextEditingController();
  String? reviewId;
  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final reviewPageArgs =
        ModalRoute.of(context)!.settings.arguments as ReviewPageArgs;
    if (reviewPageArgs.review != null) {
      _reviewController.text = reviewPageArgs.review!.review;
      _ratingController.text = reviewPageArgs.review!.rating.toString();
      reviewId = reviewPageArgs.review!.reviewId;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2, color: colorAppbar)),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Sua nota:',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _ratingController,
                          maxLength: 2,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            RatingInputFormatter()
                          ],
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 30,
                    minLines: 1,
                    maxLength: 512,
                    controller: _reviewController,
                    decoration: InputDecoration(
                      hintText: 'Escreva sua review',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _profileApp
                      .reviewFilm(
                          reviewPageArgs.filmId,
                          reviewPageArgs.filmName,
                          _reviewController.text.trim(),
                          int.parse(_ratingController.text),
                          reviewId)
                      .whenComplete((() => _gotoReturn(context)));
                },
                child: Text("Enviar"))
          ],
        ),
      ),
    );
  }
}
