# coding: utf-8

class Enemy < Sprite

  def update

    self.y += rand(7)-3

    #画面下には行けない
    if self.y >= Window.height - self.image.height - 50
      self.y -= 1
    end
    #画面上には行けない
    if self.y <= 50
      self.y += 1
    end
    #画面右に行けない
    if self.x >= Window.width - self.image.width - 50
      self.x -= 1
    end
    #画面左には行けない
    if self.x <= 50
      self.x += 1
    end

  end

=begin
  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish
  end
=end
  def hit(obj)
    self.vanish
  end

end