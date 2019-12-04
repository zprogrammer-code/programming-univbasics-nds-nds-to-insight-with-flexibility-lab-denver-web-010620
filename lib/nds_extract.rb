# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

pp directors_database
# Your code after this point

def movies_with_director_key(name, movies_collection)
 colunmn_index = 0
result = []
 
while colunmn_index < movies_collection.length do
  movie = movies_collection[colunmn_index]

result << movie_with_director_name(name, movie)
  

colunmn_index += 1
end

 return result
 
end

def gross_per_studio(collection)
 result = {}
 row_index = 0 

 while row_index < collection.length do 
   studio = collection[row_index][:studio]
   total_gross = collection[row_index][:worldwide_gross]
   if !result[studio]
     result[studio] = total_gross
   else
     result[studio] += total_gross
    end
   row_index += 1 
 end
 
 return result
 
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end
pp directors_database

def movies_with_directors_set(source)
 result = []
 row_index = 0 
 while row_index < source.length do
#result << source[row_index]
 name = source[row_index][:name]
 movie = source[row_index][:movies]
result << movies_with_director_key(name, movie)
   row_index += 1 
 end
 
return result
 # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
