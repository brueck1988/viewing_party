def stub_top_20_page1
  json_response_1 = File.read('spec/fixtures/top_rated_page_1.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}&include_adult=false&language=en-US&page=1").
  with(
    headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.4.1',
     'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
      }).
  to_return(status: 200, body: json_response_1, headers: {})
end

def stub_top_20_page2
  json_response_2 = File.read('spec/fixtures/top_rated_page_2.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}&include_adult=false&language=en-US&page=2").
  with(
    headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.4.1',
     'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
      }).
  to_return(status: 200, body: json_response_2, headers: {})
end

def stub_movie_496243
  json_response_movie = File.read('spec/fixtures/movie_496243.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/496243?api_key=#{ENV['moviedb_api_key']}&append_to_response=credits&include_adult=false&language=en-US").
  with(
    headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.4.1',
     'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
      }).
  to_return(status: 200, body: json_response_movie, headers: {})
end

def stub_review_496243
  json_response_review = File.read('spec/fixtures/review_496243.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/496243/reviews?api_key=#{ENV['moviedb_api_key']}&include_adult=false&language=en-US").
  with(
    headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v1.4.1',
      'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
       }).
  to_return(status: 200, body: json_response_review, headers: {})
end


def stub_movie_search_indiana_jones_1
  json_response_search_1 = File.read('spec/fixtures/search_page_1.json')
  stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['moviedb_api_key']}&include_adult=false&language=en-US&page=1&query=Indiana%20Jones").
    with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1',
          'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
          }).
    to_return(status: 200, body: json_response_search_1, headers: {})
end

def stub_movie_search_indiana_jones_2
  json_response_search_2 = File.read('spec/fixtures/search_page_2.json')
  stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['moviedb_api_key']}&include_adult=false&language=en-US&page=2&query=Indiana%20Jones").
  with(
    headers: {
   'Accept'=>'*/*',
   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
   'User-Agent'=>'Faraday v1.4.1',
   'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
    }).
  to_return(status: 200, body: json_response_search_2, headers: {})
end

def stub_movie_89
  json_response_search_3 = File.read('spec/fixtures/search_page_3.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/89?api_key=#{ENV['moviedb_api_key']}&append_to_response=credits&include_adult=false&language=en-US").
  with(
    headers: {
   'Accept'=>'*/*',
   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
   'User-Agent'=>'Faraday v1.4.1',
   'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
    }).
  to_return(status: 200, body: json_response_search_3, headers: {})
end

def stub_review_89
  json_response_search_4 = File.read('spec/fixtures/search_page_4.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/89/reviews?api_key=#{ENV['moviedb_api_key']}&include_adult=false&language=en-US").
  with(
    headers: {
   'Accept'=>'*/*',
   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
   'User-Agent'=>'Faraday v1.4.1',
   'X-Api-Key'=>"#{ENV['moviedb_api_key']}"
    }).
  to_return(status: 200, body: json_response_search_4, headers: {})
end
