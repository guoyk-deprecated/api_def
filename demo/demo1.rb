name    "YMXian"
version "v3.0"

group "店铺查询" do |g|
  g.desc "用来查询店铺的API"

  g.entry "通过定位获取" do |e|
    e.desc "本接口通过使用定位信息获取店铺和商品，目的为了在用户没有选择地址和自提点得情况下依然可以展示"
  end
end
