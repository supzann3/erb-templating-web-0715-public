class Movie
  attr_accessor :title, :release_date, :director, :summary
  @@all=[]
  @@count=0
  def initialize(title,release_date,director,summary)
     @title=title
     @release_date=release_date
     @director=director
     @summary=summary
     @@all<<self
     @@count+=1
   end 
   def url
    "#{@title.downcase.gsub(" ","_")}.html"
   end
   def self.all
    @@all
  end
  def self.reset_movies!
    @@all.clear
    @@count=0
  end
  def self.make_movies!
    file=File.read('spec/fixtures/movies.txt')
    movie_array=file.split("\n").map do |movies|
      movies.split(" - ")
    end
    @@all=movie_array.map do |details|
     Movie.new(details[0],details[1].to_i,details[2],details[3])
    end
  end

  def self.recent
    # binding.pry
    @@all.select{|x| x.release_date>=2012}
  end
end