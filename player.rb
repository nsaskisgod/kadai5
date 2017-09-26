# coding: utf-8

class Player < Sprite

  def update
    #入力方向に移動
    self.x += Input.x*3
    self.y += Input.y*3

    #画面下には行けない
    if self.y >= Window.height - self.image.height
      self.y -= 3
    end
    #画面上には行けない
    if self.y <= 0
      self.y += 3
    end
    #画面右に行けない
    if self.x >= Window.width - self.image.width
      self.x -= 3
    end
    #画面左には行けない
    if self.x <= 0
      self.x += 3
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.x -= Input.x*3
    self.y -= Input.y*3
  end

end