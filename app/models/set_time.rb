class SetTime < ActiveHash::Base

  self.data = [
    {id: 0, name: '---'},
    {id: 1, name: '15分'}, 
    {id: 2, name: '30分'}, 
    {id: 3, name: '45分'}, 
    {id: 4, name: '1時間00分'}, 
    {id: 5, name: '1時間15分'}, 
    {id: 6, name: '1時間30分'}, 
    {id: 7, name: '1時間45分'}, 
    {id: 8, name: '2時間00分'}, 
    {id: 9, name: '2時間15分'},
    {id: 10, name: '2時間30分'},
    {id: 11, name: '2時間45分'},
    {id: 12, name: '3時間00分'},
    {id: 13, name: '3時間以上'} 
]

  include ActiveHash::Associations
  has_many :cans
end
