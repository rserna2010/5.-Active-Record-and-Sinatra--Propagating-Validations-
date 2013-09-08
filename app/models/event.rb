class Event < ActiveRecord::Base
  validates :date, presence: {
      message: "Date required"}


    validates :date, presence: {
      message: "Date required"}

    validates :title, presence: {
      message: "Please input a title"}

    validates :title, uniqueness: {
      message: "This event title is already taken"}

    validates :organizer_name, presence: {
      message: "Organizer name cannot be blank"}

    validates :organizer_email, presence: {
      message: "Organizer email cannot be blank"}

    validates :organizer_email, format: { with: /^.+@.+$/,
      message: "Please enter a valid email" }

    validate :date_must_be_in_future

    def date_must_be_in_future
      if date.present? && date < Date.today
        errors.add(:date, "Event must be at a future date")
      end
    end

end
