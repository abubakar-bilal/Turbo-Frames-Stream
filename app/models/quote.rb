class Quote < ApplicationRecord
  validates :name, presence: true

  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  # broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend


  belongs_to :company
end
