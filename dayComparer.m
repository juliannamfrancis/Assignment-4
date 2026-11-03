function [day1toDay2,day2toDay3] = dayComparer(subID,d1,d2,d3)
%The purpose of this function it to call every subject that improved either
%from Day 1 to Day 2, or from Day 2 to Day 3.
    day1toDay2 = [];
    day2toDay3 = [];
for i = 1:length(subID)
        if d2(i)>d1(i)
            day1toDay2 = [day1toDay2; subID(i)];
        end
        if d3(i)>d2(i)
             day2toDay3 = [day2toDay3; subID(i)];
        end
    end
end