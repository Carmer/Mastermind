class Response
  attr_accessor :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end
end
