require 'erb'
require 'pry'
class SiteGenerator
  def make_index!
    # binding.pry
    index = <<-HTML
      <!DOCTYPE html>
      <html>
        <head>
            <title>Movies</title>
        </head>
        <body>
          <ul>
            #{create_make_index_url}
          </ul>
        </body>
      </html>
    HTML
    File.open('./_site/index.html','w') do |f|
      f.write(index)
    end
  end
  def create_make_index_url
    Movie.all.map do|movie|
      "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>"
    end.join
  end
  # def generate_pages!
  #   template=ERB.new(File.read('lib/templates/movie.html.erb'))
  #   Movie.all.map do |movie|
  #     File.open('_site/movies/#{movie.url}','w+') do|f| f.write(template.result(binding))}
  #   end
  # end
  # end
    def generate_pages!
    template = ERB.new(File.read('lib/templates/movie.html.erb'))

    Movie.all.each do |movie|
      f = File.open("_site/movies/#{movie.url}","w+") do|f| 
        f.write(template.result(binding))
      end
    end
  end
end