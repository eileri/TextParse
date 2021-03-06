%% Text Parsing
% CLPS 1291 Assignment 3
% Last Updated: February 2016
%% 1. Corpus Statistics
% Background Info: The goal of this assignment is to help you become
% familiar with Matlab I/O functions and to develop skills for parsing
% and processing various data files.

%% 1. a) Loading a Document

% We are providing you with Moby Dick as a text file. In order to calculate
% the frequency of words and letters in Moby Dick, we'll need to parse the
% file (i.e., read the text file into Matlab line-by-line) and store the
% corresponding text as a variable in Matlab. We will then create an array
% that stores the number of times each word and
% letter appears.

%% Define Path
% First, you'll need to specify the file's location on your computer - this
% often ends up being a long string of text. Save this string as a separate
% variable here.

% -- Your code here -- %

% path = 'C:\Users\Eren Can Ileri\Desktop\Parse\MobyDick.txt'; % Change this filepath to wherever 'MobyDick.txt' is
path = 'MobyDick.txt';

%% Create Map
% Now, you'll need to create a data structure to store the word frequencies
% you will be calculating. A "Map" can be used to create an array of data
% with elements that can be accessed using numbers OR character strings.
% This means of indexing is more flexible than arrays you've used
% previously (which required integer indices). For more information on
% Maps, see http://www.mathworks.com/help/matlab/map-containers.html

% Initialize a Map container that will be used to store your calculated
% word frequencies. Think of it as an efficient way to represent words with
% respect to their frequencies. Of course, there are other ways to solve
% this problem in Matlab, but we require you to use Map because it is a
% useful data type we want you to learn about.

% -- Your code here -- %

wordFreqs = containers.Map;

%% Load the document and store the file identifier as a variable.
moby = fopen(path);

%% Read line-by-line
% In order to eventually calculate the word frequency in this document,
% we'll need to read in the data line by line, then separate those lines
% into words, and finally count the number of times each word occurs. We
% will do this by using nested loops. We will later use a  while loop, so
% we need to first get the first line of the text file you just loaded, and
% save that line as an intermediate variable. This variable should be
% updated every time in the loop where you read the new line.

% HINT: Check Mathworks! There is a specific function that reads files
% line-by-line.

line = fgetl(moby);

% Now, you'll need to make several nested loops. Lets think through it step
% by step. NOTE: When typing your code under the "Your code here" headers,
% please keep your code indented, right under the headers! This will help
% keep your nested loops organized and easy to read.

% While there are still lines to be loaded, loop through the text
% line-by-line to load and save each line of text. You should make a call
% to the same function that you used to read the first line of text in the
% previous step!

% -- Your code here -- %

% Let's begin with a while loop that checks the variable we just initialized to see if there
% are more lines of text in the document
while ischar(line) %fill in condition here
    
    % If the current line of text contains a character array (i.e., still
    % contains words), split that line into individual words.
    % HINT: There is a specific function for this! If you're stuck, try
    % using Mathworks to search for a function that splits strings at a
    % delimiter. Then use this in combination with an if statement
     
    %% Insert whitespaces at delimiters
    delimiter = {'    ','. ','\t',',',' ',';','.','-','"','(',')','!','?'};
    line = strtok(line, delimiter);
    
        %% Make Lowercase
        % Convert all of the letters to the same case (i.e., all uppercase 
        % or all lowercase). This will prevent Matlab from double-counting 
        % (ex. considering 'a' and 'A' as two separate letters).
        line = lower(line);

        %% Remove special characters like punctuation marks and dashes.
        %     There are multiple ways to do this, but there is a function
        %     that lets you replace all occurences of something (like
        %     special characters) within a string with something else (like
        %     an empty space). See if you can find it using Mathworks! Note
        %     that after removing special characters, a word can be further
        %     split into multiple words. (e.g. 'duck-like' => 'duck',  'like')
        line = regexprep(line,'[^a-zA-Z]',' ');
        
        %% split line into words at white spaces
        words = strsplit(line);
        
        %%
        % Now that the current word is in a form we can work with, we
        % want to know how many times that word appears in the file.
        % Remember the map container we created earlier? Now is the
        % time to use it! We're essentially going to be adding a bunch
        % of elements to an array, and each element will consist of a
        % "key" and a "value." Here, the "keys" will be each unique
        % word that appears in Moby Dick. For example, "whale" would be
        % stored as the key of an element in your map. The "values"
        % will be the number of times that word appears in Moby Dick.
        % For example, the value corresponding to "whale" might be
        % "1000."
        
        % If the word has NOT appeared previously, we need to add a new
        % entry to our map and assign it a frequency value of 1.
        % Mathworks can show you how to do this! If the word HAS
        % appeared previously, we need to update the frequency value
        % associated with that word. HINT: The frequency should just be
        % the current value + 1.
        
        % -- Your code here -- %
        
        
        % ------------------- %
        
        % Then let's iteratively get the next lines using the same function as
        % above (this should be one line of code)
        line = fgetl(moby);
        
