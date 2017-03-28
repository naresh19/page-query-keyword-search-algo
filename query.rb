require_relative 'page'

class Query

  attr_reader :id,:keywords
  attr_accessor :top_pages
  @@queries = {}
 def initialize(id, keywords)
    @id = "Q"+id.to_s
    @keywords = keywords
    @top_pages = nil
  end

  def self.populate qry
    @@queries[qry.id] = qry
  end

  def self.get_all_queries
    @@queries
  end

  def print_top_pages
      p  "#{self.id}: #{self.top_pages.join(' ')}"
  end

  def self.execute n
    words_to_page_map = Page.data
    @@queries.each do |qno,qwords|
      if qwords.top_pages.nil?
        pages_relevance = Hash.new{0}
        qwords.keywords.each_with_index do |qword,qwi|
          if !words_to_page_map[qword].nil?
            words_to_page_map[qword].each do |p_no,relevance_no|
              pages_relevance[p_no] = pages_relevance[p_no] + (relevance_no * (n-qwi))
            end
          end
        end
        qwords.top_pages= pages_relevance.sort_by {|_key, value| -value}.map{|x| x[0]}[0...5]  
        qwords.print_top_pages
      else
        qwords.print_top_pages
      end
    end
  end

  def print
    p "#{self.id}: #{self.keywords.join(' ')}"
  end

end