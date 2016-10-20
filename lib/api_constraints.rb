module Router
  class ApiConstraints
    def initialize(options)
      @version = options[:version]
      @default = options[:default]
    end

    def default?
      @default
    end

    def matches?(request)
      default? || request.headers['Accept'].include?("application/vnd.customer_profile_service.v#{@version}")
    end
  end
end