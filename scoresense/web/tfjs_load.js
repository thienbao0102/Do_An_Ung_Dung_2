// import * as tf from '@tensorflow/tfjs';

async function loadModel() {
    const model = await tf.loadGraphModel('model.tflite');
    if(model){
        print("success")
    }
    else{
        print("Fail")
    }
    return model;
}
window.loadModel = loadModel;