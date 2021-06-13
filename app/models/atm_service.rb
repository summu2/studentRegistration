class AtmService < ApplicationRecord
  enum currency: {
    quarters: 0,
    dimes: 1,
    female: 2
  }
end
