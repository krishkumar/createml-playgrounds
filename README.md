## Create ML Playgrounds

Xcode playgrounds to script and automate ML model training, evaluation and prediction.

Written by [krishna](https://magicive.com).

CreateML Playgrounds need OS X Mojave.

Includes examples for [MLImageClassifier](https://developer.apple.com/documentation/createml/mlimageclassifier) and [MLTextClassifier](https://developer.apple.com/documentation/createml/mltextclassifier)

### Playgrounds 

- [Dog Cat Image Classifier](image-classifier.playground)

- [Movie Review Text Sentiment Classifier](movie-review-sentiment-classifier.playground)


### Trained Models

![dog-cat-classifier](images/dog-cat-classifier.png)

- [DogCatClassifier](models/DogCatClassifier.mlmodel)


![fruit-classifier](images/fruit-classifier.png)

- [FruitClassifier](models/FruitClassifier.mlmodel)

![movie-review-sentiment-classifier](images/movie-review-sentiment-classifier.png)

- [movie-review-sentiment-classifier](models/movie-review-sentiment.mlmodel)

![chest-xray-pneumonia-classifier](images/chest-xray-pneumonia-classifier.png)

- [chest-xray-pneumonia-classifier](models/ChestXrayPneumoniaClassifier.mlmodel) 

![flower-classifier](images/flower-classifier.png)

- [flower-classifier](models/FlowerClassifier.mlmodel)

Training Machine - M1 Mac Mini with 16 GB RAM.

### Datasets

- [Chest X-Ray Images (Pneumonia) 5,863 images (Source: Kaggle)][aaef79c3]
- [A dataset with 65 fruits and 43329 images (Source: Kaggle)][dab38c66]
- [Flowers Dataset with 4242 images (Source: Kaggle)][d2561765]
- [movie-review-data training](datasets/train-movie-reviews.zip)
- [movie-review-data test](datasets/test-movie-reviews.zip)
- [dog-cat-data](datasets/dog-cat-data.zip)


### References

- [WWDC 2018 Session 703 - Introducing Create ML][66033728]
- [Create ML : Apple Developer][d8f80357]

  [d8f80357]: https://developer.apple.com/documentation/create_ml "Create ML : Apple Developer"

  [66033728]: https://developer.apple.com/videos/play/wwdc2018/703/ "WWDC 2018 Session 703 - Introducing Create ML"
  [dab38c66]: https://www.kaggle.com/moltean/fruits "A dataset with 65 fruits and 43329 images (Source: Kaggle)"
  [aaef79c3]: https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia "Chest X-Ray Images (Pneumonia) 5,863 images (Source: Kaggle)"
  [d2561765]: https://www.kaggle.com/alxmamaev/flowers-recognition "Flowers Dataset from Kaggle (4242 images)"
