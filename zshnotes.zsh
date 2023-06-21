########## Variables ##########

########## Assignment
x=1
name1=mason
name2='$name1'
name3="$name1"

########## Printing (single quotes vs double quotes)
echo $x # prints out 1
echo $name1 # prints out mason
echo $name2 # prints out $name1 <-- literal string
echo $name3 # prints out mason <-- Performs (1) variable substitution and (2) Command substitution. Special characters need to be escaped
echo "I have \$10"

########## Variable substitution: $variable ##########
# Variable substitution is just to replacing of names with their corresponding values
# ex 1
name="Mason"
echo "Hello, my name is $name"

########## Starting a subshell: () ##########
# Creates a child process of the main shell. changes made inside the child process DO NOT affect parent process
name='mason'
echo $name
(
    name='toby'
    echo $name
)
echo $name

########## Command Substituion: $() ##########
# Command inside () is done first and it's output (which originally wouldve gone to stdout) gets captured and stored in a variable
list=$(ls)
echo $list
########## Comparisons with [[]] ##########
########## Numeric Comparisons
# < (-lt)
# > (-gt)
# <= (-le)
# >= (-ge)
# == (-eq)
# ~= (-ne)
num=10
if [[ $num -lt 10 ]]; then
    echo "$num is less than 10"
elif [[ $num -eq 10 ]]; then
    echo "$num is equal to 10"
elif [[ $num -gt 10 && $num -lt 20 ]]; then
    echo "$num is between 10 and 20 exclusively"
elif [[ $num -eq 20 ]]; then
    echo "$num is equal 20"
else
    echo "$num is greater than 20"
fi
########## String Comparisons
# Compares letter by letter alphabetically. If there are any whitespaces, that's counted as before all the letters
# < : "less than" = "alphabetically before"
# > : "greater than" = "alphabetically after"
# == : tests string equality
# != : Tests string inequality
# =~ : Tests Regex
name1=''
name2='cab'
if [[ $name1 < $name2 ]]; then # means alphabetically comes before
    echo "$name1 comes BEFORE $name2"
elif [[ $name1 == $name2 ]]; then # means alphabetically comes same
    echo "$name1 same $name2"
else # means alphabetically comes after
    echo "$name1 comes AFTER $name2"
fi 

########## File checking
# -e or -f: Checks if a file exists (-e) or is a regular file (-f).
# -d: Checks if a file exists and is a directory.
# -s: Checks if a file exists and is not empty (has a non-zero size).
# -r: Checks if a file is readable.
# -w: Checks if a file is writable.
# -x: Checks if a file is executable.
# -nt: Checks if one file is newer than another.
# -ot: Checks if one file is older than another.
file="example.txt"

if [[ -e $file ]]; then
    echo "File $file exists"
elif [[ ! -e $file ]]; then
    echo "File $file doesn't exist"
fi

########## Numerical computation and evaluation with (()) and $(()) ##########
# When dealing with numerical variables we have more understandable notation
((result = 5 + 2)); echo $result # output 7
result=$((5 / 2)); echo $result # output 2

# If statements:
num1=1
num2=5
if ((num1 > num2)); then
    echo "$num1 > $num2"
elif ((num1 == num2)); then
    echo "$num1 = $num2"
else 
    echo "$num1 < $num2"
fi

# While loops and incrementing
i=0
while ((i < 10)); do
    echo "the value of i is: $i"
    ((i++)) # Alternatively: ((i = i + 1)) OR i=$((i + 1))
done

# For loops
for ((i = 0; i < 10; i++)); do
    echo "the value of i is: $i"
done

########## Reading input ##########
print -n "Please enter a name: "; read word; echo "You entered: $word" # Read name
print -n "Please enter a password: "; read -s word; echo "You entered: $word" # Read secret
print -n "Enter your age: "; read -t 5 word; echo "Your age is: $word" # Read with timeout

########## {} ##########
########## Use case 1: Brace Expansion => Expands to a set pattern so that you can sort of "distribute" over it.
echo {1..3} # 1, 2, 3
echo {a..z} # a, b, c, d, ..., z
echo {1,2,3,4,5,6}.txt
echo mason{1..2}{a..c} # mason1a, mason1b, mason1c, mason2a, mason2b, mason2c
touch {1..100}.txt && rm {1..100}.txt

##########todo Use case 2: grouping command together
# We group commands together so that 

##########todo Use case 3: Variables Expansion (for distinction)

##########todo Use case 4: Command line arguments (also called positional parameters)

##########todo Parameter expansion (THERE'S A LOT OVER 30): ${} ##########

########## Loops ##########
# For loops
for file in $(ls); do
    echo "the file name is $file"
done

for i in mason{1..2}{a..c}; do # note brace expansion does not work inside double quotes
    echo $i
done

for i in {1..10}; do
    if ((i == 6)); then
        break
    fi
    echo "The value of i is: $i"
done

# Using "in" with a for loop
for item in item1 item2 item3; do
    echo "$item"
done

# while loops (for loop would be better here)
touch test{1..10}; chmod u+x test{1..10}; # Create binaries
sample=$(ls -F | grep ".*\*$") # Find the binaries
pattern=".*[^*]\b" # Pattern to extract the substring without * at the end
no_asterix=$(echo $sample | grep -o $pattern) # extract all binary names

count=$(echo $no_asterix | wc -l)
while ((count > 0)); do
    name="test$count"
    echo "Removing...$name"
    rm $name
    count=$((count - 1))
done
##########todo Adding to Man Pages ##########
# To make your own man pages (primarily I just use mine for storing examples for commands)
# Note down the manpath and ensure it searches in /usr/local/share/man
sudo mkdir /usr/local/share/man/man1
cd /usr/local/share/man/man1

##########todo What is a process ##########

##########todo Difference between < and | and order precedence ##########
# A process is an instance of a running program. For example when 

##########todo Process Substitution ##########
# THINK ABOUT DIFFING THE OUTPUT TO 2 COMMANDS WITH <()

########## String Concatentation ##########
# To concatenate strings there are two main ways of doing it: Explicit and Implicit
# Method 1: Best Practice and allows you to be explicit with variable names
object='apple'
greeting="There were 10 ${object}s in the store"
# Method 2: Be Implicit with the variable names
name='mason'
greeting="Hello my name is $name what is yours?"

##########todo arrays and dictionaries ###########
# good example could be: removing all the binary files in a folder. Use an array or dictionary for this

##########todo Finding commands ##########

