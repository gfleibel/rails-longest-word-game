# README
If you watch French TV, you may have stumbled upon Des chiffres et des lettres. One of the many equivalent programs in English is Countdown!

In this game: 
You are given a random set of letters.
You have to enter the longest english word you can find using only letters in the grid.
After typing your answer, you get your score and eventually an error message if you failed.

In this game I use a web-API and parse JSON data returned by this API!

Constraints:

I use the Wagon Dictionary API. 
The grid must be a random grid where it's possible to embed the same characters multiple times.
If the word is not valid or is not in the grid, the score will be 0 (and should be accompanied by a message to the player explaining why they didn't score any points).
The score depends on the length of the word you submit. The longer the word, the better the score!