% Remember to end all those loops and conditionals you started earlier!
end

% Remember to close the file (to save memory!).

% -- Your code here -- %



% -------------------- %

% NOTE: This part of the script might take a while to run!
disp('Text Parsing Complete!')

%% 1. b) Determine Top 30 Words and Output as .txt
% Now, we're going to calculate the top 30 most frequently used words in
% Moby Dick! We'll also save this list of words as a .txt file.

% First, you'll need to create a new array using the map you created
% earlier. This new array will store words included in keys.
allWords = keys(wordFreqs);

% Then, you should sort the words in order, based on their frequency
% values. In order for Matlab to execute a sort function, you'll need to
% convert the values saved in your map into a single matrix -- 'cell2mat'
% should do the trick. HINT: There is also a single function that will
% allow you to sort items (like the frequency values assigned to each word)
% in descending order. Use Mathworks if you're stuck! Done correctly, this
% will return an array of the same length as allWords, containing the
% indices of the words in order of highest to lowest frequency. In other
% words, the first entry of this array, let's call it freqInds(1,1) will
% contain the index of the word in allWords that is the most frequent! So
% if freqInds(1,1) = 5. Then we know the most frequent word in MobyDick is
% allWords(1,5).

% -- Your code here -- %


% -------------------- %

% Finally, you should save the top 30 most frequent words (along with their
% frequency values) to a file called 'MobyWordFreqs.txt'.
% Each word and its frequency should be on a different line. These should
% be listed in descending order (i.e., with the MOST frequent word at the
% top of the list).
% For example: Line 1: 1. Whale 100
% Line 2: 2. Boat 99
% etc.

% Make a new file called 'MobyWordFreqs.txt' and save the filename as a variable.
% -- Your code here -- %


% -------------------- %

% Add a descriptive header to your file. Don't forget to end with the
% syntax to create a new line!
% -- Your code here -- %


% -------------------- %

% Now, for words 1-30 in your map, you'll want to get (and save) both the
% word itself, and the frequency associated with that word.
% Once you have those saved, print the line number (1-30), the current word,
% and its frequency, all next to each other. Then start a new line.
% HINT: In order to concatenate these three values, you'll need to make
% sure they are all presented as strings -- use the function 'num2str' for
% this!
% -- Your code here -- %


% -------------------- %

% Again, remember to close the file (to save memory!).
% -- Your code here -- %


% -------------------- %

disp('Output of Top 30 Words Complete')

%% 1. c) Calculate Letter Frequency and Output as .csv
% Let's also save the letter frequency as a file -- this time, we'll save
% it as a .csv file instead of a .txt file.

