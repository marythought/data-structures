# Data Structures

## Description
**Data Structures** a repo for data structures and algorithms. This collection holds sample code for a number of classic data structures implemented in Ruby, including:

## Sort Methods:
* insertion sort
* merge sort
* binary tree traversal (pre, post, and in-order)

## Data Structures:
* linked-list (single)
* linked-list (double)
* stack
* queue
* binary tree
* hash table (roll your own)

### Hash table
I implemented a hash table without using Ruby's built-in hash method. This data structure instanciates a hashtable with a specified number of slots (defaults to 1024) and accepts a key (as string) and value. It runs the key through a hash mechanism (convert string characters to ordinal value, concatenate, and modulo by number of slots) and stores the value in a node containing key, value, and "next" (if applicable) for future retrieval.

TODOS:
* should it accept (and rewrite) duplicate keys? or return an error?
* can it be faster?
* should it "stringify" non-string keys if possible, or return an error?
* benchmark runs on test, can I set it to run on a specific rake command?
* can I explore how my hash is diversifying (or not) the indexing? Would be interesting to see how it's divvying up the nodes and tinker with the hash algorithm for better/faster/more diverse results.

## Installation

## Usage

* rake test

## Configuration

## Information

Good resources for data structures and algorithms in Ruby:
* Item 1
* Item 2
* Item 3

Help with setting up testing for error messages:
* http://phrogz.net/programmingruby/tut_exceptions.html
* http://stackoverflow.com/questions/14418628/what-is-the-expected-syntax-for-checking-exception-messages-in-minitests-assert

## Authors

* Mary Dickson (https://github.com/marythought)

## Attribution
* Thanks to Kevin Townsend for help with binary tree recursion (and probably more)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT/X11
