class EmailChecker
  # Required dependency for ActiveModel::Errors
  extend ActiveModel::Naming

  API_ENDPOINT = 'apilayer.net'.freeze
  # API_REQUESTS_QUOTA_REACHED_MESSAGE = 'API rate limit exceeded'.freeze

  def initialize(email)
    @email = email
    @errors = ActiveModel::Errors.new(self)
  end

  def check
    path = "/api/check?access_key=#{Rails.application.config.apilayer_key}"
    response = Net::HTTP.get_response(
        API_ENDPOINT,
        "#{path}&email=#{@email}&smtp=1&format=1"
    )

    if response.code.to_i == 200
      response_body = JSON.parse(response.body)
      response_body['format_valid'] && response_body['mx_found'] && response_body['smtp_check']
    end

  end

end