% So, for each letter within the current word, you'll want to check if that
% letter already exists as a key within your Map. If it does NOT (e.g.,
% you're in the beginning of the 1st chapter and you haven't seen the
% letter 'j' yet), you'll want to add a new key to the Map. Mathworks has a
% good description of how to do this. If it DOES (e.g., it's the second time
% you've seen the letter 'p'), you'll want to update the value already
% assigned to that key. Each time a letter appears, the value assigned to
% it in the map should increase by one. (Basically, the same thing you did
% for word frequency, but now with letters.)

% First, you'll need to make a new map container. This will store all
% letters of the alphabet ("keys") and their associated frequencies
% ("values").
letterFreqs = containers.Map;

% You're going to need to make more nested loops in order to calculate the
% letter frequency. First, you should loop through each word in the array
% of words you created earlier, and save the current word as a variable you
% can work with.
% -- Your code here -- %

% for %add condition here
    
    % -------------------- %
    
    % Calculating the frequency of letters will require about the same
    % steps you used to calculate the frequency of words earlier.
    % Loop through each letter of each word in your word array.
    % If the letter has NOT appeared in the document previously, add a
    % new entry to the map and assign it a frequency value of 1.
    % If the letter HAS appeared previously, update the
    % frequency value associated with that letter.
    
    % -- Your code here -- %
    
    
    % -------------------- %
    
    % Remember to end the outer loop!
% end

% Now that you have the letter frequencies stored, you should export them to
% a .csv file in alphabetical order. The resulting file should contain three
% columns, the first with the letters, the second with their frequencies, the
% third with their frequency (using the % symbol).
% For example:
% Letter  |  Count  |  Percent Total
% A       |  8500   |  9%
% B       |  4000   |  1%
% etc.

% In order to export the letters, create a a cell array to hold the keys and
% values from the map of letter frequencies you created earlier.
% -- Your code here -- %


% -------------------- %

% Make a new file called 'MobyLetterFreq.csv." Give column headers
% 'Letter,' Count,' and 'Percent Total.'
% -- Your code here -- %


% -------------------- %

% Now, loop through each element of your cell array, and assign each column
% a set of values:
% (1) Column 1 ('Letter') should contain a list of letters A-Z.
% (2) Column 2 ('Count') should contain a list of letter frequencies associated
%     with each letter in column 1.
% (3) Column 3 ('Percent Total') should contain the percentage of total
%     letters accounted for by each letter in column 1. You'll need to
%     calculate the percentage of each letter, and then concatenate that
%     value with a % symbol.
%     HINT: In order for this to work properly, you might need to convert
%     the percentage value you calculate to a string.
% (4) Add all of these values to your .csv file!
totalLetters = sum(cell2mat(values(letterFreqs)));
% -- Your code here -- %





% Again, remember to close the file (to save memory!).


% -------------------- %

% Now you can try opening up the data in Excel! It's pretty cool!

disp('Output of Letter Frequencies Complete')
%% 1. d) Letter Frequency Bar Graph
% Now that we have this cool set of data, let's display it as a bar graph!

% Make an empty 1-by-26 matrix for the letter frequency values, and an
% empty 1-by-26 cell array for the letters themselves. You'll need to fill
% these with values to display in your graph.
% -- Your code here -- %


% -------------------- %

% Now, loop through each element of each array, and assign it a value.
% -- Your code here -- %


% -------------------- %

% Now, you can generate a bar graph to display this data. The 26 letters
% should appear as categories on the x axis, and their frequency in Moby
% Dick should appear on the y axis. Make sure that you add a title and axis
% labels to your bar graph!
% Please save this graph to a pdf document called 'results.pdf.'
% -- Your code here -- %


% -------------------- %

% What do you notice about your results? Which letters are the highest? Why?
% Add your response to 'results.pdf.'

%% 2. Word Length vs. Frequency Analysis
% Gryzbek et al (2007) explains that there is an inverse relationship between
% word frequency and length. Their math is quite complicated, but essentially,
% they argue that frequency(w) is proportional to length(word)^x, for some
% negative number, x. This has interesting implications for the English language!
% For example, this suggests that certain form of a word are used more often,
% even when the root word is the same.

% Check your word frequencies and compare "PLAY" vs. "PLAYING". What do you notice?
% Add your response to 'results.pdf.'

% Let's try to replicate this effect (in a simplified manner)!

