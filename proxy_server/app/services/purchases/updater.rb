class Purchases::Updater
  def initialize(update_event:)
    @update_event = update_event
  end

  def call
    purchase.update(completed: @update_event[:completed])
  end

  private

  def purchase
    @purchase ||= Purchase.find(@update_event[:purchase_id])
  end
end
