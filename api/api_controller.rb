require_relative '../app/application'

class ApiController < Application

  get '/constituency/:id/candidates' do

    id = params[:id]

    if $redis.get("candidates_#{id}").nil?
      api_base_url = 'https://candidates.democracyclub.org.uk/api/v0.9/posts/'

      url = api_base_url + "WMC:#{id}"

      puts url

      response = RestClient.get(url)

      data = JSON.parse(response)

      $redis.set("candidates_#{id}", data.to_json)
    end

    data = JSON.parse($redis.get("candidates_#{id}"))

    candidates = []

    data["memberships"].each do |m|
      candidate = {
          id: m["id"],
          name: m["person"]["name"],
          party: m["on_behalf_of"]["name"]
      }
      candidates.push(candidate)
    end

    response_data = {candidates: candidates}

    status 200
    json response_data

  end

  get '/constituency/:id/votes' do

    id = params[:id]

    if $redis.get(id).nil?
      response_data = {data: {}, status: {message: "no votes set"}}
    else
      response_data = {data: JSON.parse($redis.get(id))}
    end

    status 200
    json response_data

  end

  post '/constituency/:id/votes' do

    request.body.rewind
    request_body = JSON.parse request.body.read

    votes = request_body["constituency"]

    $redis.set(params[:id], votes.to_json)

    response_data = {data: votes}

    status 200
    json response_data

  end

end