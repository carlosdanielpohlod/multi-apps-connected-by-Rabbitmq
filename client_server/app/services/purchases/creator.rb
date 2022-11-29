class Purchases::Creator
  def initialize(user:, product:)
    @user = user
    @product = product
  end

  def call
    purchase = Purchase.create(user: user, product: product)

    notify!(purchase)
  end

  private

  attr :user, :product

  def notify!(purchase)
    RabbitmqClient::Notifier::Purchase.new(purchase: purchase).call
  end
end
