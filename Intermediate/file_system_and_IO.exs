# The IO module takes care of the standard interaction between stdin, stderr and stdout.

IO.puts "prints something"
IO.gets "this is the get prompt y/n? "

IO.puts :stderr, "I am an error"

# The File module allows us to work with files

# By default, files are opened in binary mode, which requires developers to use 
# the specific IO.binread/2 and IO.binwrite/2 functions from the IO module

File.read "hello.txt"
File.read! "hello.txt"


# The Path module can be used to generate file paths