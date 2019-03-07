module Bitmex
  module HTTP
    module Public
      class Client

        def initialize
          @connection = Connection.new(nil, nil)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Announcement/Announcement_get
        def announcement(options = {})
          @connection.get('/api/v1/announcement', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Announcement/Announcement_getUrgent
        def announcement_urgent(options = {})
          @connection.get('/api/v1/announcement/urgent', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Funding/Funding_get
        def funding(options = {})
          @connection.get('/api/v1/funding', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Instrument/Instrument_get
        def instrument(options = {})
          @connection.get('/api/v1/instrument', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Instrument/Instrument_getActive
        def instrument_active
          @connection.get('/api/v1/instrument/active')
        end

        # @see https://www.bitmex.com/api/explorer/#!/Insurance/Insurance_get
        def insurance(options = {})
          @connection.get('/api/v1/insurance', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Leaderboard/Leaderboard_get
        def leaderboard(options = {})
          @connection.get('/api/v1/leaderboard', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Liquidation/Liquidation_get
        def liquidation(options = {})
          @connection.get('/api/v1/liquidation', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/OrderBook/OrderBook_getL2
        def order_book_l2(symbol, depth = 25)
          @connection.get('/api/v1/orderBook/L2', { symbol: symbol, depth: depth })
        end

        # @see https://www.bitmex.com/api/explorer/#!/Settlement/Settlement_get
        def settlement(options = {})
          @connection.get('/api/v1/settlement', options)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Stats/Stats_get
        def stats
          @connection.get('/api/v1/stats')
        end

        # @see https://www.bitmex.com/api/explorer/#!/Stats/Stats_history
        def stats_history
          @connection.get('/api/v1/stats/history')
        end

        # @see https://www.bitmex.com/api/explorer/#!/Stats/Stats_historyUSD
        def stats_history_usd
          @connection.get('/api/v1/stats/historyUSD')
        end

        # @see https://www.bitmex.com/api/explorer/#!/Trade/Trade_get
        def trade(options = {})
          @connection.get('/api/v1/trade', options)
        end
      end
    end
  end
end
