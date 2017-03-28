
class Page
  attr_reader :id, :keywords

  @@words_page_map = {}

  def initialize(id, keywords,n)
    @id = "P"+id.to_s
    @keywords = keywords
    @keywords.each_with_index do |word,index|
      @@words_page_map[word] ||= {}
      @@words_page_map[word][@id] = n - index
    end
  end

  def print
    p "#{self.id}: #{self.keywords.join(' ')}"
  end

  # returns data
  def self.data
     @@words_page_map
  end

end
