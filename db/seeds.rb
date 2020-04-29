nha_mang = ['Viettel', 'Vinaphone', 'Mobifone', 'Vietnammobile', 'ZING', 'Gate', 'Vcoin']
nha_mang.each do |name|
  nhamang = NhaMang.create(ten: name, phan_tram_chiec_khau: 0.67)
  # create menh gia the
  [10000, 20000, 50000, 100000, 200000, 300000, 500000, 1000000].each do |sotien|
    phan_tram_chiec_khau = case name
    when 'Viettel'
      sotien <= 50000 ? 0.4 : 0.69
    when 'Vinaphone'
      sotien <= 50000 ? 0.4 : 0.70
    when 'Mobifone'
      sotien <= 50000 ? 0.4 : 0.65
    when 'Vietnammobile'
      sotien <= 50000 ? 0.4 : 0.73
    when 'ZING'
      sotien <= 50000 ? 0.4 : 0.75
    when 'Gate'
      sotien <= 50000 ? 0.4 : 0.70
    when 'Vcoin'
      sotien <= 50000 ? 0.4 : 0.70
    else
      
    end
    nhamang.menh_gias.create({
      so_tien: sotien,
      phan_tram_chiec_khau: phan_tram_chiec_khau
    })
  end
end
