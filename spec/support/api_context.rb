shared_context 'api context', type: :api do
  include Rack::Test::Methods

  def app
    API::V1
  end

  def response
    last_response
  end

  def response_data
    content_type = last_response['Content-Type']

    unless content_type == 'application/json'
      raise "The response has wrong content type: #{content_type}, application/json expected"
    end

    data = JSON.parse(last_response.body)
    data.is_a?(Array) ? data.map(&:deep_symbolize_keys) : data.deep_symbolize_keys
  end
end
