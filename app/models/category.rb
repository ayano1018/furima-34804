class Category < ActiveHash::Base
self.data = [
    {id: 1, status: "レディース"},
    {id: 2, status: "メンズ"},
    {id: 3, status: "ベビー・キッズ"},
    {id: 4, status: "インテリア・住まい・小物"},
    {id: 5, status: "本・音楽・ゲーム"},
    {id: 6, status: "おもちゃ・ホビー・グッズ"}
    {id: 7, status: "家電・スマホ・カメラ"}
    {id: 8, status: "スポーツ・レジャー"}
    {id: 9, status: "ハンドメイド"}
    {id: 10, status: "その他"}
]

include ActiveHash::Associations
has_many :product

end