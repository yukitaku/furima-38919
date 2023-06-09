class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :period
  belongs_to :place
  belongs_to :okuru

  validates :image, presence: true
  validates :item_name,length: { maximum: 40 },presence: true
  validates :catch_copy,length: { maximum: 1000 },presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を指定してください"} ,presence: true
  validates :condition_id, numericality: { other_than: 1 , message: "を指定してください"}, presence: true
  validates :period_id, numericality: { other_than: 1 , message: "を指定してください"}, presence: true
  validates :place_id, numericality: { other_than: 1 , message: "を指定してください"}, presence: true
  validates :okuru_id, numericality: { other_than: 1 , message: "を指定してください"}, presence: true
  validates :price,numericality:{ only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 ,message: 'は300~9999999のの半角数字を使用してください' },  presence: true
end
