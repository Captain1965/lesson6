#encoding utf-8
=begin
-Имеет номер (произвольная строка) (number) 
эти данные указываются при создании экземпляра класса
-Может набирать скорость (speed)
-Может возвращать текущую скорость (curent_speed)
-Может тормозить (сбрасывать скорость до нуля)(stop)
-Может принимать маршрут следования (объект класса Route). 
-При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
-Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, 
но только на 1 станцию за раз. (arrive_train)
-Возвращать предыдущую станцию, текущую, следующую, на основе маршрута 
=end
require_relative 'manufacturer_name'
require_relative 'instance_counter' 

class Train

  include InstanceCounter
  include ManufacturerName
  attr_accessor :number, :route, :wagons, :wagon, :trains
  attr_reader :curent_speed, :curent_station_index

  def self.find(number_trains)
      @@trains.each_with_index do |item|
       item.number == number_trains ? (return trains[index]) : (return nill)
     end
  end 

  def initialize(number)
    @@trains = []
    @number = number
    @curent_speed = 0
    @route = []
    @wagons = []  
  end

  def add_wagon(wagon)
    @wagons << wagon
  end 

  def delete_wagon 
    if @wagons.size > 0
      @wagons.delete_at(-1)
    else 
      puts 'нет вагонов для удаления'
    end        
  end 
  
  def speed(value)
    @curent_speed +=value 
  end

  def stop
    @curent_speed = 0
  end

  def add_route
    @curent_station_index = 0
  end 

  def departure
    @curent_station_index +=1 if @curent_station_index < @route.stations.size-1
  end

  def arrival
    @curent_station_index -=1 if @curent_station_index >= 1
  end
end 