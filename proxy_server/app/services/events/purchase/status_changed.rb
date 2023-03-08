class Events::Purchase::StatusChanged
  def initialize(purchase_id:)
    @purchase_id = purchase_id
  end

  def payload
    @payload ||= {
      subject: 'purchase_changed_status',
      purchase_id: @purchase_id
    }
  end
end
