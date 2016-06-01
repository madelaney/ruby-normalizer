Ruby Normalizer
=============

This is a simple class that given a source file will find every instance of the pattern `{\w+}` and replace it with the environment variable that matches
the string within the brackets.


Usage
=============

The simpliest usage is to pass in the file you wish to search and replace within.

Examples
=============

To replace a file inline:
```
normalize -f index.json
```

To take the contents of a file, but output to a different file:
```
normalize -f index_template.json -o index.json
```

Dependencies
=============

N/A
