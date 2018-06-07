//
//  Created by Krishna Kumar on 6/5/18.
//  Copyright © 2018 Krishna Kumar. All rights reserved.
//
import Cocoa
import CreateMLUI

var str = "Hello, image classifier"

let builder = MLImageClassifierBuilder()
builder.showInLiveView()

// Step 1: Drag and Drop training images
// Step 2: Drag and Drop validation images

// Tested on following datasets

// 3. Chest X-Ray Images (Pneumonia) Dataset from Kaggle (https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia)

// 2. Fruits 360 Dataset from Kaggle (https://www.kaggle.com/moltean/fruits)

// 1. Unsplash dog-cat images (https://unsplash.com)

