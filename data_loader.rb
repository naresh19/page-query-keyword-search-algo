require 'csv'

require_relative 'page'
require_relative 'query'

module DataLoader

  #Reads sample data and initialize pages and query
  def self.load_pages_and_queries(pages_query_file_name,n)
    page_regex = /^P/
    query_regex = /^Q/
    page_num=query_num=0
    File.open(pages_query_file_name).each do |line|
      puts line
      page_num += 1
      if page_regex.match(line)
        words =  line.split(" ")[1..-1]
        pg = Page.new(page_num,words,n)
        pg.print
      elsif query_regex.match(line)
        query_num+=1
        words = line.split(" ")[1..-1]
        qry = Query.new(query_num,words)
        qry.print
        Query.populate(qry)
      else
        puts "Ignoring line (#{line}) as query is not in correct format."
      end
    end
  end
end

