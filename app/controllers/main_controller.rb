# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

require_relative "../../lib/string_segmenter"

# The path being defined for this controller action is just "/", meaning 
# the root path. It's the homepage.
MyApp.get "/" do
  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.
  erb :"main/welcome"
end

MyApp.get "/:str" do
  words = StringSegmenter.new(params[:str])
  words.run_program
  @words = words.final_words
  erb :"main/show_words"
end


 MyApp.get "/main/show_words" do
  words = StringSegmenter.new(params[:entered_string])
  words.run_program
  segmented_arr = words.final_words # Returns an Array of the segmented words.
  segmented_words_as_string = segmented_arr.join(", ")

  # Use the ActiveRecord 'EnteredString' class to access the database

  @s = Search.new
  @s.search_string = params[:entered_string]
  @s.segmented_parts = segmented_words_as_string
  @s.save
  erb :"main/show_words"
end

# +  x = StringSegmenter.new(params[:unsegmented_text])
# +  x.run_program
# +  segmented_arr = x.final_words # Returns an Array of the segmented words.
# +  segmented_words_as_string = segmented_arr.join(", ")
# +
# +  # Use the ActiveRecord 'Search' class to access the database.
# +  @s = Search.new
# +  @s.search_string = params[:unsegmented_text]
# +  @s.segmented_parts = segmented_words_as_string
# +  @s.save

# MyApp.get "/main/show_words" do
#   entered_string = Enteredstring.new
#   entered_string.name = params[:entered_string]
#   entered_string.save
#   binding.pry
#   erb :"main/show_words"
# end

# MyApp.get "/admin" do
#   erb :"main/admin"
# end







