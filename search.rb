require_relative "page"
require_relative "query"
require_relative "data_loader"
class Search
  def self.execute
    puts "Enter path for sample data (default: 'sample_data.txt')"
      sample_file = gets.chomp.strip
      sample_file = 'sample_data.txt' if sample_file.empty?

    puts "Enter  maximum number of keywords allowed for a web page and query(default: 8)"
    total_keywords = gets.chomp.strip
    total_keywords = 8 if total_keywords.empty?

    p sample_file
    p total_keywords
    DataLoader.load_pages_and_queries(sample_file,total_keywords.to_i)
    self.perform total_keywords.to_i
  end

  def self.perform total_keywords
    puts "===========Query Result==============="
    Query.execute total_keywords
  end

end

Search.execute
#DataLoader.load_pages_and_queries("sample_data.txt",8)
#Search.perform(8)