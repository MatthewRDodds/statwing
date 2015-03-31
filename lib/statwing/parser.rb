class Statwing::Parser < Faraday::Response::Middleware
  def on_complete(env)
  	binding.pry
    json = env[:body]
    env[:body] = {
      data: json[:result],
      errors: json.fetch(:data, {}).fetch(:error, {}),
      metadata: json[:metadata]
    }
  end
end