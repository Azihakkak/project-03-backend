User.destroy_all
u1 = User.create :name => 'Azi', :email => 'azi@gmail.com', :password => 'chicken', :admin => true
u2 = User.create :name => 'Yuki', :email => 'yuki@gmail.com', :password => 'chicken'
u3 = User.create :name => 'Carmina', :email => 'carmina@gmail.com', :password => 'chicken'
puts "#{User.count} users created"

Service.destroy_all
s1 = Service.create :title => 'Makeup', :duration => '60', :cost => '90', :description => 'Natural, sexy or dramatic, we\'ll create the perfect look for you. 60 min'
s2 = Service.create :title => 'Makeup Lesson', :duration => '90', :cost => '130', :description => 'Step-by-step instructions on how to create the technique you want to master. 90 min.'
s3 = Service.create :title => 'Special Occasion Makeup', :duration => '90', :cost => '150', :description => 'A high touch service for your most special moments- red carpet, galas, parties, photoshoots and more. 90 min.'
puts "#{Service.count} services created"

Appointment.destroy_all
a1 = Appointment.create :appointment_date => DateTime.parse("20/06/2020 08:00"), :location => 'QT Sydney,49 Market St, Sydney NSW 2000'
a2 = Appointment.create :appointment_date => DateTime.parse("15/08/2020 09:00"), :location => 'Four Seasons Hotel Sydney,199 George St, The Rocks NSW 2000'
a3 = Appointment.create :appointment_date => DateTime.parse("03/10/2020 07:00"), :location => 'The Langham, Sydney,89-113 Kent St, Millers Point NSW 2000'
puts "#{Appointment.count} appointments created"



u2.appointments << a1 << a2
u3.appointments << a3
s1.appointments << a1
s2.appointments << a2
s3.appointments << a3
