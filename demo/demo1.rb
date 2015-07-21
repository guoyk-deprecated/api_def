name    "YMXian"
version "v3.0"

group "店铺查询" do |g|
  g.desc "用来查询店铺的API"

  g.entry "通过定位获取店铺" do |e|
    e.desc "本接口通过使用定位信息获取店铺和商品，目的为了在用户没有选择地址和自提点得情况下依然可以展示"
    e.path   '/v3/stores/get_by_location'
    e.method :get

    e.request "Case 1" do |p|
      p.desc "aaaabb"
      p.param "token", optional: true, desc: '用户token', type: 'String'
    end

    e.request "Case 2" do |p|
      p.desc "aaaabb"
    end
  end
end
