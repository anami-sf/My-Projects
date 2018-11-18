#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.

class LineAnalyzer

    #Implement the following read-only attributes in the LineAnalyzer class. 
    #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
    #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
    #* content          - the string analyzed (provided)
    #* line_number      - the line number analyzed (provided)  
    attr_reader :content, :line_number, :highest_wf_count, :highest_wf_words
  
  
    #Implement the initialize() method to:
    #* take in a line of text and line number
    #* initialize the content and line_number attributes
  
   
    def initialize(content, line_number)
      @content = content
      @line_number = line_number
      
      #* call the calculate_word_frequency() method.  ???
      calculate_word_frequency  # ???
  
    end
  
    #Implement the calculate_word_frequency() method to:
    #* calculate_word_frequency() - calculates result
  
  
    def calculate_word_frequency
      
      #* calculate the maximum number of times a single word appears within
      #  provided content and store that in the highest_wf_count attribute.
      
      sentence = content.downcase.split
      word_count = Hash.new(0)
  
      sentence.each { |word| word_count[word] += 1 } 
  
      @highest_wf_count = word_count.values.max
  
      #* identify the words that were used the maximum number of times and
      #  store that in the highest_wf_words attribute.
  
      @highest_wf_words = []
      
      word_count.each_pair do |k,v| 
  
        if v == @highest_wf_count 
          @highest_wf_words << k
        end
  
      end
  
    end
  end
  
  
  #  Implement a class called Solution. 
  class Solution
  
    # Implement the following read-only attributes in the Solution class.
    #* analyzers - an array of LineAnalyzer objects for each line in the file
    #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
    #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
    #  equal to the highest_count_across_lines determined previously.
    attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  
  
    # Implement the following methods in the Solution class with these exact names.
    #* initialize() - initialize the array that will have analyzers for each line of the file 
    #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
    #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
    #  highest_count_words_across_lines attribute values
    #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
    #  highest_count_words_across_lines in the specified format
  
    # Implement the initialize() method to:
      #* initialize analyzers as an empty array
    def initialize(analyzers=[])
      @analyzers = analyzers
      analyze_file
      calculate_line_with_highest_frequency
    end
    
    # Implement the analyze_file() method() to:
    #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
    #* Read the 'test.txt' file in lines  
    #* Create an array of LineAnalyzers for each line in the file
    def analyze_file()
      idx = 0
      File.foreach('test.txt') do |line|
        analyzers << LineAnalyzer.new(line, idx += 1) 
      end
  
    end
  
    # Implement the calculate_line_with_highest_frequency() method to:
    #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
    #  highest_count_words_across_lines attribute values
    #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
    #  and stores this result in the highest_count_across_lines attribute.
    #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
    #  attribute value determined previously and stores them in highest_count_words_across_lines.
    def calculate_line_with_highest_frequency
  
      total_counts = []
      
      analyzers.each do |object|
        total_counts << object.highest_wf_count  
        @highest_count_across_lines = total_counts.max
      end
  
  
      @highest_count_words_across_lines = []
  
      analyzers.each do |object|
        if object.highest_wf_count == @highest_count_across_lines
          highest_count_words_across_lines << object  #@ here
          
        end
      end
  
  
    end
  
    #Implement the print_highest_word_frequency_across_lines() method to
    #* print the values of objects in highest_count_words_across_lines in the specified format
    
    #* print_highest_word_frequency_across_lines() 
    #- prints the values of LineAnalyzer objects in highest_count_words_across_lines in the specified format
  
    def print_highest_word_frequency_across_lines
      
      puts "The following words have the highest word frequency per line:"
  
        highest_count_words_across_lines.each do |object|
          puts "#{object.highest_wf_words} (appears in line #{object.line_number})" 
        end
      
  
    end
  
  end
  
  puts solution1 = Solution.new
  puts solution1.analyzers
  puts solution1.highest_count_across_lines
  puts solution1.highest_count_words_across_lines
  puts solution1.print_highest_word_frequency_across_lines
  
  
  