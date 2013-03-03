class Review < ActiveRecord::Base
  attr_accessible :name, :review, :year

  def url_helpers
    Rails.application.routes.url_helpers
  end

  def as_json(options={})
    super(options).merge({
      :reviews_path       => url_helpers.reviews_path,
      :edit_review_path   => url_helpers.edit_review_path(self.to_param),
      :review_path        => url_helpers.review_path(self.to_param)
      })
  end
end
