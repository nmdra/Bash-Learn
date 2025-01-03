---
title: Tutorial 9 - Regular Expressions | ULI101 - Introduction to UNIX/Linux and the Internet
source: https://seneca-ictoer.github.io/ULI101/A-Tutorials/tutorial9
published: 
created: 2025-01-02
description: Tutorial 9 for Students to Learn Regular Expressions
tags:
  - clippings
subject: "[[08200 - Bash]]"
---
## Key Concepts​
### Regular Expressions​

*A **regular expression** is a combination of two types of characters: **literals** and **special characters**. Strings of text can be compared to this pattern to see if there is a match.*

This usually refers to text that is contained inside a **file** or text as a result of issuing Linux commands using a **Linux pipeline command**.

### Literal (Simple) Regular Expressions​

The simplest regular expression is a series of letters and numbers, (tabs or spaces). A **simple (literal)** regular expression consists of normal characters, which used to match patterns.

Although there are many Linux commands that use regular expressions, the **grep** command is a useful command to learn how to display matches of patterns of strings within text files.

For example:

![Re 3](https://seneca-ictoer.github.io/ULI101/assets/images/Re-3-d05aa5166dd623cc688eebadb8b8ac5d.png)

A **simple (literal)** regular expression is a series of letters and numbers (tabs or spaces).

### Complex Regular Expressions​

The problem with just using **simple (literal)** regular expressions is that only simple or general patterns are matched.

*Complex Regular Expressions* use symbols to help match text for more precise (complex) patterns. The most common complex regular expression symbols are displayed below:

**Anchors**: `^` , `$`

Match lines the begin (^) or end ($) with a pattern.

**Single Character**: `.`

Represents a single character that can be any type of character.

**Character Class**: `[ ]` , `[^ ]`

Represents a single character but with restrictions.

**Zero or More Occurrence**: `*`

Zero or more occurrences of previous character.

Examples of **complex regular expressions** are displayed below:

![Re 4](https://seneca-ictoer.github.io/ULI101/assets/images/Re-4-6f08d697e016591de8adc21745ff2632.png)

Example of using **anchors**. ^

![Re 5](https://seneca-ictoer.github.io/ULI101/assets/images/Re-5-2a52fa55a0b47ae630e26050271bc0c0.png)

Example of matching by **character(s)**. ^

![Re 6](https://seneca-ictoer.github.io/ULI101/assets/images/Re-6-51cf75d286bf79057d0f60d560888194.png)

Example of using **character class**. ^

![Re 7](https://seneca-ictoer.github.io/ULI101/assets/images/Re-7-efa503475bcb463985dd3ae4c287fe8e.png)

Example of matching **zero or more occurrence of preceding character**. ^

### Extended Regular Expressions​

*Extended Regular Expressions* consist of additional special characters to “extend” the capability of regular expressions. You must use the **egrep** or **grep -E** commands in order to properly use extended regular expressions.

**Repetition**: `{min,max}`

Allows for more precise repetitions. Using braces, you can specify the **minimum** and/or **maximum** number of repetitions.

**Groups**: `( )` Allows you to search for repetition for a **group of characters**, a **word**, or a **phase**. You enclose them within brackets **( )** to specify a **group**.

**or Condition**: `|` Can be used with **groups** to match a variety of character(s), words or phases. The | symbol is used to separate the variety of character(s) within a *group*.

Examples of how to use **extended regular expressions** with the **egrep** command are displayed below:

![Re 8](https://seneca-ictoer.github.io/ULI101/assets/images/Re-8-b9c7170e3f42f32d0dd3dee68af3cf99.png)

Example of using **repetition**. ^

![Re 9](https://seneca-ictoer.github.io/ULI101/assets/images/Re-9-d37ea71ef5065608cfbb5de6a5425815.png)

Example of using **groups**. ^

![Re 10](https://seneca-ictoer.github.io/ULI101/assets/images/Re-10-b5da1a33650a2e1581894ff9596bbedf.png)

Example of using **or** condition with **groups**. ^

## Investigation 1: Simple & Complex Regular Expressions​

**ATTENTION: This online tutorial will be required to be completed by Friday in week 10 by midnight to obtain a grade of 2% towards this course**

In this investigation, you will learn how to use the **grep** command with **simple and complex regular expressions** to help search for *patterns* contained in text files.

**Perform the Following Steps:**

1. **Login** to your matrix account.
2. Issue a Linux command to **confirm** you are located in your **home** directory.
3. Issue the following linux Linux command to **copy** a text file to *your* **home** directory from the ULI101 home directory:

```bash
cp ~uli101/tutorialfiles/textfile1.txt ~/
```

4. View the contents of the **textfile1.txt** file using the **more** command see what data is contained in this file.

- Although there are several Linux commands that use regular expressions, we will be using the **grep** command for this investigation.
5. Issue the following Linux command to match the pattern **the** within **textfile1.txt**:

- Take a few moments to view the output below and observe the matched patterns.

![Regex Output 1](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-1-79b81ef6c8424036eefe94057847c03b.png)

6. Issue the grep Linux command with the -i option to ignore case sensitively:

```bash
grep -i "the" textfile1.txt
```

- What do you notice is different when issuing this command?
- You will notice that the pattern "**the**" is matched including larger words like "**them**" and "**their**".
- You can issue the **grep** command with the **\-w** option to only match the pattern as a **word**.

7. Issue the following Linux command:

```bash
grep -w -i "the" textfile1.txt
```

- You should now see only strings of text that match the word **the** (upper or lower case).
- Matching literal or simple regular expressions can be useful, but are **limited** in what pattens they can match. For example, you may want to search for a pattern located at the **beginning** or **end** of the string.
- There are other regular expression symbols that provide more **precise** search pattern matching.
- These special characters are known as **complex** and **extended** regular expressions symbols.
- For the remainder of this investigation, we will focus on **complex regular expressions** and then focus on *extended regular expressions* in INVESTIGATION 2.

8. Issue the following Linux command:

```bash
grep -w -i "^the" textfile1.txt
```

- The **^** symbol is referred to as an **anchor**.
- In this case, it only matches the word "**the**" (both upper or lowercase) at the beginning of the string.

![Regex Output 2](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-2-344d0f3827064c84a98ab5c38e716382.png)

9. Issue the following Linux command:

```bash
grep -w -i "the$" textfile1.txt
```

- The $ symbol is used to anchor patterns at the end of the string.

![Regex Output 3](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-3-be38d82cc7abee52fab352dd396ac9d1.png)

10. Issue the following Linux command to anchor the word "**the**" **simultaneously** at the beginning and end of the string:

```bash
grep -w -i "^the$" textfile1.txt
```

- What do you notice?
- Anchoring patterns at both the beginning and ending of strings can greatly assist for more **precise** search pattern matching.
- We will now be demonstrate the **effectiveness** of combining **anchors** with other complex regular expressions symbols.

11. Issue the following Linux command to match strings that **begin with 3 characters**:

```bash
grep "^..." textfile1.txt
```

- What do you notice? Can lines that contain **less than 3 characters** be displayed?

![Regex Output 4](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-4-02af9494c480a2e6ca1fb025f533e834.png)

12. Issue the following Linux command to match strings that **begin and end with 3 characters**:

```bash
grep "^...$" textfile1.txt
```

- What do you notice compared to the previous command?

![Regex Output 5](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-5-8b3c21f3588f48f8f20597e0efc6b8b4.png)

13. Issue the following Linux command to match strings that **begin with 3 digits**:

```bash
grep "^[0-9][0-9][0-9]" textfile1.txt
```

- What did you notice?

14. Issue the following Linux command to match strings that **end with 3 uppercase letters**:

```bash
grep "[A-Z][A-Z][A-Z]$" textfile1.txt
```

- What type of strings match this pattern?

15. Issue the following Linux command to match strings that **consist of only 3 digits**:

```bash
grep "^[0-9][0-9][0-9]$" textfile1.txt
```

- What did you notice?

![Regex Output 6](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-6-6ed4e3ca18ad897a2cc4c4edde39f5c8.png)

16. Issue the following Linux command to match strings that **consist of only 3 alphanumeric digits**:

```bash
grep "^[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]$" textfile1.txt
```

- What did you notice?

![Regex Output 7](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-7-6291dee7891c164a976ee4558e9310aa.png)

- The "\*" complex regular expression symbol is often confused with the "\*" **filename expansion** symbol.
- In other words, it does NOT represent zero or more of **any character**, but zero or more **occurrences** of the character that comes **before** the "\*" symbol.

17. To demonstrate, issue the following Linux command to display **zero or more occurrences** of the letter "**x**":

- You will most likely notice most lines of the file is displayed.

18. Let's issue a Linux command to display strings that contain **more than one occurrence** of the letter "**x**":

- Why did this work? because the pattern indicates one occurrence of the letter "x", followed by **zero or MORE occurrences** of the next letter "x".
- If you combine the complex regular expression symbols ".\*" it will act like zero or more occurrences of any character (i.e. like "\*" did in filename expansion).

19. Issue the following Linux command to match strings begin and end with a number with nothing or anything inbetween:

```bash
grep "^[0-9].*[0-9]$" textfile1.txt
```

- Using **simultaneous anchors** combined with the ".\*" symbol(s) can help you to refine your search patterns of strings.

20. Issue the following Linux command to display strings that begin with a capital letter, end with a number, and contains a capital X somewhere inbetween:

```bash
grep "^[A-Z].*X.*[0-9]$" textfile1.txt
```

- Let's look at another series of examples involving searching for strings that only contain **valid numbers**.
- We will use **pipeline commands** to both display stdout to the screen and save to files for confirmation of running these pipeline commands when run a **checking-script** later in this investigation.

21. Issue the following Linux command to create the **regexps** directory:

22. Change to the **regexps** directory and confirm that you have moved to this directory.
23. First, issue the following Linux command to copy another data file called **numbers1.dat**:

```bash
cp ~uli101/tutorialfiles/numbers1.dat ~/regexps
```

24. View the contents of the **numbers.dat** file using the **more** command and quickly view the contents of this file. You should notice **valid** and **invalid** numbers contained in this file. When finished, exit the more command.
25. Issue the following linux pipeline command to display only **whole** numbers (i.e. no + or - sign):

```bash
grep "^[0-9]*$" numbers1.dat | tee faulty.txt
```

- You may have noticed that the command **does not entirely work**. You may notice an **empty line** (which is NOT a whole number). This occurs since the \* regular expression symbol represents ZERO or MORE occurrences of a number. You can use an additional numeric character class with the \* regular expression symbol to search for one or more occurrences of a number.

26. Issue the following Linux pipeline command to display only whole numbers:

```bash
grep "^[0-9][0-9]*$" numbers1.dat | tee whole.txt
```

- You should see that this now works.

27. Issue the following Linux pipeline command to display only **signed** integers:

```bash
grep "^[+-][0-9][0-9]*$" numbers1.dat | tee signed.txt
```

- What did you notice? Positive and negative numbers display, not **unsigned** numbers.

28. Issue the following Linux pipeline command to display **signed** or **unsigned integers**:

```bash
grep "^[+-]*[0-9][0-9]*$" numbers1.dat | tee all.txt
```

- Did this command work?

![Regex Output 8](https://seneca-ictoer.github.io/ULI101/assets/images/Regexps-8-c23389e0ff496170758b92fc3082ff45.png)

- Simultaneous **anchoring** of regular expressions using **character class** and **zero or more occurrences** to display **signed** and **unsigned** integers.

29. Issue the following command to check that you created those hard links:

- If you encounter errors, then view the feedback to make corrections, and then re-run the checking script. If you receive a congratulation message that there are no errors, then proceed with this tutorial.
- You can also use the **grep** command using *regular expression* as a **filter** in pipeline commands.

30. Issue the following Linux pipeline command:

- What did this pipeline display?

31. Issue the following Linux pipeline command:

- What did this pipeline display?
- Although very useful, **complex** regular expressions do NOT entirely solve our problem of displaying **valid** unsigned and signed numbers (not to mention displaying decimal numbers).

In the next investigation, you will learn how to use **extended** regular expressions that will completely solve this issue. You can proceed to INVESTIGATION 2.

## Investigation 2: Extended Regular Expressions​

In this investigation, you will learn how to use **extended regular expressions** with the **egrep** command to further refine your search patterns.

**Perform the Following Steps:**

1. Make certain that you are located in your **~/regexps** directory on your *Matrix* account.
2. Issue the following Linux command to copy another data file called **numbers2.dat**:

```bash
cp ~uli101/tutorialfiles/numbers2.dat ~/regexps
```

3. View the contents of the **numbers2.dat** file using the **more** command and quickly view the contents of this file. You should notice *valid* and *invalid* numbers contained in this file. When finished, exit the more command.
4. Issue the following Linux command to display **signed** or **unsigned integers**:

```bash
grep "^[+-]*[0-9][0-9]*$" numbers2.dat
```

- You should notice **multiple +** or **\-** signs appear prior to some numbers.
- This occurs since you are searching or one or MORE occurrences of a + or - sign.

![Ext Regex Output 1](https://seneca-ictoer.github.io/ULI101/assets/images/Eregexps-1-2a4d5b85988148ace6ff11180b21189f.png)

- **Weakness** of **complex** regular expressions that do not **limit** the number of **positive** or **negative** signs.
- Using **extended regular expression** symbols to specify **minimum** and **maximum** repetitions: **{min,max}** can solve that problem.

5. Issue the following Linux command (using extended regular expression symbols) to display **signed** or **unsigned** integers:

```bash
grep "^[+-]{0,1}[0-9]{1,}$" numbers2.dat
```

- **NOTE: No output will be displayed! Why?**
- This is due to the fact that the **grep command was NOT issued correctly to use extended regular expression symbols.**
- You would need to issue either **grep -E**, or just issue the **egrep** command. The egrep command works with **all** regular expression symbols, and should be used in the future instead of the older grep command.
- We will use **pipeline commands** to both display stdout to the screen and save to files for confirmation of running these pipeline commands when run a **checking-script** later in this investigation.

6. Issue the following Linux pipeline command using **egrep** instead of *grep*:

```bash
egrep "^[+-]{0,1}[0-9]{1,}$" numbers2.dat | tee better-number1.txt
```

- You should have noticed that the command worked correctly this time because you used the **egrep** command.

![Ext Regex Output 1](https://seneca-ictoer.github.io/ULI101/assets/images/Eregexps-2-af134e52030beacb6d24ae95c5eb64c3.png)

- Using **extended** regular expression symbols (such as **repetition**) to refine matches of *signed* and *unsigned* integers.
- **NOTE:** With extended regular expressions, the **?** symbol can be used to represent the **{0,1}** repetition symbols and the **+** symbol can be used to represent the **{1,}** repetition symbols

7. Issue the following Linux pipeline command using the repetition shortcuts "+" and "?":

```bash
egrep "^[+-]?[0-9]+$" numbers2.dat | tee better-number2.txt
```

- You should have seen the **same results**, but less typing was required.

8. Issue the following Linux pipeline command to display **signed**, **unsigned**, **whole**, and **decimal** numbers:

```bash
egrep "^[+-]{0,1}[0-9]{1,}[.]{0,1}[0-9]*$" numbers2.dat | tee better-number3.txt
```

- Were all signed and unsigned intergers and decimal numbers displayed?

9. Issue the follwoing command to check that you correctly issued those Linux *pipeline commands*:

- If you encounter errors, then view the feedback to make corrections, and then re-run the checking script.
- If you receive a congratulation message that there are no errors, then proceed with this tutorial.
- You can also use extended regular expression symbols for **grouping**. For example, you can search for repetitions of GROUPS of characters (like a word) as opposed to just a single character or a GROUP of numbers as opposed to a single digit.

10. Issue the following linux pipeline command to copy another data file called **words.dat**:

```bash
cp ~uli101/tutorialfiles/words.dat ~/
```

11. View the contents of the **words.dat** file using the **more** command and quickly view the contents of this file. Within this file, you should notice some lines that contain repetitions of words. When finished, exit the more command.
12. Issue the following linux pipeline command to display **two or more occurrences** of the word "the":

```bash
egrep -i "(the){2,}" words.dat | tee word-search1.txt more
```

- **NOTE: No output is displayed! Why?**
- This is due to the fact that a space should be included at the end of the word "**the**". Usually words are separated by spaces; therefore, there were no matches since there were not occurrences of "thethe" as opposed to "**the the**" (i.e. no space after repetition of the pattern).

13. Reissue the previous pipeline command with the word the followed by a **space** within the brackets:

```bash
egrep -i "(the ){2,}" words.dat | tee word-search2.txt
```

- The "|" (or) symbol (same symbol as "pipe") can be used within the grouping symbols to allow matching of additional groups of characters. Again, it is important to follow the character groupings with the space character

![Ext Regex Output 3](https://seneca-ictoer.github.io/ULI101/assets/images/Eregexps-3-c33f7b3e09a977cfad0230322c06de06.png)

- Using **extended** regular expression symbols (such as **grouping**) to refine matches of repetition of **words** (as opposed to *characters*).

14. Issue the following linux pipeline command to search for **two or more occurrences** of the word "**the** " or **two or more occurrences** of the word "**and** ":

```bash
egrep -i "(the |and ){2,}" words.dat | tee word-search3.txt
```

15. Issue the following Linux command to check that you correctly issued those Linux *pipeline commands* using the **tee** command to create those text files:

- If you encounter errors, then view the feedback to make corrections, and then re-run the checking script.
- If you receive a congratulation message that there are no errors, then proceed with this tutorial.
- Let's issue a Linux **pipeline** command using the **egrep** command as a **filter** using both **complex** and **extended** regular expressions.

16. Issue the following Linux pipeline command:

```bash
ls | egrep "[a-z]{1,}.*[0-9]"
```

- What did this Linux pipeline command display?
- The **grep** and **egrep** Linux commands are NOT the only Linux commands that use regular expressions.

In the next investigation, you will apply regular expressions to a number of Linux commands that you already learned in this course.

You can proceed to INVESTIGATION 3

## Investigation 3: Other Commands Using Regular Expressions​

In this investigation, you will see commands other than **grep** or **egrep** that can use regular expressions.

**Perform the Following Steps:**

1. Make certain that you are located in your **~/regexps** directory on your *Matrix* account.
2. Let's look at using regular expressions with the **man** command. Issue the following linux command :

3. We want to search for an option that can sort the file listing. Type the following regular expression below and press **ENTER**:

![Other re 1](https://seneca-ictoer.github.io/ULI101/assets/images/Other-re-1-f88221f12e3c60c3c95cd5360c51bc30.png)

- Entering **/sort** in the **man** command can search for the string "**sort**".
- **FYI:** The **grep** and **egrep** Linux commands contain the regular expressions within quotes, but **most** other Linux commands specify regular expressions using **forward slashes** (e.g. **/regular expression** or **/regular expression/**).

4. Scroll throughout the man pages for the ls command to view matches for the pattern "**sort**" (You can press **SPACE** or key combination **alt-b** to move forward and backwards one screen respectively).
5. Press the letter `q` to **exit** the man pages for **ls**.

- Let's use regular expressions with the **less** command.
6. Issue the following Linux command to copy another data file called **large-file.txt**:

```bash
cp ~uli101/tutorialfiles/large-file.txt ~/
```

7. Issue the following Linux command to view the contents of the **large-file.txt**:

8. We want to search for a pattern **uli101** within this text file. Type the following regular expression and press **ENTER**:

- You should see the pattern "uli101" throughout the text file.

![Other re 2](https://seneca-ictoer.github.io/ULI101/assets/images/Other-re-2-52f4b648c5f40433a626cc665ff30c1c.png)

- Entering **/uli101** in the **less** command can display all matches of "**uli101**" throughout the text file.

9. Press the letter `q` to exit the **less** command.
10. Try the same search techniques with the **more** command.

- Does it work the same for the *less* command?
- Let's learn how to perform a simple **search and replace** within the **vi** utility by using regular expressions.
11. Issue the following Linux command to edit the **large-file.txt** file:

- Let's first perform a simple search within this text file.

12. Press the **ESC** key to make certain you are in **COMMAND** mode.
13. Type the following and press **ENTER**:

- You should notice the pattern "**uli101**" highlighted for ALL occurrences in this text file.

![Other re 3](https://seneca-ictoer.github.io/ULI101/assets/images/Other-re-3-5517ae29816bce0990b790177b68bab1.png)

- Entering **/uli101** in the **vi** command can search for the string "**uli101**".
- Let's **search** for the **uli101** pattern, and **replace** it in capitals (i.e **ULI101**).
- In vi, to issue a command, you need to enter **LAST LINE** MODE then issue a command.
- Let's issue a command from **LAST LINE** MODE to search and replace **uli101** to **ULI101**.

14. Making certain that you are **COMMAND** MODE in vi, type the following and press **ENTER**:

- **NOTE:** The letter **g** after the replace regular expression represents "**global**" and will replace ALL occurrences of uli101 in the text document (as opposed to replacing the first occurrence for every line).

15. Type the following (in uppercase letters) and press **ENTER**: `/ULI101`

- You should notice the pattern "**ULI101**" highlighted for ALL occurrences in this text file.

![Other re 4](https://seneca-ictoer.github.io/ULI101/assets/images/Other-re-4-ededa3c87b43dd5ed0007c94337aa529.png)

- In **last line** MODE in the **vi** text editor, issuing a command using regular expressions to convert **uli101** to **ULI101**.

16. Navigate throughout the text file to confirm that ALL occurrences of **uli101** have been replaced with **ULI101**.
17. Save changes to your vi editing session and exit by typing the following and pressing ENTER:
