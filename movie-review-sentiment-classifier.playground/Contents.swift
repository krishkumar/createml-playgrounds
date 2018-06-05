//
//  Created by Krishna Kumar on 6/5/18.
//  Copyright © 2018 Krishna Kumar. All rights reserved.
//
import Cocoa
import CreateML
import Foundation
import CoreML

var str = "Hello, sentiment classifier"

// This movie_review_sentiment_1 class was automatically generated with Xcode.

/// Model Prediction Input Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class movie_review_sentiment_1Input : MLFeatureProvider {

    /// Input text as string value
    var text: String

    var featureNames: Set<String> {
        get {
            return ["text"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "text") {
            return MLFeatureValue(string: text)
        }
        return nil
    }
    
    init(text: String) {
        self.text = text
    }
}

/// Model Prediction Output Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class movie_review_sentiment_1Output : MLFeatureProvider {

    /// Source provided by CoreML

    private let provider : MLFeatureProvider


    /// Text label as string value
    lazy var label: String = {
        [unowned self] in return self.provider.featureValue(for: "label")!.stringValue
    }()

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(label: String) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["label" : MLFeatureValue(string: label)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class movie_review_sentiment_1 {
    var model: MLModel

    /**
        Construct a model with explicit path to mlmodel file
        - parameters:
           - url: the file url of the model
           - throws: an NSError object that describes the problem
    */
    init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }

    /// Construct a model that automatically loads the model from the app's bundle
    convenience init() {
        let bundle = Bundle(for: movie_review_sentiment_1.self)
        let assetPath = bundle.url(forResource: "movie_review_sentiment_1", withExtension:"mlmodelc")
        try! self.init(contentsOf: assetPath!)
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as movie_review_sentiment_1Input
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as movie_review_sentiment_1Output
    */
    func prediction(input: movie_review_sentiment_1Input) throws -> movie_review_sentiment_1Output {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as movie_review_sentiment_1Input
           - options: prediction options
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as movie_review_sentiment_1Output
    */
    func prediction(input: movie_review_sentiment_1Input, options: MLPredictionOptions) throws -> movie_review_sentiment_1Output {
        let outFeatures = try model.prediction(from: input, options:options)
        return movie_review_sentiment_1Output(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface
        - parameters:
            - text: Input text as string value
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as movie_review_sentiment_1Output
    */
    func prediction(text: String) throws -> movie_review_sentiment_1Output {
        let input_ = movie_review_sentiment_1Input(text: text)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface
        - parameters:
           - inputs: the inputs to the prediction as [movie_review_sentiment_1Input]
           - options: prediction options
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as [movie_review_sentiment_1Output]
    */
    func predictions(inputs: [movie_review_sentiment_1Input], options: MLPredictionOptions) throws -> [movie_review_sentiment_1Output] {
        if #available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *) {
            let batchIn = MLArrayBatchProvider(array: inputs)
            let batchOut = try model.predictions(from: batchIn, options: options)
            var results : [movie_review_sentiment_1Output] = []
            results.reserveCapacity(inputs.count)
            for i in 0..<batchOut.count {
                let outProvider = batchOut.features(at: i)
                let result =  movie_review_sentiment_1Output(features: outProvider)
                results.append(result)
            }
            return results
        } else {
            var results : [movie_review_sentiment_1Output] = []
            results.reserveCapacity(inputs.count)
            for input in inputs {
                let result = try self.prediction(input: input, options: options)
                results.append(result)
            }
            return results
        }
    }
}
// End of generated movie_review_sentiment_1 class.

// setup training data
let trainSet = URL(fileURLWithPath: "/Users/krishna/Desktop/txt_sentoken")
let testSet = URL(fileURLWithPath: "/Users/krishna/Desktop/test")

// setup classifier
let classifier = try MLTextClassifier(trainingData: .labeledDirectories(at: trainSet))
let trainingErrorRate = classifier.trainingMetrics.classificationError * 100
let validationErrorRate = classifier.validationMetrics.classificationError * 100

// evaluate
let evaluationMetrics = classifier.evaluation(on: .labeledDirectories(at: testSet))
let errorRate = evaluationMetrics.classificationError * 100

// write model
let metadata = MLModelMetadata(author: "Krishna Kumar", shortDescription: "Machine Learning Model for predicting movie review sentiments", version: "1.0.0")
try classifier.write(to: URL(fileURLWithPath: "/Users/krishna/Desktop/movie-review-sentiment.mlmodel"), metadata: metadata)

// test predictions
let modelURL = URL(fileURLWithPath: "/Users/krishna/Desktop/movie-review-sentiment.mlmodel")
let compiledModelURL = try MLModel.compileModel(at: modelURL)
let classifier2 = try movie_review_sentiment_1(contentsOf: compiledModelURL)
let prediction = try classifier2.prediction(text: "This movie sucks")
let prediction2 = try classifier2.prediction(text: "Nice ending")
print(prediction.label)
print(prediction2.label)



