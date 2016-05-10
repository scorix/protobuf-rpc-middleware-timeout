require 'timeout'

module Protobuf
  module Rpc
    module Middleware
      class Timeout
        def initialize(app)
          @app = app
        end

        def call(env)
          ::Timeout.timeout(1) { @app.call(env) }
        end
      end

      Rpc.middleware.use(Timeout)
    end
  end
end
