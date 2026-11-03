function [maleIsoIndMeans,maleGroupIsoMean,femaleIsoIndMeans, femaleGroupIsoMean] = genderIsoCalc(gender,d1,d2,d3)
% This function operates to help you find the average of male and female
% performance for each day and as a cumulative averages of days 1-3. Days 1,
% 2, and 3 denoted as d1, d2, and d3, respectively.
    for i=1:length(gender)
        if gender(i) == 'M'
            d1m = mean(d1);
            d2m = mean(d2);
            d3m = mean(d3);
           
        elseif gender(i) == 'F'
            d1f = mean(d1);
            d2f = mean(d2);
            d3f = mean(d3);
           
        end
    end
    maleIsoIndMeans = [d1m,d2m,d3m]
    maleGroupIsoMean = mean(maleIsoIndMeans)
    femaleIsoIndMeans = [d1f,d2f,d3f]
    femaleGroupIsoMean = mean(femaleIsoIndMeans)
end