class Events::Purchase::CurrentStatus
  def initialize(purchase_id:)
    @purchase = Purchase.find(purchase_id)
  end

  def payload
    @payload ||= {
      subject: 'purchase_current_status',
      purchase_id: @purchase.id,
      status: @purchase.status
    }
  end
end
