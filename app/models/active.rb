class Active < ActiveHash::Base

  self.data = [
    {id: 0, name: '---'},
    {id: 1, name: '読書'}, 
    {id: 2, name: '筋トレ'}, 
    {id: 3, name: 'ランニング'}, 
    {id: 4, name: 'ウォーキング'}, 
    {id: 5, name: 'プログラミング'}, 
    {id: 6, name: '英会話'}, 
    {id: 7, name: '勉強'}, 
    {id: 8, name: '瞑想'}, 
    {id: 9, name: '掃除'}, 
    {id: 10, name: 'その他'}
]

  include ActiveHash::Associations
  has_many :cans
end
