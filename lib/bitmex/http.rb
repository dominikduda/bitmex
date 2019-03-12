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

class BitmexError < BitmexError; end
class Bitmex::BadRequest < BitmexError; end
class Bitmex::NotFound < BitmexError; end
class Bitmex::TooManyRequests < BitmexError; end
class Bitmex::InternalServerError < BitmexError; end
class Bitmex::BadGateway < BitmexError; end
class Bitmex::ServiceUnavailable < BitmexError; end
class Bitmex::GatewayTimeout < BitmexError; end
