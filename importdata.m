function [SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile(filename, dataLines)
%The purpose of this function allows data to be imported from a text file.    
    if nargin < 2
        dataLines = [2, Inf];
    end

opts = delimitedTextImportOptions("NumVariables", 7);
opts.DataLines = dataLines;
opts.Delimiter = ",";
opts.VariableNames = ["SubjectID", "Age", "Gender", "Weight", "Day1", "Day2", "Day3"];
opts.VariableTypes = ["string", "double", "categorical", "double", "double", "double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts = setvaropts(opts, "SubjectID", "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["SubjectID", "Gender"], "EmptyFieldRule", "auto");
isok_data_6803 = readtable(filename, opts);

%These denote each measured variable and their associated
%column vector heading.
    SubjectID = isok_data_6803.SubjectID;
    Age = isok_data_6803.Age;
    Gender = isok_data_6803.Gender;
    Weight = isok_data_6803.Weight;
    Day1 = isok_data_6803.Day1;
    Day2 = isok_data_6803.Day2;
    Day3 = isok_data_6803.Day3;
end