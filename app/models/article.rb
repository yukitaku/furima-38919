# class Article < ApplicationRecord
#   extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to :category
#   belongs_to :condition
#   belongs_to :period
#   belongs_to :place
#   belongs_to :send
# validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
# validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
# validates :period_id, numericality: { other_than: 1 , message: "can't be blank"}
# validates :place_id, numericality: { other_than: 1 , message: "can't be blank"}
# validates :send_id, numericality: { other_than: 1 , message: "can't be blank"}

# # end
