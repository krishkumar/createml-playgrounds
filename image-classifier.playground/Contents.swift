//
//  Created by Krishna Kumar on 6/5/18.
//  Copyright © 2018 Krishna Kumar. All rights reserved.
//
import Cocoa
import CreateML
import CoreML

var str = "Hello, image classifier"

// 1. Unsplash dog-cat images (https://unsplash.com)

// setup training data
let trainSet = URL(fileURLWithPath: "/Users/krishna/Desktop/dog-cat-data/training-data")
let testSet = URL(fileURLWithPath: "/Users/krishna/Desktop//dog-cat-data/testing-data")

// setup classifier

let classifier = try MLImageClassifier(trainingData: .labeledDirectories(at: trainSet))
let trainingErrorRate = classifier.trainingMetrics.classificationError * 100
let validationErrorRate = classifier.validationMetrics.classificationError * 100

// evaluate
let evaluationMetrics = classifier.evaluation(on: .labeledDirectories(at: testSet))
let errorRate = evaluationMetrics.classificationError * 100

// write model
let metadata = MLModelMetadata(author: "Krishna Kumar", shortDescription: "Machine Learning Model for predicting dog and cat images", version: "1.0.0")
try classifier.write(to: URL(fileURLWithPath: "/Users/krishna/Desktop/DogCatClassifier.mlmodel"), metadata: metadata)

// test predictions
let prediction = try classifier.prediction(from: URL(fileURLWithPath: "/Users/krishna/Desktop/insert-your-image-here.jpg"))
print(prediction)

// Other datasets

// 4. Flowers Dataset from Kaggle (https://www.kaggle.com/alxmamaev/flowers-recognition/version/1)

// 3. Chest X-Ray Images (Pneumonia) Dataset from Kaggle (https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia)

// 2. Fruits 360 Dataset from Kaggle (https://www.kaggle.com/moltean/fruits)

// 1. Unsplash dog-cat images (https://unsplash.com)

