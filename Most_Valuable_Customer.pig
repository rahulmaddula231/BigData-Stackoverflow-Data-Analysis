file = LOAD 'user.csv' Using PigStorage(',') AS (ID:int, DisplayName:chararray, CreationDate:chararray, lastAccessDate:chararray, Reputation:int, upvote:int, downvote:int, views:int);
generated = FOREACH file GENERATE Reputation, DisplayName;
ordered_value = ORDER generated BY Reputation DESC;
limited = LIMIT ordered_value 100;
dump limited;
STORE limited INTO '/pigresults/most_Valuable_User' USING PigStorage(',');
