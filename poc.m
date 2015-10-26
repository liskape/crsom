function [ output_args ] = poc( )
while 1
    [tf msg] = license('checkout','Statistics_Toolbox');
    if tf==1, break, end
    display(strcat(datestr(now),' waiting for licence '));
    pause(5);
end 

    a = sigmoid(0.2);
    save('a.mat', 'a');
end

