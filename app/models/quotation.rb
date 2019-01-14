class Quotation < ApplicationRecord
  include AASM
  PER_PAGE = '15'.freeze

  aasm do
    state :record_init, initial: true
    state :images_link_fetching
    state :pending
    state :to_check
    state :published

    event :publish do
      transitions from: :to_check, to: :published, guard: :to_check_completed?
    end

    event :unpublic do
      transitions from: %i(record_init published images_link_fetching pending), to: :to_check
    end

    event :fetch_data do
      transitions from: %i(record_init pending to_check ), to: :images_link_fetching
    end

    event :checked do
      transitions from: %i(pending record_init), to: :to_check
    end

    event :send_notifications do
      transitions from: %i(pending), to: :to_check
    end
  end

  belongs_to :data_quotation, optional: true
  belongs_to :author, optional: true

  has_many :quotations_tags
  has_and_belongs_to_many :tags, -> { distinct }, through: :quotations_tags

  validates :body, presence: true

  scope :publicate, -> { where(publicate: true) }
  scope :unpublicate, -> { where(publicate: false) }
end
