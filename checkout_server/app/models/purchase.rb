class Purchase < ApplicationRecord
  extend Enumerize

  enumerize :status,
            in: %w[pending success fail],
            default: :pending
end
