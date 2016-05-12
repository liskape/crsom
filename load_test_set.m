problem = 'hot_or_not3c_smallest';

    data = importdata(strcat(problem, '-tin'));
    
    test_ids = data.textdata;
    innnn = data.data;
    
    test_in = mapminmax(innnn', 0, 0.5);
    test_ta = importdata(strcat(problem, '-tta'))';
    