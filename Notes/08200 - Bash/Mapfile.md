---
title: Bash mapfile Command Explained [With Examples]
source: https://linuxopsys.com/bash-mapfile-command-explained-with-examples
published: 2023-08-11
created: 2025-01-02
description: In this guide, we learn about mapfile command and demonstrate how it simplifies data manipulation in Bash scripts.
tags:
  - clippings
subject: "[[08200 - Bash]]"
---
## Introduction

Efficiently handling file reading and data processing is crucial when it comes to scripting in Bash. In this guide, we learn about mapfile command and demonstrate how it simplifies data manipulation in Bash scripts.

The mapfile command offers a powerful yet simple solution, allowing you to effortlessly read lines from standard input (or a specified file descriptor) into an array variable. mapfile is available in Bash version 4.0 and later. It might not be present in older versions or other shells.

**Syntax**:

The command structure is as follows:

```
mapfile [options] array_variable < input_file
```

We can see that the command takes at least two arguments, the array variable in which it’s going to store our data and a piped input from our file. 

Some of the useful **options** of mapfile are:

- \-t: Stripping the trailing newline, allows us to remove the newline character ‘\\n’ from our data.
- \-d: Specifying the delimiter which mapfile will use to separate our data into chunks every time it occurs.
- \-s: Skipping the first n number of lines, allows us to select a certain block of data from our file by discarding the first n lines that precede it.
- \-n: Limiting the number of lines we want to read, allows us again, to only select a certain block of data by discarding everything that comes after it.

By default, the mapfile (or its synonym readarray) command reads input line-wise, using the newline (\\n) character as the delimiter. This makes it particularly useful for reading files that are organized with lines of data, which is common in many text files and logs. However, starting from Bash version 4.4, you can specify a different delimiter using the -d option

## Practical Usage of mapfile

We are going to take a look at how different types of data can be processed such as lines, numbers, words, and CSV files.

### Reading Lines from Text Files

Before we can show mapfile in action, we’re first going to need a file with some data in it to process. For the first example, we will be using the following “data.txt” file

```
Unwanted Line 1
Unwanted Line 2
Line 1
Line 2
Line 3
```

In our file we have three lines of text separated by the invisible newline ‘\n’ character. To handle this data we can use the following script:

```bash
input_file="data.txt"

mapfile -t -s 2 lines_array < "$input_file"

for line in "${lines_array[@]}"; do
	echo "$line"
done
```

![script output - mapfile with -t and -s options](https://linuxopsys.com/wp-content/uploads/2023/08/mapfile-bash-script-090823-1.png)

As explained earlier we use the standard mapfile format with the -t option, which separates our data by the newline character. Apart from using the -t option, we also used the -s option to skip the first two lines in our file which we did not want to include.

Next, we use a for loop to go through our array, storing the current array string in the *$line* variable and printing it out.

### Processing Numeric Data with mapfile

For our next example we are going to take a file with numbers stored in it and do a simple calculation. The example input file will look like

```
10
20
30
Unwanted Line
```

Similar to our previous example, there are three numbers, each separated by the newline character.

```bash
input_file="data.txt"

mapfile -t -n 3 numbers_arrays < "$input_file"

sum=0

for num in "$(numbers_array[@])"; do
	sum=$((sum + num))
done

echo "Sum of numbers: $sum"
```

![script output - mapfile with for loop](https://linuxopsys.com/wp-content/uploads/2023/08/mapfile-bash-script-090823-2.png)

We can see that although we are now using numerical data instead of strings the syntax remains the same when using mapfile. In our four loop we calculate the sum of our numbers, keeping in mind that when we want to do numerical operations in bash it’s important to enclose the operations inside double brackets preceded by the dollar sign *$((numerical operations))*.

Finally, we used the -n option to specify the number of lines we want to read, which in our case is the first 3, enabling us to discard the final line which we don’t want to process.

### Working with Text Data

Moving on, we will take a look at how to process words instead of lines. The data.txt file used in this example will have the following format

```
Apple Banana Orange
```

And our script for processing this data will be as follows:

```bash
input_file="data.txt"

mapfile -t -d ' ' words_array < "$input_file"

for word in "${words_array[@]}"; do
	echo "$word:"
done
```

![script output - mapfile with -t and -d option](https://linuxopsys.com/wp-content/uploads/2023/08/mapfile-bash-script-090823-3.png)

We can see that a second option for the mapfile command has been added, which is the -d option, along with it’s argument ‘ ‘. The -d option stands for delimiter, in simple terms we tell mapfile after which character it should separate the data into different variables in our array. Since we are working with words separated by spaces, we want to separate everytime the space character occurs.

### Handling CSV Data with mapfile

For the final example, we are taking a look at how to process CSV data. Suppose we have a CSV file with the following data.

```
Alice,25,alice@example.com
Bob,30,bob@example.com
```

Taking a closer look at a CSV file, we can see that it’s very similar to our previous example. Instead of our words being separated by a space character, this time it’s a comma. However, we won’t be able to use the same method as last time, since when processing CSV files, we not only need to separate the rows, we also need to separate the columns, but still somehow keep the columns of the same row grouped.

```bash
#!/bin/bash

# Input file
input_file="data.csv"

# Read the file into an array using mapfile
mapfile -t csv_data < "$input_file"

# Loop through each line in the array
for line in "${csv_data[@]}"; do
  mapfile -t -d ',' fields_array <<< "$line"

  # Extract the fields into variables
  name="${fields_array[0]}"
  age="${fields_array[1]}"
  email="${fields_array[2]}"

  # Print the extracted data
  echo "Name: $name, Age: $age, Email: $email"
done
```

![script output - mapfile handle csv file](https://linuxopsys.com/wp-content/uploads/2023/08/mapfile-bash-script-090823-4.png)

For the first part of processing CSV data, which is separating the rows, we use mapfile to read each of our lines and store them separately. Next, we use a loop to go through each of those lines, processing them again using mapfile with the -d option and the comma as a delimiter. This way we get all of our three columns (name, age, email) as separate variables inside our array, which we can now print out.