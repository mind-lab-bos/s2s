formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s';

 

participant_number = 0;

 

data = readtable('GoldMSI.csv','Delimiter',',','Format',formatSpec);

 

participant_index = 1;

 

for n = 1:height(data)

    if length(strmatch('BEGIN',data{n,34}{1}))>0

        for m = 1:length(dataset)

            if dataset(m).id == str2num(data{n,13}{1})

                participant_index = m;

            end

        end

    end

    if length(strmatch('quantised',data{n,33}{1}))>0

        GoldMSI_index = str2num(data{n,39}{1}(8:end))-3;

        dataset(participant_index).GoldMSI_raw(GoldMSI_index) = str2num(data{n,34}{1});

    end

end

 

for n = 1:length(dataset)

    if length(dataset(n).GoldMSI_raw) > 0

    dataset(n).GoldMSI_raw(21) = 7 - dataset(n).GoldMSI_raw(21);

    dataset(n).GoldMSI_raw(11) = 7 - dataset(n).GoldMSI_raw(11);

    dataset(n).GoldMSI_raw(13) = 7 - dataset(n).GoldMSI_raw(13);

    dataset(n).GoldMSI_raw(23) = 7 - dataset(n).GoldMSI_raw(23);

    dataset(n).GoldMSI_raw(14) = 7 - dataset(n).GoldMSI_raw(14);

    dataset(n).GoldMSI_raw(27) = 7 - dataset(n).GoldMSI_raw(27);

    dataset(n).GoldMSI_raw(17) = 7 - dataset(n).GoldMSI_raw(17);

    dataset(n).GoldMSI_raw(25) = 7 - dataset(n).GoldMSI_raw(25);

    dataset(n).GoldMSI_raw(9) = 7 - dataset(n).GoldMSI_raw(9);

    end

end

 

for n = 1:length(dataset)

    if length(dataset(n).GoldMSI_raw) > 0

        dataset(n).Gold_activeengagement = sum(dataset(n).GoldMSI_raw([1 3 8 15 21 24 28 35 38]))/9;

        dataset(n).Gold_perceptualabilities = sum(dataset(n).GoldMSI_raw([5 6 11 12 13 18 22 23 26]))/9;

        dataset(n).Gold_musicaltraining = sum(dataset(n).GoldMSI_raw([14 27 33 34 36 37]))/6;

        dataset(n).Gold_singingabilities = sum(dataset(n).GoldMSI_raw([4 7 10 17 25 29 30]))/7;

        dataset(n).Gold_emotion = sum(dataset(n).GoldMSI_raw([2 9 16 19 20 31]))/6;

        dataset(n).Gold_musicalsophistication = sum(dataset(n).GoldMSI_raw([1 4 7 10 12 14 15 17 19 23 24 25 27 29 33 34]))/18;

        dataset(n).Gold_catch = dataset(n).GoldMSI_raw(32);

        dataset(n).Gold_total = sum(dataset(n).GoldMSI_raw([1:31 33:end]))/37;

    end

end

