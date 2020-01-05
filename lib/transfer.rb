require "pry"
class Transfer
  # your code here
  @@all = []
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @@all << self

  end
  def valid?
    @receiver.valid? && @sender.valid?? true : false
  end
  def execute_transaction
    if self.valid? && @sender.balance >= @amount && @status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end
  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status='reversed'
    else
      "Transaction rejected. Please check your account balance."
    end
  end
end
