class Proposal < ApplicationRecord
  belongs_to :user
  has_one :category
  include Img1Uploader::Attachment.new(:img1)
  include Img2Uploader::Attachment.new(:img2)
  include Img3Uploader::Attachment.new(:img3)
end
