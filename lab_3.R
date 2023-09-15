library(tidyverse)
library(babynames)

# fruit contains the names of 80 fruits.
# words contains 980 common English words.
# sentences contains 720 short sentences.

# regular expressions, a concise and
# powerful language for describing
# patterns within strings.

str_view(fruit, "berry")

str_view(c("a", "ab", "ae", "bd", "ea", "eab"), "a.")

str_view(fruit, "a...e")

### Quantifiers control how many times a pattern can match

# ab? matches an "a", optionally followed by a "b".
str_view(c("a", "ab", "abb"), "ab?")

# ab+ matches an "a", followed by at least one "b". It indicates that 
# the element immediately before it should occur at least once in the 
# input string, but it can appear multiple times consecutively.
str_view(c("a", "ab", "abb"), "ab+")

# * Is similar to + but it allows 0 repeats of the letter preceding it!
str_view(c("a", "ab", "abb"), "ab*")

# Character classes are defined by [] and let you match a set of characters
str_view(words, "[aeiou]x[aeiou]")

# Character classes are defined by [] and let you match a set of characters
# ^ will match everything except letters following ^
str_view(words, "[^aeiou]x[^aeiou]")

# You can use alternation, |, to pick between one or more alternative patterns.
str_view(fruit, "apple|melon|nut")

### str_detect() returns a logical vector that is
# TRUE if the pattern matches an element of
# the character vector and FALSE otherwise:
str_detect(c("a", "b", "c"), "[aeiou]")

names <- babynames |>
    filter(str_detect(name, "x")) |>
    count(name, wt = n, sort = TRUE)

### str_count(): rather than a true or false, it tells you how many 
# matches there are in each string.

# how many P's in each word
x <- c("apple", "banana", "pear")
str_count(x, "p")

# str_replace_all() replaces all matches.

x <- c("apple", "pear", "banana")
# replace vowels with -
str_replace_all(x, "[aeiou]", "-")
# replace consonants with b 
str_replace_all(x, "[^aeiou]", "b")
# removes all vowels from every word
str_remove_all(x, "[aeiou]")

### ESCAPING ###

# In order to match a literal ., you need an escape which
# tells the regular expression to match metacharacters literally.
# ike strings, regexps use the backslash for escaping. So,
# to match a ., you need the regexp \. In order to match a literal ., 
# you need an escape which tells the regular expression to match metacharacters 
# literally. ike strings, regexps use the backslash for escaping. So, to match 
# a ., you need the regexp \. We use strings to represent regular expressions, 
# and \ is also used as an escape symbol in strings.
str_view(c("abc", "a.c", "bef"), "a\\.c")

# If you’re trying to match a literal ., $, |, *, +, ?, {, }, (, ),
# there’s an alternative to using a backslash escape: you
# can use a character class: [.], [$], [|], ... all match the
# literal values.
str_view(c("abc", "a.c", "a*c", "a c"), "a[.]c") 

### Anchors ###

# By default, regular expressions will match any part of a
# string. If you want to match at the start or end you
# need to anchor the regular expression using ^ to match
# the start or $ to match the end:

# fruits that starts with letter a
str_view(fruit, "^a")
# fruits that end with letter a
str_view(fruit, "a$")
# finding exactly: apple
str_view(fruit, "^apple$")

# You can also match the boundary between words 
# (i.e.the start or end of a word)  with \b
x <- c("summary(x)", "summarize(df)", "rowsum(x)", "sum(x)")
str_view(x, "sum")
str_view(x, "\\bsum\\b")

### Character classes! ###

# defines a range, e.g., [a-z] matches any lower case
# letter and [0-9] matches any number.
x <- "abcd ABCD 12345 -!@#%."
str_view(x, "[abc]+")
str_view(x, "[a-z]+")
str_view(x, "[^a-z0-9]+")

# \ escapes special characters, so [\^\-\]] matches ^, -, or ].
str_view(x, "[a\\-c]")

# \d matches any digit;
# \D matches anything that isn’t a digit.
x <- "abcd ABCD 12345 -!@#%."
str_view(x, "\\d+")
str_view(x, "\\D+")

# \s matches any whitespace (e.g., space, tab, newline);
# \S matches anything that isn’t whitespace.
str_view(x, "\\s+")
str_view(x, "\\S+")

# \w matches any “word” character, i.e. letters and numbers;
# \W matches any “non-word” character.

### Grouping and capturing ###

# parentheses have another important effect: they create capturing groups that 
# allow you to use sub-components of the match.

# The first way to use a capturing group is to refer back to it within a match 
# with back reference: \1 refers to the match contained in the first parenthesis
# \2 in the second parenthesis, and so on. For example, the following pattern 
# finds all fruits that have a repeated pair of letters:

# something thats two letters that repeats one time
str_view(fruit, "(..)\\1")
# starts and ends with the same two letters
str_view(words, "^(..).*\\1$")

#------------------------------------------------------------------------------#

# Given the corpus of common words in stringr::words, create regular
# expressions that find all words that:

library(stringr)
words <- stringr::words

### 1. Start with “y”.
str_view(words, "^y\\w+")
# ^: Anchors the pattern to the beginning of the word.
# y: Matches the letter "y" literally.
# \\w+: Matches one or more word characters (letters, digits, or underscores).

### 2. Don’t start with “y”.
str_view(words, "^[^y].*")
# ^: Anchors the pattern to the beginning of the word.

### 3. End with “x”.
str_view(words, "\\w+x$")
# \\w+: Matches one or more word characters.
# x: Matches the letter "x" literally.
# $: Anchors the pattern to the end of the word.

### 4. Are exactly three letters long. (Don’t cheat by using 5str_length()!)
str_view(words, "^...$")

### 5. Have seven letters or more.
str_view(words, "^\\w{7,}$")
# ^: Anchors the pattern to the beginning of the word.
# \\w{7,}: Matches seven or more word characters.
# $: Anchors the pattern to the end of the word.

### 6. Contain a vowel-consonant pair.
str_view(words, "[aeiou][^aeiou]")

### 7. Contain at least two vowel-consonant pairs in a row.
str_view(words, "\\w*[aeiou][b-df-hj-np-tv-z][aeiou]\\w*")
# \\w*: Matches zero or more word characters.
# [aeiou]: Matches any vowel.
# [b-df-hj-np-tv-z]: Matches any consonant.

### 8. Only consist of repeated vowel-consonant pairs.
str_view(words, "^([aeiou][^aeiou])+$")
# ^: Anchors the pattern to the beginning of the word.
# ( ... ): This is a capturing group that groups together the pattern inside it.
# +: Allows for one or more occurrences of the consonant-vowel pair.
# $: Anchors the pattern to the end of the word.






