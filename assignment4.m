
%IMPORT DATA
[subID, age, gender, weight, d1, d2, d3] = importfile('isok_data_6803.csv');

%EXECUTE GENDER FUNCTION
 [maleIsoIndMeans,maleGroupIsoMean,femaleIsoIndMeans, femaleGroupIsoMean] = genderIsoCalc(gender,d1,d2,d3);

%EXECUTE DAY FUNCTION
 [day1toDay2,day2toDay3] = dayComparer(subID,d1,d2,d3);

%EXECUTE NORM FUNCTION
 [normDay1mean,normDay2mean,normDay3mean] = daysweightnorm(weight,d1,d2,d3);

 %EXPORT DATA
 %The values in the section identifies which variable has the most rows,
 %then pads every multi-outputted variable with NaN until all have the same
 %length
maxRows = max([size(maleIsoIndMeans,1),size(femaleIsoIndMeans,1),length(day1toDay2), ...
    length(day2toDay3)]);
malePadded = NaN(maxRows,3);
    malePadded(1:size(maleIsoIndMeans,1),:) = maleIsoIndMeans;
femalePadded = NaN(maxRows,3);
    femalePadded(1:size(femaleIsoIndMeans,1),:) = femaleIsoIndMeans;
day1toDay2Padded = NaN(maxRows,1);
    day1toDay2Padded(1:length(day1toDay2)) = day1toDay2;
day2toDay3Padded = NaN(maxRows,1);
    day2toDay3Padded(1:length(day2toDay3)) = day2toDay3;
maleGroupIsoPadded =  NaN(maxRows,1);
    maleGroupIsoPadded(1) = maleGroupIsoMean;
femaleGroupIsoPadded =  NaN(maxRows,1);
    femaleGroupIsoPadded(1) = femaleGroupIsoMean;
normDay1Padded = NaN(maxRows,1);
    normDay1Padded(1)= normDay1mean;
normDay2Padded = NaN(maxRows,1);
    normDay2Padded(1)= normDay2mean;
normDay3Padded = NaN(maxRows,1);
    normDay3Padded(1)= normDay3mean;

%DISPLAY RESULTS
Results = table(malePadded, maleGroupIsoPadded, femalePadded, femaleGroupIsoPadded, ...
        day1toDay2Padded, day2toDay3Padded, normDay1Padded, normDay2Padded, normDay3Padded);
writetable(Results,'iso_results.csv')