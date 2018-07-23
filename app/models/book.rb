class Book < ApplicationRecord
  # requires title:
  validates :title,
    presence: true
  # requires author:
  validates :author,
    presence: true
  # requires description:
  validates :description,
    presence: true
  # requires img and forces it to be a valid URI:
  validates :img,
    presence: true,
    format: {
      with: URI::regexp(%w(http https)),
      message: 'must be a valid URI'
    }

end
