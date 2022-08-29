# Neural-Network-SVM

### Input data:
```
load fisheriris     % Load data
data = meas(1:100,1:2);
group = species(1:100); % lable of classes
```

note: Fisher's iris data consists of measurements on the sepal length, sepal width, petal length, and petal width for 150 iris specimens. There are 50 specimens from each of three species.

### Train network:
```
svmStruct = svmtrain(data,group,'showplot',true); % train network
```

### Crossvalidation:
```
[train, test] = crossvalind('holdOut',group);
cp = classperf(group);
```

### test network:
```
classes= svmclassify(svmStruct,data(test,:),'showplot',false);
```

### Evaluate performance of classifier:
```
classperf(cp,classes,test);
CorrectRate=cp.CorrectRate;
ErrorRate=cp.ErrorRate;
```

![image](https://user-images.githubusercontent.com/21992001/187100731-9809e4cc-76c0-4bc7-b5da-febf06f1c78e.png)

![image](https://user-images.githubusercontent.com/21992001/187100744-f34eb1bc-9a58-4957-bb80-f33c84b17322.png)

![image](https://user-images.githubusercontent.com/21992001/187100756-daa9b90c-b82c-4860-b130-629f3c4d1648.png)
