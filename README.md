# SVM-Based Classification with MATLAB GUI

This project demonstrates Support Vector Machine (SVM) classification on the classic Fisher Iris dataset using a graphical interface (GUI) in MATLAB. It allows users to test both **linear** and **non-linear** classification approaches with different kernel functions (linear, RBF, and quadratic).

## 📂 Dataset

The **Fisher Iris** dataset includes 150 samples from three iris species (`Setosa`, `Versicolor`, and `Virginica`). There are 50 specimens from each of the three species, each with four features:

- Sepal length
- Sepal width
- Petal length
- Petal width


**Input data:**

Data is loaded via:
```
load fisheriris     % Load data
```


## ⚙️ How It Works
**Training the network:**
```
data = meas(1:100,1:2);        % Select features
group = species(1:100);        % lable of classes
svmStruct = svmtrain(data,group,'showplot',true); % train network
```

**Crossvalidation:**
```
[train, test] = crossvalind('holdOut',group);
cp = classperf(group);
```

**Testing the network:**
```
classes= svmclassify(svmStruct,data(test,:),'showplot',false);
```

**Evaluate performance of classifier:**
```
classperf(cp,classes,test);
CorrectRate=cp.CorrectRate;
ErrorRate=cp.ErrorRate;
```
A message box displays the classification accuracy and error rate after each run.


🖥️ GUI Features
=========

The GUI allows users to perform classification using different parts of the dataset and different kernel functions:

- Setosa vs. Versicolor with features [1, 2] and [3, 4]
- Versicolor vs. Virginica with features [1, 2] and [3, 4]
- Selectable kernels: Linear, Quadratic, and RBF

📊 Sample Results
=========

### **Linear classification:** <br/>
![image](https://user-images.githubusercontent.com/21992001/187100731-9809e4cc-76c0-4bc7-b5da-febf06f1c78e.png)

### **Non-linear classification using RBF kernel:** <br/>
![image](https://user-images.githubusercontent.com/21992001/187100744-f34eb1bc-9a58-4957-bb80-f33c84b17322.png)

### **Non-linear classification using quadratic kernel:** <br/>
![image](https://user-images.githubusercontent.com/21992001/187100756-daa9b90c-b82c-4860-b130-629f3c4d1648.png)


📝 Notes
=========
- Built using MATLAB GUIDE
- Uses svmtrain and svmclassify (available in older versions of MATLAB)
- Educational project for understanding SVM decision boundaries and kernel effects
