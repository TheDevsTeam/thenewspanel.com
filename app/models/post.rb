# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#

class Post < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category
  belongs_to :author
  has_many   :comments

  PER_PAGE = 10

  scope :most_recent,        -> { order( published_at: :desc) }
  scope :published,          -> { where(published: true) }

  scope :recent_paginated,   -> (page){ most_recent.paginate(page: page, per_page: PER_PAGE) }

  scope :list_for,    -> (page,tag) do
    if tag.present?
      recent_paginated(page).tagged_with(tag)
    else
      recent_paginated(page)
    end
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def display_day_published
    if published_at.present?
      "Published #{published_at.strftime('%-b %-d, %y')}"
    else
      "Not Published Yet!!!"
    end
  end

  def publish
    update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: nil)
  end

end
