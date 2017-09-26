# coding: utf-8
require 'dxruby'

#読み込み
require_relative 'player'
require_relative 'enemy'
require_relative 'wall'

#ウィンドウサイズ指定
Window.width  = 800
Window.height = 600

#自機画像読み込み
player_img = Image.load("images.png")
player_img.setColorKey([1, 1, 1])

#敵機画像読み込み
enemy_img = Image.load("enemy_.png")
enemy_img.setColorKey([1, 1, 1])

#壁画像読み込み
wall_img = Image.load("wall_.png")
wall_img.setColorKey([1, 1, 1])

#背景読み込み
back_img = Image.load("back.jpg")

#自機の生成
player = Player.new(400, 500, player_img)

#敵機の生成(ループ数＝敵機の数)
enemies = []
30.times do
  enemies << Enemy.new(rand(700)+30, rand(500)+30, enemy_img)
end

#壁の生成
walls1 = []
walls2 = []
walls3 = []
walls4 = []
(0..32).each do |i|
  walls1 << Wall.new(30*i, rand(10), wall_img)
end
(0..32).each do |i|
  walls2 << Wall.new(30*i, 550+rand(10), wall_img)
end
(0..24).each do |i|
  walls2 << Wall.new(rand(10), 30*i, wall_img)
end
(0..24).each do |i|
  walls2 << Wall.new(750+rand(10), 30*i, wall_img)
end

#メインループ
Window.loop do
  #Escで終了
  break if Input.keyPush?(K_ESCAPE)

  #背景の描画
  Window.draw( 0, 0, back_img, z=0 )

  #敵機すべての状態の更新と描画
  Sprite.update(enemies)
  Sprite.draw(enemies)

  #自機の状態の更新と描画
  player.update
  player.draw

  #壁すべての状態更新と描画
  Sprite.update(walls1)
  Sprite.draw(walls1)
  Sprite.update(walls2)
  Sprite.draw(walls2)

  # 当たり判定
  Sprite.check(player, enemies, hit=:hit)
  Sprite.check(walls1, player)
  Sprite.check(walls2, player)
  Sprite.check(enemies, walls1)
  Sprite.check(enemies, walls2)

end