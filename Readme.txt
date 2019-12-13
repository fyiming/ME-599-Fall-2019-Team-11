Task 1

How it works:

1. Open and run 'trian.m', this code takes the bbox value and crop the training images into 224x224 size image of boxed vehicles
2. Create a folder named 'store' with subfolders '0','1','2','3' in it
3. Open and run 'Trainingloadwithinrange.m', this code will place corpped images into the sub-folders created above based on the classes information stored in bbox
4. Open and run 'TrainClassifier.m', this code will generate a VGG19 based deep learning model that could classify images into 0-3 categories
5. Open and run 'YoloTraining.m', this code will generate a resnet50 based YOLO detector that could detect and box vehicles that appears in the image
6. Open and run 'Detectortest.m', this code will use the trained model in step 5 to detect the vehicles in testing image and store the bbox of detected bbox into a table named 'results'
7. Open and run 'cropimage.m', this code will crop the testing image based on bbox obtained in step 6 and save the cropped image into folder named 'cropped_test_image_VGGYOLO'
8. Open and run 'TestImagesLoad.m', this code will load the route of cropped testing image under created in step 7
9. Open and run 'Finalresult.m', this code will assign labels for testing image using the classifier generated in step 4
10. Open and run 'formatVGG.m', this code will format the result obtained in step 9 and create a csv file for submission of Task 1

That's it.

Task 2:

How it works:

1. Open and run 'ObtainDATA.mlx', this code will pick up the 800 images that were selected as testing data for task 2
2. Open and run 'store_testingimg.m', this code will store the selected testing image in the current path
3. Open and run 'task2.m', this coded will compute r and theta for the car in each test image
4. Copy and paste the result of step 3 into submission file provided as template on Kaggle