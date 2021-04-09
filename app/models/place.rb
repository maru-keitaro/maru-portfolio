class Place < ActiveHash::Base

  self.data = [
    {id: 0, name: '---'},
    {id: 1, name: '自宅'}, 
    {id: 2, name: '公園'}, 
    {id: 3, name: 'ジム'}, 
    {id: 4, name: '職場'}, 
    {id: 5, name: '教室'}, 
    {id: 6, name: 'カフェ'}, 
    {id: 7, name: '図書館'}, 
    {id: 8, name: '屋外'}, 
    {id: 9, name: 'その他'} 
]

  include ActiveHash::Associations
  has_many :cans
end