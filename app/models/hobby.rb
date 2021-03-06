class Hobby < ApplicationRecord
  DIFFICULTIES = %w( easy average hard very-hard )
  AVAILABLE_TAGS = %w( indoor outdoor computer satire )

  acts_as_taggable

  has_many :resources, dependent: :destroy
  has_many :affiliate_links, dependent: :destroy
  has_many :visuals, dependent: :destroy

  validates :slug, uniqueness: true

  accepts_nested_attributes_for :resources, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :affiliate_links, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :visuals, reject_if: :all_blank, allow_destroy: true

  before_validation :set_slug, if: :name_changed?

  private

  def set_slug
    self.slug = self.name.parameterize
  end
end
