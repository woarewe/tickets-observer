class HoneybadgerError < StandardError
  def initialize(msg, params = {})
    super(msg)
    @params = params
  end

  def to_honeybadger_context
    @params
  end
end
