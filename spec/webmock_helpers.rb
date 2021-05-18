def stub_top_20_page1
  json_response_1 = File.read('spec/fixtures/top_rated_page_1.json')
  stub_request(:get, 'https://api.themoviedb.org/3/movie/top_rated?api_key=477ddf3c5e2f8973bf7c8405d75b2acb&include_adult=false&language=en-US&page=1').
  with(
    headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.4.1',
     'X-Api-Key'=>'477ddf3c5e2f8973bf7c8405d75b2acb'
      }).
  to_return(status: 200, body: json_response_1, headers: {})
end

def stub_top_20_page2
  json_response_2 = File.read('spec/fixtures/top_rated_page_2.json')
  stub_request(:get, 'https://api.themoviedb.org/3/movie/top_rated?api_key=477ddf3c5e2f8973bf7c8405d75b2acb&include_adult=false&language=en-US&page=2').
  with(
    headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.4.1',
     'X-Api-Key'=>'477ddf3c5e2f8973bf7c8405d75b2acb'
      }).
  to_return(status: 200, body: json_response_2, headers: {})
end

def stub_movie_496243
  json_response_movie = File.read('spec/fixtures/movie_496243.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/496243?api_key=477ddf3c5e2f8973bf7c8405d75b2acb&append_to_response=credits&include_adult=false&language=en-US").
  with(
    headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.4.1',
     'X-Api-Key'=>'477ddf3c5e2f8973bf7c8405d75b2acb'
      }).
  to_return(status: 200, body: json_response_movie, headers: {})
end

def stub_review_496243
  json_response_review = File.read('spec/fixtures/review_496243.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/496243/reviews?api_key=477ddf3c5e2f8973bf7c8405d75b2acb&include_adult=false&language=en-US").
  with(
    headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v1.4.1',
      'X-Api-Key'=>'477ddf3c5e2f8973bf7c8405d75b2acb'
       }).
  to_return(status: 200, body: json_response_review, headers: {})
end
