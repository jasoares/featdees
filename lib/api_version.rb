class ApiVersion
  def initialize(options)
    @version, @default = options[:version], options[:default]
  end

  def matches?(req)
    @default || matches_version?(req)
  end

  def self.[](options)
    self.new(options)
  end

  private

  def matches_version?(req)
    return false unless req.headers['Accept']
    req.headers['Accept'].include?("application/vnd.websummit.v#{@version}")
  end
end
