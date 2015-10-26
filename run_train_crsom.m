load iris_dataset;
[som, cn, errors] = crsomtrain(irisInputs, irisTargets);
somplots(som, irisInputs, vec2ind(irisTargets), errors);