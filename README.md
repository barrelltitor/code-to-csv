# code-to-csv

Turn your code to CSV files for ChatGPT or other AIs to reference when programming for you.

# Usage
Put the script in your project directory and run it with the directory names you want to turn into CSVs as the first argument, e.g:

```
bash ccsv.sh "app resources scripts utils .github"
```
The script has no output for a while, then it will move the completed csv files in the directory it was ran from. 

You can upload these to ChatGPT or other AI. Likely not to Claude, as its project knowledgebase size is basically non existent.

# Caveat

If you have files in your main project directory that you want to turn into a csv you will need to copy these to a separate folder, or modify the script. 

# License

MIT. Just do whatever with it. 