% First, we need to assign each word to a bin based on its frequency class.
% Create an empty matrix with enough columns to hold all the distinct words
% you stored in your map earlier.

% -- Your code here -- %

% Please call this variable allFreqs
    % allFreqs =   % Bin by frequency class

% -------------------- %

% Next, loop through each element in the empty matrix you just created.
% Assign an item from your map container of words to each of these
% elements. This will align the words with their frequencies.

% -- Your code here -- %


% -------------------- %

% The following bit of code calculates the optimal bin width, so that
% you don't lose any interesting data or have too much noise. The function
% 'histcounts' separates the values into bins based on an automatic binning
% algorithm. If you want to learn more, type 'help histcounts' into your
% command window.
    % bins = histcounts(allFreqs);
    % binWidth = round(max(allFreqs)/length(bins));

% Now that we know how many bins we should have and how wide our bins should
% be, we can bin word lengths by frequency. First, we'll make an empty cell array
% that will eventually store the length of each word within a corresponding
% bin.
    % wordLengthByFreq = cell(1,length(bins));


%%

% Each entry in wordLengthByFreq is a vector containing the lengths
% of all words that fall into one frequency bin. So we'll initializes all
% entries in this array to be an empty matrix because new data will be entered using a
% concatenation operation, which cannot be done if a cell entry is not defined to be a matrix.
    % for i = 1:size(bins,2)
    %     wordLengthByFreq{i} = [];
    % end

% Now, we'll loop through all the words stored in your map container, and bin
% word lengths by frequency. After getting the current word and saving it
% as a usable variable, we'll to store the length of that word within
% the associated bin. This takes a couple of steps. Please do not change this code.
    % for i = 1:size(allWords,2)
    %     curr_word = allWords(1,i);
    %     curr_word = curr_word{1};
    %     bin = floor(wordFreqs(curr_word) / binWidth) + 1;
    %     wordLengthByFreq{bin} = horzcat(wordLengthByFreq{bin},[size(curr_word,2)]);
    % end

%%
% The following code smooths your results. (In other words, it compensates
% for/eliminates noisy data, to output a nicer looking data set). Please
% ensure that you named variables appropriately above. Do not edit this
% block of code!
%
% In wordLengthByFreq, each entry is a vector of the lengths of words
% that fall into each bin of frequency.

% Find mean word length and total frequency per bin
    % meanWordLengths = {};
% Ignore empty buckets to smooth
    % ind = 1;
    % infrequent = []; %bin and exclude all words appearing less than 10 times together to smooth
    % for i = 1:size(wordLengthByFreq,2)
    %     meanLength = mean(wordLengthByFreq{i});
    %     if isnan(meanLength) == 0
    %         if length(wordLengthByFreq{i}) < 10
    %             infrequent = horzcat(infrequent,wordLengthByFreq{i});
    %         else
    %             meanWordLengths{ind} = meanLength;
    %             ind = ind+1;
    %         end
    %         
    %     end
    % end
    % meanWordLengths = cell2mat(meanWordLengths);
%%
% Finally, plot the mean word length within each bin as a function of word
% frequency. Make sure to add a title and label your x and y axes! Have
% your graph start as zero. Remember the word length data is stored in the
% array, meanWordLengths, that we've created for you!

% -- Your code here -- %


% -------------------- %

% What does the graph look like? does it fit the predicted form?
% Add a copy of the graph and your response to results.pdf.

%% Extra Credit
% Project Gutenberg (http://www.gutenberg.org) has made over 50,000 public domain
% texts available for free as ebooks, in many different languages. Using
% texts from this source, show us something interesting! Create a separate
% file called 'extracredit.pdf' with at least one output graph and a
% description of your findings. Some possibilities:
% Compare the same text across multiple languages! Can letter frequency
% help you predict the language of a new text?
% Perform second order statistics on the results you already got.
% Determine how frequently certain letters co-occur (ex., frequency of
% "th" vs. "pl," etc.).
% Anything else you can think of!
