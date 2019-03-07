require 'bitmex'
require 'bitmex/http/public'
require 'bitmex/http/private'
require 'faraday'
require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module Bitmex
  module HTTP
    class Connection
      extend Forwardable

      def_delegators :@connection, :get, :post, :delete

      def initialize(key, secret)
        @connection = Faraday::Connection.new(:url => Bitmex.url) do |f|
          f.request :json
          f.response :json, :parser_options => { :symbolize_names => true }
          f.use FaradayMiddleware::Authentication, key, secret
          f.use FaradayMiddleware::RaiseHttpException
          f.use FaradayMiddleware::LoudLogger if Bitmex.loud_logger
          f.adapter Bitmex.adapter
        end
      end
    end
  end
end

class Bitmex::BadRequest < StandardError; end
class Bitmex::NotFound < StandardError; end
class Bitmex::TooManyRequests < StandardError; end
class Bitmex::InternalServerError < StandardError; end
class Bitmex::BadGateway < StandardError; end
class Bitmex::ServiceUnavailable < StandardError; end
class Bitmex::GatewayTimeout < StandardError; end
