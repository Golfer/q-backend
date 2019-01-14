class Author < ApplicationRecord
  include AASM

  aasm do
    state :record_init, initial: true
    state :wiki_fetching
    state :pending
    state :to_check
    state :published

    event :publish do
      transitions from: :to_check, to: :published, guard: :to_check_completed?
    end

    event :unpublish do
      transitions from: :published, to: :pending
    end

    event :fetch_data do
      transitions from: %i(record_init pending to_check), to: :to_check
    end
  end

  has_many :quotations
  validates :full_name, presence: true
end
