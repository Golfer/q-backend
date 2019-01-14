class JobRun < ApplicationRecord
  include AASM

  aasm do
    state :job_init, initial: true
    state :executes
    state :fail
    state :pending
    state :finish

    event :run do
      transitions from: :job_init, to: :executes
    end

    event :done do
      transitions from: :executes, to: :finish
    end

    event :failed do
      transitions from: %i(executes finish), to: :fail
    end
  end

  validates :name, presence: true
end
